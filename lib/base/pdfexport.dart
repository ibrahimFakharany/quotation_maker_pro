import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pwd;
import 'package:quotation_maker_pro/base/styles.dart';

import '../pojo/customer.dart';
import '../pojo/product.dart';
import '../pojo/term.dart';

Future<Uint8List> makePdf(String date, Customer userData,
    List<Product> products, List<Term> terms, String editorName) async {
  final pdf = pwd.Document();
  var arabicFont =
      pwd.Font.ttf(await rootBundle.load("assets/fonts/HacenTunisia.ttf"));
  var image = pwd.MemoryImage(
    (await rootBundle.load('assets/images/logo.png')).buffer.asUint8List(),
  );
  var signImage = pwd.MemoryImage(
    (await rootBundle.load('assets/images/sign.jpeg')).buffer.asUint8List(),
  );
  pdf.addPage(
    pwd.Page(
      margin: pwd.EdgeInsets.all(1),
      pageFormat: PdfPageFormat.a4,
      theme: pwd.ThemeData.withFont(
        base: arabicFont,
      ),
      build: (context) {
        return pwd.Directionality(
            textDirection: pwd.TextDirection.rtl,
            child: pwd.Column(
              mainAxisAlignment: pwd.MainAxisAlignment.spaceBetween,
              crossAxisAlignment: pwd.CrossAxisAlignment.stretch,
              children: [
                pwd.Column(
                    crossAxisAlignment: pwd.CrossAxisAlignment.start,
                    children: [
                      // HEADER
                      pwd.Container(
                        padding: pwd.EdgeInsets.only(top: 20, right: 20),
                        child: getHeader(image, date, userData),
                      ),
                      // TABLE
                      pwd.Container(
                        margin:
                            pwd.EdgeInsets.only(right: 20, left: 20, top: 10),
                        child: getTable(products),
                      ),
                      getFooter(terms),
                      pwd.SizedBox(
                          width: 130, height: 130, child: pwd.Image(signImage))
                    ]),
                // LOCATIONS AND TELEPHONES
                getLocationsAndTelephones(),
              ],
            ));
      },
    ),
  );
  return pdf.save();
}

pwd.Row getHeader(image, String date, Customer userData) {
  return pwd.Row(
    mainAxisAlignment: pwd.MainAxisAlignment.spaceBetween,
    children: [
      pwd.SizedBox(width: 150, height: 150, child: pwd.Image(image)),
      pwd.Column(crossAxisAlignment: pwd.CrossAxisAlignment.end, children: [
        pwd.Row(
          mainAxisAlignment: pwd.MainAxisAlignment.spaceBetween,
          mainAxisSize: pwd.MainAxisSize.max,
          children: [
            // التاريخ
            pwd.Text(date),
            pwd.SizedBox(width: 53),
            pwd.Text(AppStringsAr.date),
          ],
        ),
        pwd.SizedBox(height: 10),
        // السادة
        pwd.Row(
            mainAxisAlignment: pwd.MainAxisAlignment.spaceBetween,
            mainAxisSize: pwd.MainAxisSize.max,
            children: [
              pwd.Text(userData.companyName),
              pwd.SizedBox(width: 15),
              pwd.Text(AppStringsAr.mrs),
            ]),
        pwd.SizedBox(height: 10),
        // عناية الاستاذ
        pwd.Row(
            mainAxisAlignment: pwd.MainAxisAlignment.spaceBetween,
            mainAxisSize: pwd.MainAxisSize.max,
            children: [
              pwd.Text(userData.name),
              pwd.SizedBox(width: 25),
              pwd.Text(AppStringsAr.withMercy),
            ]),
        // welcom
        pwd.Text(AppStringsAr.welcome),
        // expose
        pwd.Text(AppStringsAr.shahinExpose),
        //TABLE OF PRODUCTS

        //
      ]),
    ],
  );
}

List<pwd.Text> getTerms(List<Term> terms) {
  return terms.map((e) => pwd.Text(e.title)).toList();
}

