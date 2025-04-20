import 'package:modu_3_dart_study/PR2025-03-31/model/users/user.dart';

abstract interface class UserDataSource {
  Future<List<User>> getUsers();
}
