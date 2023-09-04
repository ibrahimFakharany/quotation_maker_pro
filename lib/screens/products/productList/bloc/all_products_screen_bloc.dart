import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../resources/product/product_api_repository.dart';
import 'all_products_screen_events.dart';
import 'all_products_screen_states.dart';

class AllProductsBloc extends Bloc<AllProuctsEvent, AllProductsState> {
  AllProductsBloc() : super(AllProductsInitial()) {
    final ProductApiRepository _apiRepository = ProductApiRepository();

    on<GetAllProductsEvent>((event, emit) async {
      try {
        emit(AllProductsLoading());
        var list = await _apiRepository.getProducts();
        emit(AllProductsLoaded(list));
      } on NetworkError {
        emit(AllProductsError("Network error in new customer screen bloc"));
      }
    });
  }
}
