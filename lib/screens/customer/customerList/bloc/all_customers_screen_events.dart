import 'package:equatable/equatable.dart';

abstract class AllCustomersEvent extends Equatable {
  const AllCustomersEvent();

  @override
  List<Object> get props => [];
}

class GetAllCustomerEvent extends AllCustomersEvent {
  GetAllCustomerEvent();
}
