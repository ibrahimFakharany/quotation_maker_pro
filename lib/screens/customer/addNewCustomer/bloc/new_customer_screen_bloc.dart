import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotation_maker_pro/screens/customer/addNewCustomer/bloc/new_customer_screen_events.dart';
import 'package:quotation_maker_pro/screens/customer/addNewCustomer/bloc/new_customer_screen_states.dart';

import '../../../../resources/customer/customer_api_repository.dart';

class NewCustomerBloc extends Bloc<NewCustomerEvent, NewCustomerState> {
  NewCustomerBloc() : super(NewCustomerInitial()) {
    final CustomerApiRepository _apiRepository = CustomerApiRepository();

    on<AddNewCustomerEvent>((event, emit) async {
      try {
        emit(NewCustomerLoading());
        await _apiRepository.addNewCustomer(event.customer);
        emit(NewCustomerLoaded());
      } on NetworkError {
        emit(NewCustomerError("Network error in new customer screen bloc"));
      }
    });
    on<EditCustomerEvent>((event, emit) async {
      try {
        emit(NewCustomerLoading());
        await _apiRepository.updateCustomer(event.customer);
        emit(NewCustomerLoaded());
      } on NetworkError {
        emit(NewCustomerError("Network error in new customer screen bloc"));
      }
    });
  }
}
