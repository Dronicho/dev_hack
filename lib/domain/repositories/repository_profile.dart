import 'dart:convert';

import 'package:dev_hack2/domain/models/user.dart';
import 'package:dev_hack2/domain/repositories/base_repostitory.dart';

class ProfileRepository extends BaseRepository {
  Future<void> updateUser(
      {required String name,
      required String lastName,
      required String sex,
      required List<String> clubs}) async {
    final res = await api.client.put(Uri.parse(api.baseUrl + '/user'), body: {
      'name': name,
      'last_name': lastName,
      'sex': sex,
      'clubs': clubs
    });
    
  }
}
