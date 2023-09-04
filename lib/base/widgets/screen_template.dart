import 'package:flutter/material.dart';
import 'package:quotation_maker_pro/base/styles.dart';
import 'package:quotation_maker_pro/base/widgets/app_input_fields.dart';
import 'package:quotation_maker_pro/base/widgets/buttons.dart';
import 'package:quotation_maker_pro/screens/customer/addNewCustomer/add_new_customer.dart';

import 'appBar.dart';

class ScreenTemplate extends StatelessWidget {
  bool showFab, showCTAButton, showSearchField, showToolbarResetBtn;
  String pageTitle;
  String? searchFieldText;
  String? ctaButtonTitle;
  Widget? pageContent;
  VoidCallback? onCTAButtonClicked, toolbarResetClicked;
  var controller = TextEditingController();

  ScreenTemplate(
      {required this.pageTitle,
      required this.showFab,
      required this.showCTAButton,
      required this.showSearchField,
      this.showToolbarResetBtn = false,
      this.toolbarResetClicked,
      this.searchFieldText,
      this.pageContent,
      this.onCTAButtonClicked,
      this.ctaButtonTitle,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ApplicationBar(pageTitle, showToolbarResetBtn, toolbarResetClicked),
            if (showSearchField) SearchField(searchFieldText!, controller),
            Flexible(
              child: pageContent!,
            ),
            if (showCTAButton) AppButton(ctaButtonTitle!, onCTAButtonClicked!),
          ],
        ),
      ),
      floatingActionButton: new Visibility(
        visible: showFab,
        child: FloatingActionButton(
          onPressed: () {
            if (pageTitle == AppStringsEn.customerList) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddNewCustomerScreen(),
                ),
              );
            } else if (pageTitle == AppStringsEn.productList) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddNewCustomerScreen(),
                ),
              );
            } else if (pageTitle == AppStringsEn.termsAndConditions) {
            } else if (pageTitle == AppStringsEn.quotationList) {}
          },
          child: Icon(
            Icons.add,
            color: AppColors.whiteColor,
          ),
        ),
      ),
    );
  }
}
