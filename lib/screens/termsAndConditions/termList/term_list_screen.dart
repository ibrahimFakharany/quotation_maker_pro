import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotation_maker_pro/base/widgets/screen_template.dart';
import 'package:quotation_maker_pro/screens/products/productList/bloc/all_products_screen_states.dart';
import 'package:quotation_maker_pro/screens/termsAndConditions/termList/bloc/all_terms_screen_states.dart';
import 'package:quotation_maker_pro/screens/termsAndConditions/termList/widgets/termListItem.dart';

import '../../../base/styles.dart';
import '../../../base/widgets/buttons.dart';
import '../../../pojo/make_quotation_singleton.dart';
import '../../../pojo/term.dart';
import 'bloc/all_terms_screen_bloc.dart';
import 'bloc/all_terms_screen_events.dart';

class TermListScreen extends StatelessWidget {
  TermsListingPageMode mode;

  TermListScreen({this.mode = TermsListingPageMode.normal, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String pageTitle = "";
    if (mode == TermsListingPageMode.forSelect)
      pageTitle = AppStringsEn.selectTerms;
    else
      pageTitle = AppStringsEn.termsAndConditions;
    return ScreenTemplate(
      pageTitle: pageTitle,
      showFab: true,
      showCTAButton: false,
      showSearchField: true,
      searchFieldText: AppStringsEn.searchForTerms,
      pageContent: TermListContent(this.mode),
    );
  }
}

class TermListContent extends StatefulWidget {
  TermsListingPageMode mode;

  TermListContent(this.mode, {Key? key}) : super(key: key);

  @override
  State<TermListContent> createState() => _TermListContentState();
}

class _TermListContentState extends State<TermListContent> {
  var bloc = AllTermsBloc();
  List<Term> terms = [];
  var obj = MakeQuotationSingleton();

  @override
  void initState() {
    bloc.add(GetAllTermsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => bloc,
      child: BlocListener<AllTermsBloc, AllTermsState>(
        listener: (context, state) => {
          if (state is AllProductsError)
            {
              //TODO: HANDLE ERROR STATE IN ALL Terms PAGE
            }
        },
        child: BlocBuilder<AllTermsBloc, AllTermsState>(
          builder: (context, state) {
            if (state is AllTermsLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildProductList(state.terms),
                  if (widget.mode == TermsListingPageMode.forSelect)
                    AppButton(AppStringsEn.save, () {
                      obj.terms.addAll(terms);
                      Navigator.pop(context, true);
                    })
                ],
              );
            } else if (state is AllTermsLoading) {
              return CircularProgressIndicator();
            } else if (state is AllTermsInitial) {
              return CircularProgressIndicator();
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Widget buildProductList(List<Term> Terms) => ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: Terms.length,
      shrinkWrap: true,
      itemBuilder: (context, i) {
        return buildTermItem(
          Terms[i],
          widget.mode,
        );
      });

  Widget buildTermItem(Term term, TermsListingPageMode mode) => TermListItem(
        term,
        mode,
        onSelectCallback: (Term, bool) {
          if (bool) {
            terms.add(term);
          } else {
            terms.remove(term);
          }
        },
      );
}
