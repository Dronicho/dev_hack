import 'dart:convert';

import 'package:dev_hack2/domain/models/user.dart';

import 'base_repostitory.dart';

class UserRepository extends BaseRepository {
  Future<User?> getUser() async {
    print('getting user');
    try {
      var res = await api.client.get(Uri.parse(api.baseUrl + '/user/me'));
      final data = jsonDecode(res.body);
      print(data);
      return User.fromJson(data['user']);
    } catch (err) {
      print('huy');
      print(err);
    }
  }
}
