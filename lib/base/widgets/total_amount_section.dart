import 'package:flutter/material.dart';
import 'package:quotation_maker_pro/base/styles.dart';
import 'package:quotation_maker_pro/pojo/make_quotation_singleton.dart';
import 'package:quotation_maker_pro/screens/pdfScreen.dart';

class MakeQuotationAmountItem extends StatelessWidget {
  var obj = MakeQuotationSingleton();

  MakeQuotationAmountItem(/* this.date,*/ {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 23),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStringsEn.total,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  calculateTotal(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF7E7E7E),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
            ElevatedButton(
              onPressed: () {
                if (obj.customer != null && obj.products.isNotEmpty)
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          PDFScreen(obj.customer!, obj.products, obj.terms),
                    ),
                  );
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  AppStringsEn.generateQuotation,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  String calculateTotal() {
    var total = 0;
    obj.products.forEach((p) {
      total += (p.count ?? 0) * int.parse(p.unitCost);
    });
    return total.toString();
  }
}
