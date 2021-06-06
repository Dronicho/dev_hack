import 'dart:async';
import 'dart:convert';

import 'package:dev_hack2/constants.dart';
import 'package:dev_hack2/domain/models/user.dart';
import 'package:dev_hack2/domain/repositories/base_repostitory.dart';

enum AuthenticationStatus {
  unknown,
  authenticated,
  unauthenticated,
  authenticatedFirstTime
}

class AuthenticationRepository extends BaseRepository {
  final _controller = StreamController<AuthenticationStatus>();

  Stream<AuthenticationStatus> get status async* {
    yield await _trySavedLogin();
    yield* _controller.stream;
  }

  String _username = '';

  Future<AuthenticationStatus> _trySavedLogin() async {
    final token = storage.get(AUTH_SAVE_KEY);
    final firstTime = storage.getBool(FIRST_TIME_KEY);
    print(firstTime);
    if (token != null) {
      if (firstTime ?? true) {
        return AuthenticationStatus.unauthenticated;
      }
      return AuthenticationStatus.authenticated;
    }
    return AuthenticationStatus.unauthenticated;
  }

  Future<void> updateUser(
      {required String name,
      required String lastName,
      required String sex,
      required List<String> clubs,
      bool updateFirstTime = false}) async {
    // final res = await api.client.post(Uri.parse(api.baseUrl + '/user'), body: {
    //   'first_name': name,
    //   'last_name': lastName,
    //   'sex': sex,
    //   'username': _username,
    //   'clubs': clubs,
    // });
    // print(res.body);
    // if (res.statusCode == 200) {
    await storage.saveBool(FIRST_TIME_KEY, false);
    _controller.add(AuthenticationStatus.authenticated);
    // }
  }

  Future<User?> logIn({
    required bool firstTime,
    required String username,
    required String password,
  }) async {
    var res = await client.post(Uri.parse(api.baseUrl + '/auth'),
        headers: {'Content-Type': 'application/json'},
        body: {'username': username, 'password': password});
    final ans = jsonDecode(res.body);
    _username = username;
    print(ans['message']);
    if (res.statusCode == 200) {
      final token = jsonDecode(res.body)['token'];
      await storage.save(AUTH_SAVE_KEY, token);
      if (firstTime) {
        _controller.add(AuthenticationStatus.authenticatedFirstTime);
      } else {
        _controller.add(AuthenticationStatus.authenticated);
      }
    }
  }

  void logOut() {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}
