import 'package:equatable/equatable.dart';

import '../../../../pojo/term.dart';

abstract class NewTermEvent extends Equatable {
  const NewTermEvent();

  @override
  List<Object> get props => [];
}

class AddNewTermEvent extends NewTermEvent {
  Term term;

  AddNewTermEvent(this.term);
}

class EditTermEvent extends NewTermEvent {
  Term term;

  EditTermEvent(this.term);
}
