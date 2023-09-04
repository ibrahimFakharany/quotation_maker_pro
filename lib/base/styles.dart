import 'package:flutter/material.dart';

abstract class AppTextStyles {
  static const TextStyle screenTitle = TextStyle(fontSize: 24);
  static const TextStyle sectionTitle =
      TextStyle(fontSize: 18, color: AppColors.sectionTitleColor);
  static const TextStyle valueTextFieldStyle =
      TextStyle(fontSize: 22, color: AppColors.blackColor);
  static const TextStyle hintTextFieldStyle =
      TextStyle(fontSize: 22, color: AppColors.hintColor);
  static const TextStyle textStyleSize20 =
      TextStyle(fontSize: 20, color: AppColors.blackColor);
}

abstract class AppColors {
  static const scaffoldBackgroundColor = Color(0xffFAFAFf);
  static const borderColor = Color(0xFF939393);
  static const mainColor = Color(0xFF0090F8);
  static const whiteColor = Color(0xffffffff);
  static const sectionTitleColor = Color(0xffBFBFBF);
  static const hintColor = Color(0xffDEDEDE);
  static const blackColor = Color(0xff000000);
  static const redColor = Color(0xffF40B0B);
  static const pinkColor = Color(0xffE726D3);
  static const greenColor = Color(0xff6ED685);
  static const secondaryButtonColor = Color(0xffB4B3C3);
}

abstract class AppStringsAr {
  static const String screenTitleAllOffers = "جميع العروض";
  static const String screenTitleClientDetails = "تفاصيل العميل";
  static const String screenTitleProductDetails = "إضافة المنتجات";
  static const String screenTitleTerms = "إضافة الشروط";
  static const String screenTitleOther = "آخري";
  static const String nextButton = "التالي";
  static const String clientName = "الإسم";
  static const String clientCode = "الكود";
  static const String directedTo = "موجه إلي";
  static const String clientPhone = "رقم التليفون";
  static const String clientTaxRecord = "السجل الضريبي";
  static const String clientAddress = "العنوان";
  static const String clientCountry = "المحافظة";
  static const String clientCity = "المدينة";
  static const String clientAddressDetails = "...العنوان بالتفصيل";
  static const String total = "الإجمالي";
  static const String tyreSectionTitle = "مقاس الإطار";
  static const String width = "عرض";
  static const String ratio = "النسبة";
  static const String tyreMeasure = "مقاس الجنط";
  static const String weight = "وزن";
  static const String speed = "سرعة";
  static const String piecePrice = "سعر الوحدة";
  static const String count = "العدد";
  static const String addNew = "إضافة جديد";
  static const String duplicate = "تكرار الحالي";
  static const String brand = "الماركة";
  static const String pricesDescription =
      "الاسعار يضاف ١٤٪ ضريبة القيمة المضافة";
  static const String offerEditor = "محرر العرض";
  static const String preview = "مراجعة";
  static const String send = "إرسال";
  static const String showOffer = "عـــــرض أســعــار";
  static const String mrs = "السادة الشركة:  ";
  static const String withMercy = "عناية الاستاذ: ";
  static const String welcome = "تحيه طيبه وبعد";
  static const String category = "الصنف";
  static const String serial = "بند";
  static const String enterDays = "أدخل عدد الايام";
  static const String delivery = "التسليم";
  static const String ourStock = "مخازننا بمدينة طنطا";
  static const String yourStock = "مخازن سيادتكم";
  static const String nameCheckFieldRequest = "أدخل اسم صاحب الشيك";
  static const String accountNumberRequest = "رقم الحساب";
  static const String nameOfBankRequest = "إسم البنك";
  static const String nameOfBranchRequest = "إسم الفرع";
  static const String date = "التاريخ: ";
  static const String sales = "منسق المبيعات :  ";
  static const String salesMan = "عبدالغني شاهين";
  static const String telephone = "هاتف: ";
  static const String telephoneValue = "01096000604";
  static const String recieveOurSincer = "تفضلو بقبول فائق الاحترام...";
  static const String termsAndConditions = "الشروط والأحكام";
  static const String shahinLocationAr = "٦ شارع الجلاء طنطا، الغربية";
  static const String shahinLocationAr2 =
      "طريق القاهرة الاسكندرية الزراعي مدخل طنطا الجنوبي";
  static const String shahinLocationEn = "6 El Galaa Street, Tanta, El Gharbia";
  static const String telephoneAr = "ت 01096000604 - 040 3310456 ";
  static const String telephoneEn = "Tele: 01096000604 - 040 3310456";
  static const String websiteAr = "الموقع الإلكتروني www.shaheentire.com";
  static const String websiteEn = "website: www.shaheentire.com";
  static const String tyreSpecs = "مواصفات الصنف";
  static const String shahinLocationEn2 =
      "Cairo-Alex Agricultural road, Tanta south entrance";

