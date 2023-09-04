import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:printing/printing.dart';

import '../base/pdfexport.dart';
import '../pojo/customer.dart';
import '../pojo/product.dart';
import '../pojo/term.dart';

class PDFScreen extends StatefulWidget {
  Customer userData;
  List<Product> products;
  List<Term> terms;

  PDFScreen(this.userData, this.products, this.terms, {Key? key})
      : super(key: key);

  @override
  State<PDFScreen> createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> {
  final editorController = TextEditingController();

  @override
  void initState() {
    super.initState();
    initializeDateFormatting("ar_SA");
  }

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formatter = DateFormat.yMMMd('ar_SA');
    String formatted = formatter.format(now);
    var currentDate =
        DateTime.now().toIso8601String().split(new RegExp(r"[T\.]"));
    return Scaffold(
      body: PdfPreview(
        pdfFileName:
            " عرض سعر ${widget.userData.companyName} ${currentDate[0]} \n ${currentDate[1]}.pdf",
        build: (context) => makePdf(formatted, widget.userData, widget.products,
            widget.terms, "احمد شاهين"),
      ),
    );
  }
}

// ${currentDate[0]} ${currentDate[1]}
