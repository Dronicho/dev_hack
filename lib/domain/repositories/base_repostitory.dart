import 'package:dev_hack2/domain/services/api.dart';
import 'package:dev_hack2/domain/services/storage.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

abstract class BaseRepository {
  final api = GetIt.I<Api>();
  final storage = GetIt.I<Storage>();

  Client get client => api.client;
}
