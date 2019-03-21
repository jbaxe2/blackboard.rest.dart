library blackboard.rest.implementation.terms;

import 'dart:async' show Future;

import '../../terms.dart';

import '../_scaffolding/configuration/endpoints.dart' show terms;
import '../_scaffolding/error/invalid_term.dart';
import '../_scaffolding/factory/term_factory.dart';
import '../_scaffolding/bb_rest_services.dart';

import '../oauth2/access_token.dart';

import 'term.dart';

/// The [BbRestTerms] class...
class BbRestTerms extends BlackboardRestServices implements Terms {
  /// The [BbRestTerms] constructor...
  BbRestTerms (String host, AccessToken token) : super (host, token);

  /// The [getTerms] method...
  @override
  Future<Iterable<Term>> getTerms() async {
    Iterable<Object> rawTerms;

    try {
      rawTerms =
        (await connector.sendBbRestRequest (terms['terms']) as Map)['results'];
    } catch (e) {
      throw e as InvalidTerm;
    }

    return (new TermFactory()).createAll (rawTerms.cast());
  }

  /// The [createTerm] method...
  @override
  Future<void> createTerm (Term term) async {}

  /// The [getTerm] method...
  @override
  Future<Term> getTerm (String termId) async {
    String endpoint = terms['term'].replaceFirst('termId', termId);
    Object rawTerm;

    try {
      rawTerm = await connector.sendBbRestRequest (endpoint);
    } catch (e) {
      throw e as InvalidTerm;
    }

    return (new TermFactory()).create (rawTerm);
  }

  /// The [updateTerm] method...
  @override
  Future<void> updateTerm (String termId, Term term) async {}
}
