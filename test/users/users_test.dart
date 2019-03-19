@TestOn('vm')
library blackboard.rest.test.users;

import 'package:test/test.dart';

import 'package:blackboard.rest/src/users/bb_rest_users.dart';
import 'package:blackboard.rest/src/users/user.dart';

import 'package:blackboard.rest/users.dart';

import '../test_authorizer.dart';
import '../testable.dart';

/// The [UsersTester] class...
class UsersTester extends TestAuthorizer implements Testable {
  /// The [UsersTester] constructor...
  UsersTester();

  /// The [run] method...
  @override
  void run() {
    group ('Users', () {
      _testGetValidUsersInstance();
      _testGetUserByPrimaryId();
      _testGetUserByExternalId();
      _testGetUserByUserName();
    });
  }

  /// The [_testGetValidUsersInstance] method...
  void _testGetValidUsersInstance() {
    test ('Get a valid users instance.', () async {
      Users usersService = getUsersInstance (host, await authorizeForTests());

      assert (null != usersService);
      expect (usersService is BbRestUsers, true);
    });
  }

  /// The [_testGetUserByPrimaryId] method...
  void _testGetUserByPrimaryId() {
    test ('Get a user by his or her primary ID.', () async {
      Users bbRestUsers = getUsersInstance (host, await authorizeForTests());

      Exception error;
      User user;

      try {
        user = await bbRestUsers.getUser ('_27_1');
      } catch (e) {
        error = e;
      }

      assert (null == error);
      assert (null != user);

      expect (('_27_1' == user.id), true);
    });
  }

  /// The [_testGetUserByExternalId] method...
  void _testGetUserByExternalId() {
    test ('Get a user by his or her external ID.', () async {
      Users bbRestUsers = getUsersInstance (host, await authorizeForTests());

      Exception error;
      User user;

      try {
        user = await bbRestUsers.getUser ('externalId:jaxenroth');
      } catch (e) {
        error = e;
      }

      assert (null == error);
      assert (null != user);

      // This particular user does not have an external ID, so value is null.
      expect ((null == user.externalId), true);
    });
  }

  /// The [_testGetUserByUserName] method...
  void _testGetUserByUserName() {
    test ('Get a user by his or her username.', () async {
      Users bbRestUsers = getUsersInstance (host, await authorizeForTests());

      Exception error;
      User user;

      try {
        user = await bbRestUsers.getUser ('userName:jaxenroth');
      } catch (e) {
        error = e;
      }

      assert (null == error);
      assert (null != user);

      expect (('jaxenroth' == user.userName), true);
    });
  }
}
