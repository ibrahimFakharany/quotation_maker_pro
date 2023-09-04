import 'package:flutter/material.dart';
import 'package:quotation_maker_pro/pojo/make_quotation_singleton.dart';
import 'package:quotation_maker_pro/screens/customer/addNewCustomer/add_new_customer.dart';

import '../../../../base/styles.dart';
import '../../../../base/widgets/dashboard_grid_item.dart';
import '../../../../pojo/customer.dart';

class CustomerListItem extends StatelessWidget {
  Customer customer;
  CustomerOpenType forMakeQuotation;
  VoidCallback? onDeleteClicked;

  CustomerListItem(this.forMakeQuotation, this.customer,
      {this.onDeleteClicked, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                  left: BorderSide(width: 10, color: AppColors.mainColor))),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  if (this.forMakeQuotation == CustomerOpenType.forSelect)
                    Radio(
                        value: "fdas",
                        groupValue: "fdasfa",
                        onChanged: (value) {
                          var obj = MakeQuotationSingleton();
                          obj.customer = this.customer;
                          Navigator.pop(context, true);
                        }),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        customer.companyCode,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        customer.name,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        customer.mobile,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    height: 24,
                    width: 24,
                    child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  AddNewCustomerScreen(customer: customer),
                            ),
                          );
                        },
                        child: AppIconImageSVG('assets/images/edit_icon.svg')),
                  ),
                  if (this.forMakeQuotation == CustomerOpenType.afterSelect)
                    SizedBox(
                      width: 10,
                    ),
                  if (this.forMakeQuotation == CustomerOpenType.afterSelect)
                    Container(
                      height: 24,
                      width: 24,
                      child: InkWell(
                          onTap: onDeleteClicked,
                          child: Icon(
                            Icons.delete,
                            color: Colors.red,
                          )),
                    )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum CustomerOpenType { normal, forSelect, afterSelect }
