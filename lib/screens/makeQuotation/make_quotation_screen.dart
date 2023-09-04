import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotation_maker_pro/base/widgets/data_item.dart';
import 'package:quotation_maker_pro/base/widgets/makeQuotationItemTitle.dart';
import 'package:quotation_maker_pro/base/widgets/screen_template.dart';
import 'package:quotation_maker_pro/pojo/customer.dart';
import 'package:quotation_maker_pro/screens/makeQuotation/bloc/make_quotation_screen_bloc.dart';
import 'package:quotation_maker_pro/screens/makeQuotation/bloc/make_quotation_screen_states.dart';
import 'package:quotation_maker_pro/screens/products/productList/product_list_screen.dart';
import 'package:quotation_maker_pro/screens/products/productList/widgets/productListItem.dart';
import 'package:quotation_maker_pro/screens/termsAndConditions/termList/term_list_screen.dart';
import 'package:quotation_maker_pro/screens/termsAndConditions/termList/widgets/termListItem.dart';

import '../../base/styles.dart';
import '../../base/widgets/total_amount_section.dart';
import '../../pojo/make_quotation_singleton.dart';
import '../customer/customerList/customer_list_screen.dart';
import '../customer/customerList/widgets/customerListItem.dart';
import 'bloc/make_quotation_screen_events.dart';

class MakeQuotationScreen extends StatelessWidget {
  var pageTitle = "";

  MakeQuotationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    pageTitle = AppStringsEn.makeQuotation;

    return ScreenTemplate(
      pageTitle: pageTitle,
      showFab: false,
      showCTAButton: false,
      showSearchField: false,
      pageContent: MakeQuotationScreenContent(),
    );
  }

  void setControllerValues(Customer? customer) {}

  void setControllerSelection(TextEditingController controller) {
    controller.selection = TextSelection.fromPosition(
        TextPosition(offset: controller.text.length));
  }
}

class MakeQuotationScreenContent extends StatefulWidget {
  const MakeQuotationScreenContent({Key? key}) : super(key: key);

  @override
  State<MakeQuotationScreenContent> createState() =>
      _MakeQuotationScreenContentState();
}

class _MakeQuotationScreenContentState
    extends State<MakeQuotationScreenContent> {
  var bloc = QuotationBloc();
  var makeQuotationSingle = MakeQuotationSingleton();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => bloc,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                MakeQuotationDateItem("1234", "27 jun 2023"),
                MakeQuotationItemTitle(AppStringsEn.to, () async {
                  var result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CustomerListScreen(
                        forMakeQuotation: CustomerOpenType.forSelect,
                      ),
                    ),
                  );
                  if (result) {
                    setState(() {});
                  }
                }),
                if (makeQuotationSingle.customer != null)
                  SizedBox(
                    height: 15,
                  ),
                if (makeQuotationSingle.customer != null)
                  CustomerListItem(
                    CustomerOpenType.afterSelect,
                    makeQuotationSingle.customer!,
                    onDeleteClicked: () {
                      var obj = MakeQuotationSingleton();
                      obj.customer = null;
                      setState(() {});
                    },
                  ),
                MakeQuotationItemTitle(AppStringsEn.products, () async {
                  var result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductListScreen(
                        mode: ProductListingPageMode.forSelect,
                      ),
                    ),
                  );
                  if (result != null) {
                    setState(() {});
                    bloc.add(Update());
                  }
                }),
                if (makeQuotationSingle.products.isNotEmpty)
                  SizedBox(
                    height: 15,
                  ),
                if (makeQuotationSingle.products.isNotEmpty)
                  ...makeQuotationSingle.products.map((p) => ProductListItem(
                        p,
                        ProductListingPageMode.afterSelect,
                        onDeleteClicked: () {
                          setState(() {});
                          bloc.add(Update());
                        },
                      )),
                if (makeQuotationSingle.products.isNotEmpty)
                  SizedBox(
                    height: 15,
                  ),
                MakeQuotationItemTitle(AppStringsEn.termsAndConditions, () async {
                  var result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TermListScreen(
                        mode: TermsListingPageMode.forSelect,
                      ),
                    ),
                  );
                  if (result != null) {
                    if (result) setState(() {});
                  }
                }),
                if (makeQuotationSingle.terms.isNotEmpty)
                  SizedBox(
                    height: 15,
                  ),
                if (makeQuotationSingle.terms.isNotEmpty)
                  ...makeQuotationSingle.terms.map((term) => TermListItem(
                        term,
                        TermsListingPageMode.afterSelect,
                        onDeleteClicked: () {
                          setState(() {});
                        },
                      )),
                if (makeQuotationSingle.terms.isNotEmpty)
                  SizedBox(
                    height: 15,
                  ),
              ],
            ),
          ),
          BlocBuilder<QuotationBloc, QuotationState>(
            builder: (context, state) {
              return MakeQuotationAmountItem();
            },
          ),
        ],
      ),
    );
  }
}
