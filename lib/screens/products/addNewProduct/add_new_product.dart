import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotation_maker_pro/base/widgets/screen_template.dart';
import 'package:quotation_maker_pro/pojo/product.dart';
import 'package:quotation_maker_pro/screens/products/addNewProduct/bloc/new_product_screen_bloc.dart';
import 'package:quotation_maker_pro/screens/products/addNewProduct/bloc/new_product_screen_events.dart';

import '../../../base/styles.dart';
import '../../../base/widgets/app_input_fields.dart';
import '../../../pojo/product.dart';
import 'bloc/new_product_screen_states.dart';

class AddNewProductScreen extends StatelessWidget {
  bool forCount;
  var bloc = NewProductBloc();
  var pageTitle = "";
  Product? product;
  Function(Product)? selectedProduct;

  TextEditingController brandController = TextEditingController(),
      widthController = TextEditingController(),
      ratioController = TextEditingController(),
      rimSizeController = TextEditingController(),
      speedRatingController = TextEditingController(),
      address1Controller = TextEditingController(),
      loadRatingController = TextEditingController(),
      countController = TextEditingController(),
      unitCost = TextEditingController();

  AddNewProductScreen(
      {this.product, this.forCount = false, this.selectedProduct, Key? key})
      : super(key: key) {
    if (product != null) {
      setControllerValues(product!);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (product != null) {
      if (forCount) {
        pageTitle = AppStringsEn.enterCount;
      } else {
        pageTitle = AppStringsEn.editProduct;
      }
    } else {
      pageTitle = AppStringsEn.addNewProduct;
    }
    return BlocProvider(
      create: (_) => bloc,
      child: BlocListener<NewProductBloc, NewProductState>(
        listener: (context, state) {
          if (state is NewProductLoaded) {
            print("statee NewProductLoaded");
          } else if (state is NewProductError) {
            print("statee NewProductError");
          } else if (state is NewProductInitial) {
            print("statee NewProductInitial");
          } else if (state is NewProductLoading) {
            print("statee NewProductLoading");
          }
        },
        child: ScreenTemplate(
          pageTitle: pageTitle,
          showFab: false,
          showCTAButton: true,
          showSearchField: false,
          ctaButtonTitle: AppStringsEn.save,
          showToolbarResetBtn: product != null,
          toolbarResetClicked: () {
            setControllerValues(product!);
          },
          onCTAButtonClicked: () {
            if (forCount) {
              Navigator.pop(
                context,
                Product(
                  id: product!.id,
                  brand: brandController.text,
                  width: widthController.text,
                  ratio: ratioController.text,
                  rimSize: rimSizeController.text,
                  speedRating: speedRatingController.text,
                  loadRating: loadRatingController.text,
                  unitCost: unitCost.text,
                  count: int.parse(countController.text),
                ),
              );
              return;
            }
            if (product != null) {
              bloc.add(EditProductEvent(Product(
                id: product!.id,
                brand: brandController.text,
                width: widthController.text,
                ratio: ratioController.text,
                rimSize: rimSizeController.text,
                speedRating: speedRatingController.text,
                loadRating: loadRatingController.text,
                unitCost: unitCost.text,
              )));
              return;
            }
            bloc.add(
              AddNewProductEvent(
                Product(
                  id: "",
                  brand: brandController.text,
                  width: widthController.text,
                  ratio: ratioController.text,
                  rimSize: rimSizeController.text,
                  speedRating: speedRatingController.text,
                  loadRating: loadRatingController.text,
                  unitCost: unitCost.text,
                ),
              ),
            );
          },
          pageContent: ListView(
            padding: EdgeInsets.zero,
            children: [
              DataInput(AppStringsEn.name, brandController),
              DataInput(AppStringsEn.companyCode, widthController),
              DataInput(AppStringsEn.companyName, ratioController),
              DataInput(AppStringsEn.email, rimSizeController),
              DataInput(AppStringsEn.mobile, speedRatingController),
              DataInput(AppStringsEn.mobile, loadRatingController),
              DataInput(AppStringsEn.mobile, unitCost,
                  keyboardType: TextInputType.number),
              if (forCount)
                DataInput(AppStringsEn.count, countController,
                    keyboardType: TextInputType.number),
            ],
          ),
        ),
      ),
    );
  }

  void setControllerValues(Product product) {
    brandController.text = product.brand;
    setControllerSelection(brandController);
    widthController.text = product.width;
    setControllerSelection(widthController);
    ratioController.text = product.ratio;
    setControllerSelection(ratioController);
    rimSizeController.text = product.rimSize;
    setControllerSelection(rimSizeController);
    speedRatingController.text = product.speedRating;
    setControllerSelection(speedRatingController);
    loadRatingController.text = product.loadRating;
    setControllerSelection(speedRatingController);
    unitCost.text = product.unitCost.toString();
    setControllerSelection(unitCost);
  }

  void setControllerSelection(TextEditingController controller) {
    controller.selection = TextSelection.fromPosition(
        TextPosition(offset: controller.text.length));
  }
}
