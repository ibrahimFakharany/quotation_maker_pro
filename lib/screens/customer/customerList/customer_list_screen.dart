import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotation_maker_pro/base/widgets/screen_template.dart';
import 'package:quotation_maker_pro/screens/customer/customerList/bloc/all_customers_screen_bloc.dart';
import 'package:quotation_maker_pro/screens/customer/customerList/bloc/all_customers_screen_events.dart';
import 'package:quotation_maker_pro/screens/customer/customerList/bloc/all_customers_screen_states.dart';
import 'package:quotation_maker_pro/screens/customer/customerList/widgets/customerListItem.dart';

import '../../../base/styles.dart';
import '../../../pojo/customer.dart';

class CustomerListScreen extends StatelessWidget {
  CustomerOpenType forMakeQuotation;

  CustomerListScreen(
      {this.forMakeQuotation = CustomerOpenType.normal, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String pageTitle = "";
    if (forMakeQuotation == CustomerOpenType.forSelect)
      pageTitle = AppStringsEn.selectOneCustomer;
    else
      pageTitle = AppStringsEn.customerList;
    return ScreenTemplate(
      pageTitle: pageTitle,
      showFab: true,
      showCTAButton: false,
      showSearchField: true,
      searchFieldText: AppStringsEn.searchForCustomers,
      pageContent: CustomerListContent(forMakeQuotation),
    );
  }
}

class CustomerListContent extends StatefulWidget {
  CustomerOpenType forMakeQuotation;

  CustomerListContent(this.forMakeQuotation, {Key? key}) : super(key: key);

  @override
  State<CustomerListContent> createState() => _CustomerListContentState();
}

class _CustomerListContentState extends State<CustomerListContent> {
  var bloc = AllCustomersBloc();

  @override
  void initState() {
    bloc.add(GetAllCustomerEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => bloc,
        child: BlocListener<AllCustomersBloc, AllCustomersState>(
          listener: (context, state) => {
            if (state is AllCustomersError) {print("kjfds")}
          },
          child: BlocBuilder<AllCustomersBloc, AllCustomersState>(
            builder: (context, state) {
              if (state is AllCustomersLoaded) {
                return buildCustomerList(state.customers);
              } else if (state is AllCustomersLoading) {
                return CircularProgressIndicator();
              } else if (state is AllCustomersInitial) {
                return CircularProgressIndicator();
              } else {
                return Container();
              }
            },
          ),
        ));
  }

  Widget buildCustomerList(List<Customer> customers) => ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: customers.length,
      itemBuilder: (context, i) {
        return buildCustomerItem(customers[i]);
      });

  Widget buildCustomerItem(Customer customer) => CustomerListItem(
        widget.forMakeQuotation,
        customer,
      );
}
