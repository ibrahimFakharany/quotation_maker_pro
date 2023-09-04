import 'package:equatable/equatable.dart';

abstract class NewCustomerState extends Equatable {
  const NewCustomerState();

  @override
  List<Object?> get props => [];
}

class NewCustomerInitial extends NewCustomerState {}

class NewCustomerLoading extends NewCustomerState {}

class NewCustomerLoaded extends NewCustomerState {
  const NewCustomerLoaded();
}

class NewCustomerError extends NewCustomerState {
  final String? message;

  const NewCustomerError(this.message);
}
