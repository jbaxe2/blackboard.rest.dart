library blackboard.rest.services;

import '../_scaffolding/error/rest_exception.dart';
export '../_scaffolding/error/rest_exception.dart';

import '../oauth2/access_token.dart';

import 'connector/connector.dart';

/// The [BlackboardRestServices] abstract class...
abstract class BlackboardRestServices {
  BlackboardRestConnector _connector;

  BlackboardRestConnector get connector => _connector;

  /// The [BlackboardRestServices] constructor...
  BlackboardRestServices (String host, AccessToken token) {
    _connector = RestConnectorFactory.buildRestConnector (host, token);
  }

  /// The [throwError] abstract method...
  BlackboardRestException throwError (covariant BlackboardRestException error);
}
