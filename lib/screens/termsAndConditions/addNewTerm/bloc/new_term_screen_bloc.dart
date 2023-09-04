import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../resources/customer/customer_api_repository.dart';
import '../../../../resources/term/term_api_provider.dart';
import 'new_term_screen_events.dart';
import 'new_term_screen_states.dart';

class NewTermBloc extends Bloc<NewTermEvent, NewTermState> {
  NewTermBloc() : super(NewTermInitial()) {
    final TermsApiProvider _apiRepository = TermsApiProvider();

    on<AddNewTermEvent>((event, emit) async {
      try {
        emit(NewTermLoading());
        await _apiRepository.addNewTerm(event.term);
        emit(NewTermLoaded());
      } on NetworkError {
        emit(NewTermError("Network error in new customer screen bloc"));
      }
    });
    on<EditTermEvent>((event, emit) async {
      try {
        emit(NewTermLoading());
        await _apiRepository.updateTerm(event.term);
        emit(NewTermLoaded());
      } on NetworkError {
        emit(NewTermError("Network error in new customer screen bloc"));
      }
    });
  }
}
