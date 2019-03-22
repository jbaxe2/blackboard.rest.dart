library blackboard.rest.factory.user;

import '../../users/name.dart';
import '../../users/user.dart';

import '../error/improper_user.dart';

import 'bb_rest_dto_factory.dart';

/// The [UserFactory] class...
class UserFactory implements BlackboardRestDtoFactory {
  /// The [UserFactory] constructor...
  UserFactory();

  /// The [createAll] method...
  @override
  Iterable<User> createAll (covariant Iterable<Map<String, Object>> rawUsers) {
    var users = new List<User>();

    rawUsers.forEach ((rawUser) => users.add (create (rawUser)));

    return users;
  }

  /// The [create] method...
  @override
  User create (covariant Map<String, Object> rawUser) {
    if (!(rawUser.containsKey ('id') &&
          rawUser.containsKey ('uuid') &&
          rawUser.containsKey ('externalId') &&
          rawUser.containsKey ('userName') &&
          rawUser.containsKey ('created') &&
          rawUser.containsKey ('lastLogin') &&
          rawUser.containsKey ('name'))) {
      throw new ImproperUser ('Missing required information for the user.');
    }

    return _parseUser (rawUser);
  }

  /// The [_parseUser] method...
  User _parseUser (covariant Map<String, Object> rawUser) {
    return new User (
      rawUser['id'], rawUser['uuid'], rawUser['externalId'], rawUser['userName'],
      (rawUser['contact'] as Map)['email'],
      DateTime.parse (rawUser['created']), DateTime.parse (rawUser['lastLogin']),
      _parseName (rawUser['name'])
    );
  }

  /// The [_parseName] method...
  Name _parseName (covariant Map<String, Object> rawName) =>
    new Name (rawName['given'], rawName['family']);
}