pwd.Table getTable(List<Product> products) {
  int index = 0;
  return pwd.Table(
    border: pwd.TableBorder.all(color: PdfColors.black),
    children: [
      // HEADER TABLE ROW
      pwd.TableRow(
        children: [
          pwd.Expanded(
              child: pwd.Padding(
                child: pwd.Text(
                  AppStringsAr.total,
                  textAlign: pwd.TextAlign.center,
                ),
                padding: pwd.EdgeInsets.all(5),
              ),
              flex: 4),
          pwd.Expanded(
              child: pwd.Padding(
                child: pwd.Text(
                  AppStringsAr.piecePrice,
                  textAlign: pwd.TextAlign.center,
                ),
                padding: pwd.EdgeInsets.all(5),
              ),
              flex: 4),
          pwd.Expanded(
              child: pwd.Padding(
                child: pwd.Text(
                  AppStringsAr.count,
                  textAlign: pwd.TextAlign.center,
                ),
                padding: pwd.EdgeInsets.all(5),
              ),
              flex: 4),
          pwd.Expanded(
              child: pwd.Padding(
                child: pwd.Text(
                  AppStringsAr.category,
                  textAlign: pwd.TextAlign.center,
                ),
                padding: pwd.EdgeInsets.all(5),
              ),
              flex: 8),
          pwd.Expanded(
              child: pwd.Padding(
                child: pwd.Text(
                  AppStringsAr.serial,
                  textAlign: pwd.TextAlign.center,
                ),
                padding: pwd.EdgeInsets.all(5),
              ),
              flex: 2),
        ],
      ),

      // PRODUCTS
      ...products.map((e) {
        index += 1;
        return pwd.TableRow(
          children: [
            pwd.Expanded(
                child: pwd.Padding(
                  child: pwd.Text(
                    ((e.count ?? 0) * int.parse(e.unitCost)).toString(),
                    textAlign: pwd.TextAlign.center,
                  ),
                  padding: pwd.EdgeInsets.all(5),
                ),
                flex: 4),
            pwd.Expanded(
                child: pwd.Padding(
                  child: pwd.Text(
                    e.unitCost,
                    textAlign: pwd.TextAlign.center,
                  ),
                  padding: pwd.EdgeInsets.all(5),
                ),
                flex: 4),
            pwd.Expanded(
                child: pwd.Padding(
                  child: pwd.Text(
                    e.count.toString(),
                    textAlign: pwd.TextAlign.center,
                  ),
                  padding: pwd.EdgeInsets.all(5),
                ),
                flex: 4),
            pwd.Expanded(
                child: pwd.Padding(
                  child: pwd.Text(
                    e.tyreSpecs,
                    textAlign: pwd.TextAlign.center,
                  ),
                  padding: pwd.EdgeInsets.all(5),
                ),
                flex: 8),
            pwd.Expanded(
                child: pwd.Padding(
                  child: pwd.Text(
                    index.toString(),
                    textAlign: pwd.TextAlign.center,
                  ),
                  padding: pwd.EdgeInsets.all(5),
                ),
                flex: 2),
          ],
        );
      })
    ],
  );
}

pwd.Container getFooter(terms) {
  return pwd.Container(
      margin: pwd.EdgeInsets.only(right: 20, left: 20, top: 10),
      child: pwd.Row(
          crossAxisAlignment: pwd.CrossAxisAlignment.end,
          mainAxisAlignment: pwd.MainAxisAlignment.spaceBetween,
          children: [
            // SIGNATURE
            pwd.Column(
                crossAxisAlignment: pwd.CrossAxisAlignment.end,
                mainAxisAlignment: pwd.MainAxisAlignment.end,
                children: [
                  // our sincere
                  pwd.Text(AppStringsAr.recieveOurSincer),
                  pwd.SizedBox(height: 10),
                  // منسق المبيعات
                  pwd.Row(
                    mainAxisAlignment: pwd.MainAxisAlignment.spaceBetween,
                    mainAxisSize: pwd.MainAxisSize.max,
                    children: [
                      pwd.Text(AppStringsAr.salesMan),
                      pwd.Text(AppStringsAr.sales),
                    ],
                  ),
                  // هاتف
                  pwd.Row(
                      mainAxisAlignment: pwd.MainAxisAlignment.spaceBetween,
                      mainAxisSize: pwd.MainAxisSize.max,
                      children: [
                        pwd.Text(AppStringsAr.telephoneValue),
                        pwd.Text(AppStringsAr.telephone),
                      ]),
                ]),
            pwd.SizedBox(width: 30),
            // TERMS
            pwd.Expanded(
                child: pwd.Column(
                    crossAxisAlignment: pwd.CrossAxisAlignment.end,
                    children: [
                  pwd.Text(
                    AppStringsAr.termsAndConditions,
                  ), // optional
                  pwd.SizedBox(height: 10),
                  ...getTerms(terms)
                ])),
          ]));
}

pwd.Column getLocationsAndTelephones() {
  return pwd.Column(children: [
    pwd.Divider(),
    pwd.Container(
      margin: pwd.EdgeInsets.only(right: 20, left: 20),
      child: pwd.Row(
        mainAxisAlignment: pwd.MainAxisAlignment.spaceBetween,
        children: [
          pwd.Column(
              crossAxisAlignment: pwd.CrossAxisAlignment.start,
              children: [
                pwd.Text(AppStringsAr.shahinLocationEn),
                pwd.Text(AppStringsAr.shahinLocationEn2),
                pwd.Text(AppStringsAr.telephoneEn),
                pwd.Text(AppStringsAr.websiteEn),
              ]),
          pwd.Column(
            crossAxisAlignment: pwd.CrossAxisAlignment.end,
            children: [
              pwd.Text(AppStringsAr.shahinLocationAr),
              pwd.Text(AppStringsAr.shahinLocationAr2),
              pwd.Text(AppStringsAr.telephoneAr),
              pwd.Text(AppStringsAr.websiteAr),
            ],
          ),
        ],
      ),
    ),
    pwd.Divider(),
  ]);
}
