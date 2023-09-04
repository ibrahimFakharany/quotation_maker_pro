import 'package:equatable/equatable.dart';

abstract class QuotationState extends Equatable {
  QuotationState();

  @override
  List<Object?> get props => [];
}



class GenericState extends QuotationState {}
