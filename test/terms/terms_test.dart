@TestOn('vm')
library blackboar.rests.tests.terms;

import 'package:test/test.dart';

import 'package:blackboard.rest/terms.dart';

import 'package:blackboard.rest/src/_scaffolding/error/invalid_term.dart';

import 'package:blackboard.rest/src/terms/bb_rest_terms.dart';
import 'package:blackboard.rest/src/terms/term.dart';

import '../test_authorizer.dart';
import '../testable.dart';

class TermsTester extends TestAuthorizer implements Testable {
  TermsTester();

  /// The [run] method...
  @override
  void run() {
    group ('Terms:', () {
      _testGetValidTermsInstance();
      _testGetAllTerms();
      _testGetTermByPrimaryId();
    });
  }

  /// The [_testGetValidTermsInstance] method...
  void _testGetValidTermsInstance() {
    test ('Get a valid terms service instance.', () async {
      Terms termsService = getTermsInstance (host, await authorizeForTests());

      assert (null != termsService);
      expect ((termsService is BbRestTerms), true);
    });
  }

  /// The [_testGetAllTerms] method...
  void _testGetAllTerms() {
    test ('Get all of the terms.', () async {
      Terms termsService = getTermsInstance (host, await authorizeForTests());

      List<Term> terms;
      Exception error;

      try {
        terms = await termsService.getTerms();
      } catch (e) {
        error = e;
      }

      assert (null == error);
      assert (null != terms);

      expect (terms.isNotEmpty, true);
    });
  }

  /// The [_testGetTermByPrimaryId] method...
  void _testGetTermByPrimaryId() {
    test ('Get a term by its primary (internal) ID.', () async {
      Terms termsService = getTermsInstance (host, await authorizeForTests());

      Term term;
      Exception error;

      try {
        term = await termsService.getTerm ('_380_1');
      } catch (e) {
        print (e.toString());
        error = e;
      }

      assert (null == error);
      assert (null != term);

      expect ('_380_1' == term.id, true);
    });
  }
}
