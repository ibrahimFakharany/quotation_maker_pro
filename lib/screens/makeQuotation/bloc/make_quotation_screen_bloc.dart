import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotation_maker_pro/screens/makeQuotation/bloc/make_quotation_screen_events.dart';
import 'package:quotation_maker_pro/screens/makeQuotation/bloc/make_quotation_screen_states.dart';

class QuotationBloc extends Bloc<QuotationEvent, QuotationState> {
  QuotationBloc() : super(GenericState()) {
    on<Update>((event, emit) async {
      emit(GenericState());
    });
  }
}
