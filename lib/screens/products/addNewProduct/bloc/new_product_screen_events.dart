import 'package:equatable/equatable.dart';

import '../../../../pojo/customer.dart';
import '../../../../pojo/product.dart';

abstract class NewProductEvent extends Equatable {
  const NewProductEvent();

  @override
  List<Object> get props => [];
}

class AddNewProductEvent extends NewProductEvent {
  Product customer;

  AddNewProductEvent(this.customer);
}

class EditProductEvent extends NewProductEvent {
  Product product;

  EditProductEvent(this.product);
}
