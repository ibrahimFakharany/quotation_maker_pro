import 'package:equatable/equatable.dart';

abstract class NewTermState extends Equatable {
  const NewTermState();

  @override
  List<Object?> get props => [];
}

class NewTermInitial extends NewTermState {}

class NewTermLoading extends NewTermState {}

class NewTermLoaded extends NewTermState {

  const NewTermLoaded();
}

class NewTermError extends NewTermState {
  final String? message;

  const NewTermError(this.message);
}
