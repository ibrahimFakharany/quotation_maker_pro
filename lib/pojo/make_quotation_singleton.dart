import 'package:quotation_maker_pro/pojo/product.dart';
import 'package:quotation_maker_pro/pojo/term.dart';

import 'customer.dart';

class MakeQuotationSingleton {
  Customer? customer;
  List<Product> products = [];
  List<Term> terms = [];
  static final MakeQuotationSingleton _singleton =
      MakeQuotationSingleton._internal();

  factory MakeQuotationSingleton() {
    return _singleton;
  }

  MakeQuotationSingleton._internal();
}
