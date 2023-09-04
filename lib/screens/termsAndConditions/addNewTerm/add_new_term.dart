import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotation_maker_pro/base/widgets/screen_template.dart';
import 'package:quotation_maker_pro/pojo/term.dart';

import '../../../base/styles.dart';
import '../../../base/widgets/app_input_fields.dart';
import 'bloc/new_term_screen_bloc.dart';
import 'bloc/new_term_screen_events.dart';
import 'bloc/new_term_screen_states.dart';

class AddNewTermScreen extends StatelessWidget {
  var bloc = NewTermBloc();
  var pageTitle = "";
  Term? term;
  TextEditingController titleController = TextEditingController();

  AddNewTermScreen({this.term, Key? key}) : super(key: key) {
    if (term != null) {
      setControllerValues(term!);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (term != null) {
      pageTitle = AppStringsEn.editTerm;
    } else {
      pageTitle = AppStringsEn.addNewTerm;
    }
    return BlocProvider(
      create: (_) => bloc,
      child: BlocListener<NewTermBloc, NewTermState>(
        listener: (context, state) {},
        child: ScreenTemplate(
          pageTitle: pageTitle,
          showFab: false,
          showCTAButton: true,
          showSearchField: false,
          ctaButtonTitle: AppStringsEn.save,
          showToolbarResetBtn: term != null,
          toolbarResetClicked: () {
            setControllerValues(term!);
          },
          onCTAButtonClicked: () {
            if (term != null) {
              bloc.add(EditTermEvent(Term(
                id: term!.id,
                title: titleController.text,
              )));
              return;
            }
            bloc.add(
              AddNewTermEvent(
                Term(
                  id: "",
                  title: titleController.text,
                ),
              ),
            );
          },
          pageContent: ListView(
            padding: EdgeInsets.zero,
            children: [
              DataInput(AppStringsEn.name, titleController),
            ],
          ),
        ),
      ),
    );
  }

  void setControllerValues(Term term) {
    titleController.text = term.title;
    setControllerSelection(titleController);
  }

  void setControllerSelection(TextEditingController controller) {
    controller.selection = TextSelection.fromPosition(
        TextPosition(offset: controller.text.length));
  }
}
