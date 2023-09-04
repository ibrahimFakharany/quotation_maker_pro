import 'package:equatable/equatable.dart';

import '../../../../pojo/customer.dart';

abstract class QuotationEvent extends Equatable {
  const QuotationEvent();

  @override
  List<Object> get props => [];
}

class Update extends QuotationEvent {
  Update();
}