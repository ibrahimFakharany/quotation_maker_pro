import 'dart:convert';
import 'dart:io';

import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dio/dio.dart';

import '../../pojo/customer.dart';
import '../../pojo/product.dart';

class ProductsApiProvider {
  final addNewProductURL = 'http://16.171.132.148:8000/api/v1/products/';
  final getAllProductsURL = 'http://16.171.132.148:8000/api/v1/products/';
  final updateProductURL = 'http://16.171.132.148:8000/api/v1/products/';

  Dio getDio() {
    final Dio _dio = Dio();
    _dio..interceptors.add(CurlLoggerDioInterceptor());
    return _dio;
  }

  Future<Product> addNewProduct(Product product) async {
    var response = await getDio().post(addNewProductURL,
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }),
        data: jsonEncode(product.toJson()));
    return Product.fromJson(response.data["data"]);
  }

  Future<List<Product>> getProducts() async {
    var response = await getDio().get(getAllProductsURL,
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }));
    var data = response.data;
    var jProducts = data["data"];
    var products = <Product>[];
    for (var jProduct in jProducts) {
      products.add(Product.fromJson(jProduct));
    }
    return products;
  }

  Future<Product> updateProduct(Product product) async {
    var response = await getDio().put(
      updateProductURL + product.id,
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      }),
      data: jsonEncode(
        product.toJson(),
      ),
    );
    return Product.fromJson(response.data["data"]);
  }
}
