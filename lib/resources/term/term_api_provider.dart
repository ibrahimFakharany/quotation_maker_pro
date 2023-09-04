import 'dart:convert';
import 'dart:io';

import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dio/dio.dart';

import '../../pojo/term.dart';

class TermsApiProvider {
  final addNewTermURL = 'http://16.171.132.148:8000/api/v1/terms/';
  final getAllTermsURL = 'http://16.171.132.148:8000/api/v1/terms/';
  final updateTermURL = 'http://16.171.132.148:8000/api/v1/terms/';

  Dio getDio() {
    final Dio _dio = Dio();
    _dio..interceptors.add(CurlLoggerDioInterceptor());
    return _dio;
  }

  Future<Term> addNewTerm(Term term) async {
    var response = await getDio().post(addNewTermURL,
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }),
        data: jsonEncode(term.toJson()));
    return Term.fromJson(response.data["data"]);
  }

  Future<List<Term>> getTerms() async {
    var response = await getDio().get(getAllTermsURL,
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }));
    var data = response.data;
    var jTerms = data["data"];
    var terms = <Term>[];
    for (var jTerm in jTerms) {
      terms.add(Term.fromJson(jTerm));
    }
    return terms;
  }

  Future<Term> updateTerm(Term term) async {
    var response = await getDio().put(
      updateTermURL + term.id,
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      }),
      data: jsonEncode(
        term.toJson(),
      ),
    );
    return Term.fromJson(response.data["data"]);
  }
}
