import 'package:equatable/equatable.dart';

import '../../../../pojo/customer.dart';
import '../../../../pojo/product.dart';

abstract class AllProductsState extends Equatable {
  const AllProductsState();

  @override
  List<Object?> get props => [];
}

class AllProductsInitial extends AllProductsState {}

class AllProductsLoading extends AllProductsState {}

class AllProductsLoaded extends AllProductsState {
  List<Product> products;

  AllProductsLoaded(this.products);
}

class AllProductsError extends AllProductsState {
  final String? message;

  const AllProductsError(this.message);
}
