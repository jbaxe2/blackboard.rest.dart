library blackboard.rest.implementation.users;

import 'dart:async' show Future;

import '../../users.dart';

import '../_scaffolding/configuration/endpoints.dart' show users;
import '../_scaffolding/error/improper_user.dart';
import '../_scaffolding/factory/user_factory.dart';
import '../_scaffolding/bb_rest_services.dart';

import '../oauth2/access_token.dart';

import 'user.dart';

/// The [BbRestUsers] class...
class BbRestUsers extends BlackboardRestServices implements Users {
  /// The [BbRestUsers] constructor...
  BbRestUsers (String host, AccessToken token) : super (host, token);

  /// The [getUsers] method...
  @override
  Future<Iterable<User>> getUsers() async {
    String endpoint = users['users'];

    Iterable<Object> rawUsers;

    try {
      rawUsers = (await connector.sendBbRestRequest (endpoint) as Map)['results'];
    } catch (e) {
      throw e as ImproperUser;
    }

    return (new UserFactory()).createAll (rawUsers.cast());
  }

  /// The [createUser] method...
  @override
  Future<void> createUser (User user) async {}

  /// The [getUser] method...
  @override
  Future<User> getUser (String userId) async {
    String endpoint = users['user'].replaceFirst ('{userId}', userId);

    Object rawUser;

    try {
      rawUser = await connector.sendBbRestRequest (endpoint);
    } catch (e) {
      throw e as ImproperUser;
    }

    return (new UserFactory()).create (rawUser);
  }

  /// The [updateUser] method...
  @override
  Future<void> updateUser (String userId, User user) async {}
}
