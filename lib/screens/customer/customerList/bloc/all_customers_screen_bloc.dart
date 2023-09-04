import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotation_maker_pro/screens/customer/customerList/bloc/all_customers_screen_events.dart';
import 'package:quotation_maker_pro/screens/customer/customerList/bloc/all_customers_screen_states.dart';

import '../../../../resources/customer/customer_api_repository.dart';

class AllCustomersBloc extends Bloc<AllCustomersEvent, AllCustomersState> {
  AllCustomersBloc() : super(AllCustomersInitial()) {
    final CustomerApiRepository _apiRepository = CustomerApiRepository();

    on<GetAllCustomerEvent>((event, emit) async {
      try {
        emit(AllCustomersLoading());
        var list = await _apiRepository.getCustomers();
        emit(AllCustomersLoaded(list));
      } on NetworkError {
        emit(AllCustomersError("Network error in new customer screen bloc"));
      }
    });
  }
}
