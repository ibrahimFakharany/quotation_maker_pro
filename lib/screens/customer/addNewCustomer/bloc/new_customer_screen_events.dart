import 'package:equatable/equatable.dart';

import '../../../../pojo/customer.dart';

abstract class NewCustomerEvent extends Equatable {
  const NewCustomerEvent();

  @override
  List<Object> get props => [];
}

class AddNewCustomerEvent extends NewCustomerEvent {
  Customer customer;

  AddNewCustomerEvent(this.customer);
}

class EditCustomerEvent extends NewCustomerEvent {
  Customer customer;

  EditCustomerEvent(this.customer);
}
