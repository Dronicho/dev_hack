import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:dev_hack2/domain/models/club.dart';
import 'package:dev_hack2/domain/services/location.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;

import 'package:dev_hack2/domain/models/models.dart';
import 'package:dev_hack2/domain/services/api.dart';
import 'package:get_it/get_it.dart';

class Tuple<T, V> {
  const Tuple(this.left, this.right);

  final T left;
  final V right;

  operator [](int i) {
    if (i == 0) return left;
    if (i == 1) return right;
    throw RangeError.index(i, this);
  }
}

class EventRepository {
  final _api = GetIt.I<Api>();
  final _location = GetIt.I<LocationService>();

  Future<void> participate(Event event) async {
    final locationData = await _location.getLocation();
    print(locationData);
    print(event.id);
    await _api.client.post(Uri.parse(_api.baseUrl + '/participate'), body: {
      'event_id': event.id,
      'user_location': '${locationData.latitude} ${locationData.longitude}'
    });
  }

  Future<void> register(Event event) async {
    await _api.client.post(Uri.parse(_api.baseUrl + '/registerToEvent'), body: {
      'event_id': event.id,
    });
  }

  Future<Tuple<List<Club>, List<Event>>> loadEvents() async {
    final res = await _api.client.get(Uri.parse(_api.baseUrl + '/feed'));
    print(jsonDecode(res.body)['clubs_list']);
    print(jsonDecode(res.body)['events_list']);

    List<Club> clubs = jsonDecode(res.body)['clubs_list']
        .map((e) => Club.fromJson(e))
        .toList()
        .cast<Club>();
    List<Event> events = jsonDecode(res.body)['events_list']
        .map((e) => Event.fromJson(e))
        .toList()
        .cast<Event>();
    clubs = clubs
        .map((e) => e.copyWith(
            incomingEvents: events
                .where((element) => element.clubs.contains(e.name))
                .toList()))
        .toList();

    // print(events);

    return Tuple(clubs, events);
  }

  Future<void> loadAttachment(File file, void Function(String) onLoad) async {
    var stream = new http.ByteStream(DelegatingStream.typed(file.openRead()));
    var length = await file.length();

    var uri = Uri.parse(_api.baseUrl + '/attachment');

    var request = new http.MultipartRequest("POST", uri);
    var multipartFile = new http.MultipartFile('file', stream, length,
        filename: basename(file.path));

    request.files.add(multipartFile);
    request.headers
        .addAll({'Authorization': 'Bearer ${_api.client.userAccessToken}'});
    var response = await request.send();
    response.stream.transform(utf8.decoder).listen(onLoad);
  }

  Future<Event> addEvent(Event event) async {
    final res = await _api.client
        .post(Uri.parse(_api.baseUrl + '/event'), body: event.toJson());
    final data = jsonDecode(res.body);
    print(data);

    return Event.fromJson(data['event']);
  }
}
