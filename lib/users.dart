library blackboard.rest.users;

import 'dart:async' show Future;

import 'src/oauth2/access_token.dart';

import 'src/users/bb_rest_users.dart';
import 'src/users/user.dart';

export 'src/users/user.dart';

/// The [getUsersInstance] function...
Users getUsersInstance (String host, AccessToken token) =>
  new BbRestUsers (host, token);

/// The [Users] abstract class...
abstract class Users {
  /// The [getUsers] abstract method...
  Future<Iterable<User>> getUsers();

  /// The [createUser] abstract method...
  Future<void> createUser (User user);

  /// The [getUser] abstract method...
  Future<User> getUser (String userId);

  /// The [updateUser] abstract method...
  Future<void> updateUser (String userId, User user);
}
