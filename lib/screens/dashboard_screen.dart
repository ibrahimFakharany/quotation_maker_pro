import 'package:flutter/material.dart';
import 'package:quotation_maker_pro/base/widgets/dashboard_grid_item.dart';
import 'package:quotation_maker_pro/base/widgets/screen_template.dart';
import 'package:quotation_maker_pro/screens/customer/customerList/customer_list_screen.dart';
import 'package:quotation_maker_pro/screens/makeQuotation/make_quotation_screen.dart';
import 'package:quotation_maker_pro/screens/products/productList/product_list_screen.dart';
import 'package:quotation_maker_pro/screens/termsAndConditions/termList/term_list_screen.dart';

import '../base/styles.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(
      pageTitle: AppStringsEn.screenTitleDashboard,
      showFab: false,
      showCTAButton: false,
      showSearchField: false,
      pageContent: DashboardPageContent(),
    );
  }
}

class DashboardPageContent extends StatelessWidget {
  const DashboardPageContent({Key? key}) : super(key: key);
  final path = 'assets/images/settings_icon.svg';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        padding: EdgeInsets.zero,
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        // Generate 100 widgets that display their index in the List.
        children: List.from(
          [
            DashboardGridItem(path, AppStringsEn.makeQuotation,
                AppStringsEn.createNewQuotation, () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MakeQuotationScreen(),
                ),
              );
            }),
            DashboardGridItem(path, AppStringsEn.quotationList,
                AppStringsEn.manageAllQuotations, () {
              MaterialPageRoute(
                builder: (context) => CustomerListScreen(),
              );
            }),
            DashboardGridItem(path, AppStringsEn.customerList,
                AppStringsEn.manageAllCustomers, () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CustomerListScreen(),
                ),
              );
            }),
            DashboardGridItem(
                path, AppStringsEn.productList, AppStringsEn.manageAllProducts,
                () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductListScreen(),
                ),
              );
            }),
            DashboardGridItem(path, AppStringsEn.termsAndConditions,
                AppStringsEn.manageAllTerms, () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TermListScreen(),
                ),
              );
            }),
            DashboardGridItem(
                path, AppStringsEn.settings, AppStringsEn.manageAllSettings,
                () {
              MaterialPageRoute(
                builder: (context) => CustomerListScreen(),
              );
            }),
          ],
        ),
      ),
      padding: EdgeInsets.all(16),
    );
  }
}
