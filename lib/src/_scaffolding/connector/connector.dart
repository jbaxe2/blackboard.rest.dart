library blackboard.rest.connector;

import 'dart:async' show Future;
import 'dart:convert' show json;
import 'dart:io' show HttpHeaders;

import 'package:http/http.dart' as http;

import '../../oauth2/access_token.dart';

import '../configuration/endpoints.dart';

import '../error/rest_exception.dart';

/// The [BlackboardRestConnector] abstract class...
abstract class BlackboardRestConnector {
  /// The [sendBbRestRequest] abstract method...
  Future<dynamic> sendBbRestRequest (
    String endpoint,
    {String method = 'get', Map<String, Object> data, int useVersion = 1}
  );
}

/// The [RestConnectorFactory] abstract class...
abstract class RestConnectorFactory {
  /// The [buildRestConnector] static method...
  static BlackboardRestConnector buildRestConnector (String host, AccessToken token) {
    return new _BlackboardRestConnector (host, token);
  }
}

/// The [_BlackboardRestConnector] class...
class _BlackboardRestConnector implements BlackboardRestConnector {
  final String host;

  final AccessToken accessToken;

  /// The [_BlackboardRestConnector] constructor...
  _BlackboardRestConnector (this.host, this.accessToken);

  /// The [sendBbRestRequest] abstract method...
  @override
  Future<dynamic> sendBbRestRequest (
    String endpoint,
    {String method = 'get', Map<String, Object> data, int useVersion = 1}
  ) async {
    if (endpoint.isEmpty) {
      throw new BlackboardRestException (
        'Required information to send a Blackboard REST request was not provided.'
      );
    }

    Uri endpointUri = Uri.parse (
      '$host${1 == useVersion ? base : baseV2}$endpoint'
    );

    Map<String, String> httpHeaders = {
      HttpHeaders.authorizationHeader: 'Bearer ${accessToken.access_token}'
    };

    http.Response response;

    try {
      switch (method.toLowerCase()) {
        case 'get':
          response = await _handleGetRequest (endpointUri, httpHeaders, data);
          break;
        case 'post':
          response = await _handlePostRequest (endpointUri, httpHeaders, data);
          break;
        default:
          throw new BlackboardRestException (
            'The provided HTTP method ($method) is not currently supported.'
          );
      };
    } catch (e) {
      throw new BlackboardRestException (e.toString());
    }

    return (null == response) ? {} : json.decode (response.body);
  }

  /// The [_handleGetRequest] method...
  Future<http.Response> _handleGetRequest (
    Uri endpointUri, Map<String, String> httpHeaders, [Map<String, Object> data]
  ) async {
    httpHeaders[HttpHeaders.contentTypeHeader] = 'application/json';

    if ((null != data) && data.isNotEmpty) {
      endpointUri.queryParameters.addAll (data);
    }

    return await http.get (endpointUri, headers: httpHeaders);
  }

  /// The [_handlePostRequest] method...
  Future<http.Response> _handlePostRequest (
    Uri endpointUri, Map<String, String> httpHeaders, [Map<String, Object> data]
  ) async {
    httpHeaders[HttpHeaders.contentTypeHeader] = 'application/x-www-form-urlencoded';

    if (null == data) {
      data = {};
    }

    return await http.post (endpointUri, headers: httpHeaders, body: data);
  }
}
