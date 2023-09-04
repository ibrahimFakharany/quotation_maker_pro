import '../../pojo/term.dart';
import 'term_api_provider.dart';

class TermApiRepository {
  final _provider = TermsApiProvider();

  Future<Term> addNewTerm(Term term) {
    return _provider.addNewTerm(term);
  }

  Future<Term> updateTerm(Term term) {
    return _provider.updateTerm(term);
  }

  Future<List<Term>> getTerms() {
    return _provider.getTerms();
  }
}

class NetworkError extends Error {}
