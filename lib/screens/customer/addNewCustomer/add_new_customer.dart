import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotation_maker_pro/base/widgets/screen_template.dart';
import 'package:quotation_maker_pro/pojo/customer.dart';
import 'package:quotation_maker_pro/screens/customer/addNewCustomer/bloc/new_customer_screen_bloc.dart';
import 'package:quotation_maker_pro/screens/customer/addNewCustomer/bloc/new_customer_screen_events.dart';
import 'package:quotation_maker_pro/screens/customer/addNewCustomer/bloc/new_customer_screen_states.dart';

import '../../../base/styles.dart';
import '../../../base/widgets/app_input_fields.dart';

class AddNewCustomerScreen extends StatelessWidget {
  var bloc = NewCustomerBloc();
  var pageTitle = "";
  Customer? customer;
  TextEditingController nameController = TextEditingController(),
      companyCodeController = TextEditingController(),
      companyNameController = TextEditingController(),
      emailController = TextEditingController(),
      mobileController = TextEditingController(),
      address1Controller = TextEditingController(),
      address2Controller = TextEditingController();

  AddNewCustomerScreen({this.customer, Key? key}) : super(key: key) {
    if (customer != null) {
      setControllerValues(customer);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (customer != null) {
      pageTitle = AppStringsEn.editCustomer;
    } else {
      pageTitle = AppStringsEn.addNewCustomer;
    }
    return BlocProvider(
      create: (_) => bloc,
      child: BlocListener<NewCustomerBloc, NewCustomerState>(
        listener: (context, state) {
          if (state is NewCustomerLoaded) {
            print("statee NewCustomerLoaded");
          } else if (state is NewCustomerError) {
            print("statee NewCustomerError");
          } else if (state is NewCustomerInitial) {
            print("statee NewCustomerInitial");
          } else if (state is NewCustomerLoading) {
            print("statee NewCustomerLoading");
          }
        },
        child: ScreenTemplate(
          pageTitle: pageTitle,
          showFab: false,
          showCTAButton: true,
          showSearchField: false,
          ctaButtonTitle: AppStringsEn.save,
          showToolbarResetBtn: customer != null,
          toolbarResetClicked: () {
            setControllerValues(customer);
          },
          onCTAButtonClicked: () {
            if (customer != null) {
              bloc.add(EditCustomerEvent(Customer(
                id: customer!.id,
                name: nameController.text,
                companyCode: companyCodeController.text,
                companyName: companyNameController.text,
                email: emailController.text,
                mobile: mobileController.text,
              )));
              return;
            }
            bloc.add(
              AddNewCustomerEvent(
                Customer(
                  id: "",
                  name: nameController.text,
                  companyCode: companyCodeController.text,
                  companyName: companyNameController.text,
                  email: emailController.text,
                  mobile: mobileController.text,
                ),
              ),
            );
          },
          pageContent: ListView(
            padding: EdgeInsets.zero,
            children: [
              DataInput(AppStringsEn.name, nameController),
              DataInput(AppStringsEn.companyCode, companyCodeController),
              DataInput(AppStringsEn.companyName, companyNameController),
              DataInput(AppStringsEn.email, emailController),
              DataInput(AppStringsEn.mobile, mobileController),
              DataInput(AppStringsEn.address1, address1Controller),
              DataInput(AppStringsEn.address2, address2Controller),
            ],
          ),
        ),
      ),
    );
  }

  void setControllerValues(Customer? customer) {
    nameController.text = customer!.name;
    setControllerSelection(nameController);
    companyCodeController.text = customer!.companyCode;
    setControllerSelection(companyCodeController);
    companyNameController.text = customer!.companyName;
    setControllerSelection(companyNameController);
    emailController.text = customer!.email;
    setControllerSelection(emailController);
    mobileController.text = customer!.mobile;
    setControllerSelection(mobileController);
  }

  void setControllerSelection(TextEditingController controller) {
    controller.selection = TextSelection.fromPosition(
        TextPosition(offset: controller.text.length));
  }
}