  static const String shahinExpose =
      "تتشرف شركة شاهين للإطارات والبطاريات بتقديم عرض سعر لسيادتكم كالأتي:";

  static const String addProducts = "إضافة المنتجات";

  static const String addTerms = "اضافة الشروط";
}

abstract class AppStringsEn {
  static const String screenTitleDashboard = "Dashboard";

  static const String makeQuotation = "Make Quotation";
  static const String createNewQuotation = "Create new nuotation";

  static const String quotationList = "Quotation List";
  static const String manageAllQuotations = "Manage all quotations";

  static const String customerList = "Customer List";
  static const String selectOneCustomer = "Select Customer";
  static const String manageAllCustomers = "Manage all customers";

  static const String productList = "Product List";
  static const String manageAllProducts = "Manage all products";

  static const String termsAndConditions = "Terms & Conditions";
  static const String manageAllTerms = "Manage all terms ";

  static const String settings = "Settings";
  static const String manageAllSettings = "Manage all settings";

  static const String emptyCustomerMessage =
      "You do not have any Customer available yet!";
  static const String searchForCustomers = "Search for customers...";
  static const String selectProducts = "Select Products";

  static const String name = "Name";
  static const String companyCode = "Company code";
  static const String editCustomer = "Edit Customer";
  static const String companyName = "Company name";
  static const String reset = "Reset";
  static const String email = "Email";
  static const String mobile = "Mobile";
  static const String count = "count";
  static const String address1 = "Address1";
  static const String address2 = "Address2";
  static const String addNewCustomer = "Add new customer";
  static const String save = "Save";

  static const String emptyProductsMessage =
      "You do not have any Product available yet!";
  static const String searchProducts = "Search by brand or code";
  static const String editProduct = "Edit Product";
  static const String enterCount = "Enter Count";

  static const String filterProducts = "Filter Products";
  static const String code = "Code";
  static const String brand = "Brand";
  static const String width = "Width";
  static const String ratio = "Ratio";
  static const String rimSize = "Rim size";
  static const String speedRating = "Speed Rating";
  static const String loadRating = "Load Rating";
  static const String applyFilters = "Apply Filters";
  static const String addNewProduct = "Add new Product";
  static const String unitCost = "Unit Cost";

  static const String emptyTermsMessage =
      "You do not have any Terms available yet!";
  static const String selectTerms = "Select Terms";

  static const String searchForTerms = "Search For Terms";
  static const String addNewTerm = "Add new Term";
  static const String editTerm = "Edit Customer";

  static const String emptyQuotationsMessage =
      "You do not have any Quotations available yet!";
  static const String total = "Total";
  static const String generateQuotation = "Generate Quotation";
  static const String searchForQuotations = "Search For Quotations";

  static const String quotationNo = "Quotation No.";
  static const String date = "Date";
  static const String products = "Products";
  static const String to = "To";
}

//- 01553060666 - 040 3070666
