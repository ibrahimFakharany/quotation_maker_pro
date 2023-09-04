import 'dart:convert';
import 'dart:io';

import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dio/dio.dart';

import '../../pojo/customer.dart';

class CustomerApiProvider {
  final addNewCustomerURL = 'http://16.171.132.148:8000/api/v1/customers/';
  final getAllCustomersURL = 'http://16.171.132.148:8000/api/v1/customers/';
  final updateCustomerURL = 'http://16.171.132.148:8000/api/v1/customers/';

  Dio getDio() {
    final Dio _dio = Dio();
    _dio..interceptors.add(CurlLoggerDioInterceptor());
    return _dio;
  }

  Future<Customer> addNewCustomer(Customer customer) async {
    var response = await getDio().post(addNewCustomerURL,
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }),
        data: jsonEncode(customer.toJson()));
    return Customer.fromJson(response.data["data"]);
  }

  Future<List<Customer>> getCustomers() async {
    var response = await getDio().get(getAllCustomersURL,
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }));
    var data = response.data;
    var jCustomers = data["data"];
    var customers = <Customer>[];
    for (var jCustomer in jCustomers) {
      customers.add(Customer.fromJson(jCustomer));
    }
    return customers;
  }

  Future<Customer> updateCustomer(Customer customer) async {
    var response = await getDio().put(
      updateCustomerURL + customer.id,
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      }),
      data: jsonEncode(
        customer.toJson(),
      ),
    );
    return Customer.fromJson(response.data["data"]);
  }
}
