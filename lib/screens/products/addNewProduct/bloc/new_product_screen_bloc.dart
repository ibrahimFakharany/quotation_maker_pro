import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotation_maker_pro/resources/product/product_api_provider.dart';
import 'package:quotation_maker_pro/screens/customer/addNewCustomer/bloc/new_customer_screen_events.dart';
import 'package:quotation_maker_pro/screens/customer/addNewCustomer/bloc/new_customer_screen_states.dart';
import 'package:quotation_maker_pro/screens/products/addNewProduct/bloc/new_product_screen_events.dart';
import 'package:quotation_maker_pro/screens/products/addNewProduct/bloc/new_product_screen_states.dart';

import '../../../../resources/customer/customer_api_repository.dart';

class NewProductBloc extends Bloc<NewProductEvent, NewProductState> {
  NewProductBloc() : super(NewProductInitial()) {
    final ProductsApiProvider _apiRepository = ProductsApiProvider();

    on<AddNewProductEvent>((event, emit) async {
      try {
        emit(NewProductLoading());
        await _apiRepository.addNewProduct(event.customer);
        emit(NewProductLoaded());
      } on NetworkError {
        emit(NewProductError("Network error in new customer screen bloc"));
      }
    });
    on<EditProductEvent>((event, emit) async {
      try {
        emit(NewProductLoading());
        await _apiRepository.updateProduct(event.product);
        emit(NewProductLoaded());
      } on NetworkError {
        emit(NewProductError("Network error in new customer screen bloc"));
      }
    });
  }
}
