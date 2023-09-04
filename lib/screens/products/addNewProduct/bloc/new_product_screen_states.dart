import 'package:equatable/equatable.dart';

abstract class NewProductState extends Equatable {
  const NewProductState();

  @override
  List<Object?> get props => [];
}

class NewProductInitial extends NewProductState {}

class NewProductLoading extends NewProductState {}

class NewProductLoaded extends NewProductState {

  const NewProductLoaded();
}

class NewProductError extends NewProductState {
  final String? message;

  const NewProductError(this.message);
}
