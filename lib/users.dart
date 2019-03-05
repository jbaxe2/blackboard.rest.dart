library blackboard.rest.users;

import 'dart:async' show Future;

import 'src/users/user.dart';

/// The [Users] abstract class...
abstract class Users {
  /// The [getUsers] abstract method...
  Future<Iterable<User>> getUsers();

  /// The [createUser] abstract method...
  Future<bool> createUser (User user);

  /// The [getUser] abstract method...
  Future<User> getUser (String userId);

  /// The [updateUser] abstract method...
  Future<bool> updateUser (String userId, User user);
}
