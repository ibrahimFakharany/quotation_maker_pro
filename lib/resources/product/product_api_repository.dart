import '../../pojo/customer.dart';
import '../../pojo/product.dart';
import 'product_api_provider.dart';

class ProductApiRepository {
  final _provider = ProductsApiProvider();

  Future<Product> addNewProduct(Product product) {
    return _provider.addNewProduct(product);
  }

  Future<Product> updateProduct(Product term) {
    return _provider.updateProduct(term);
  }

  Future<List<Product>> getProducts() {
    return _provider.getProducts();
  }
}

class NetworkError extends Error {}
