import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../resources/term/term_api_repository.dart';
import 'all_terms_screen_events.dart';
import 'all_terms_screen_states.dart';

class AllTermsBloc extends Bloc<AllTermsEvent, AllTermsState> {
  AllTermsBloc() : super(AllTermsInitial()) {
    final TermApiRepository _apiRepository = TermApiRepository();

    on<GetAllTermsEvent>((event, emit) async {
      emit(AllTermsLoading());
      var list = await _apiRepository.getTerms();
      emit(AllTermsLoaded(list));
    });
  }
}
