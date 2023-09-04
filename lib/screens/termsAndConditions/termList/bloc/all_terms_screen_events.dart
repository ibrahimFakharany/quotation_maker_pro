import 'package:equatable/equatable.dart';

abstract class AllTermsEvent extends Equatable {
  const AllTermsEvent();

  @override
  List<Object> get props => [];
}

class GetAllTermsEvent extends AllTermsEvent {
  GetAllTermsEvent();
}
