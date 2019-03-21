library blackboard.rest.terms;

import 'dart:async' show Future;

import 'src/oauth2/access_token.dart';

import 'src/terms/bb_rest_terms.dart';
import 'src/terms/term.dart';

/// The [getTermsInstance] function...
Terms getTermsInstance (String host, AccessToken token) =>
  new BbRestTerms (host, token);

/// The [Terms] abstract class...
abstract class Terms {
  /// The [getTerms] abstract method...
  Future<Iterable<Term>> getTerms();

  /// The [createTerm] abstract method...
  Future<void> createTerm (Term term);

  /// The [getTerm] abstract method...
  Future<Term> getTerm (String termId);

  /// The [updateTerm] abstract method...
  Future<void> updateTerm (String termId, Term term);
}
