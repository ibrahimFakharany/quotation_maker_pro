import '../../pojo/customer.dart';
import 'customer_api_provider.dart';

class CustomerApiRepository {
  final _provider = CustomerApiProvider();

  Future<Customer> addNewCustomer(Customer customer) {
    return _provider.addNewCustomer(customer);
  }
  Future<Customer> updateCustomer(Customer customer) {
    return _provider.updateCustomer(customer);
  }

  Future<List<Customer>> getCustomers() {
    return _provider.getCustomers();
  }
}

class NetworkError extends Error {}
