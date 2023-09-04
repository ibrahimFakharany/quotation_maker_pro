import 'package:equatable/equatable.dart';

import '../../../../pojo/term.dart';

abstract class AllTermsState extends Equatable {
  const AllTermsState();

  @override
  List<Object?> get props => [];
}

class AllTermsInitial extends AllTermsState {}

class AllTermsLoading extends AllTermsState {}

class AllTermsLoaded extends AllTermsState {
  List<Term> terms;

  AllTermsLoaded(this.terms);
}

class AllTermsError extends AllTermsState {
  final String? message;

  const AllTermsError(this.message);
}
