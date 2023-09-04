import 'package:equatable/equatable.dart';

import '../../../../pojo/customer.dart';

abstract class AllCustomersState extends Equatable {
  const AllCustomersState();

  @override
  List<Object?> get props => [];
}

class AllCustomersInitial extends AllCustomersState {}

class AllCustomersLoading extends AllCustomersState {}

class AllCustomersLoaded extends AllCustomersState {
  List<Customer> customers;

  AllCustomersLoaded(this.customers);
}

class AllCustomersError extends AllCustomersState {
  final String? message;

  const AllCustomersError(this.message);
}
