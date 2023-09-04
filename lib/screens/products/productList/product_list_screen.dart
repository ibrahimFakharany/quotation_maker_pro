import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotation_maker_pro/base/widgets/screen_template.dart';
import 'package:quotation_maker_pro/pojo/make_quotation_singleton.dart';
import 'package:quotation_maker_pro/screens/products/productList/bloc/all_products_screen_bloc.dart';
import 'package:quotation_maker_pro/screens/products/productList/bloc/all_products_screen_events.dart';
import 'package:quotation_maker_pro/screens/products/productList/bloc/all_products_screen_states.dart';
import 'package:quotation_maker_pro/screens/products/productList/widgets/productListItem.dart';

import '../../../base/styles.dart';
import '../../../base/widgets/buttons.dart';
import '../../../pojo/product.dart';

class ProductListScreen extends StatelessWidget {
  ProductListingPageMode mode;

  ProductListScreen({this.mode = ProductListingPageMode.normal, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String pageTitle = "";
    if (mode == ProductListingPageMode.forSelect)
      pageTitle = AppStringsEn.selectProducts;
    else
      pageTitle = AppStringsEn.productList;
    return ScreenTemplate(
      pageTitle: pageTitle,
      showFab: true,
      showCTAButton: false,
      showSearchField: true,
      searchFieldText: AppStringsEn.searchProducts,
      pageContent: ProudctListContent(mode),
    );
  }
}

class ProudctListContent extends StatefulWidget {
  ProductListingPageMode mode;

  ProudctListContent(this.mode, {Key? key}) : super(key: key);

  @override
  State<ProudctListContent> createState() => _ProductListContentState();
}

class _ProductListContentState extends State<ProudctListContent> {
  var bloc = AllProductsBloc();
  List<Product> products = [];
  var obj = MakeQuotationSingleton();

  @override
  void initState() {
    bloc.add(GetAllProductsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => bloc,
      child: BlocListener<AllProductsBloc, AllProductsState>(
        listener: (context, state) => {
          if (state is AllProductsError)
            {
              //TODO: HANDLE ERROR STATE IN ALL PRODUCT PAGE
            }
        },
        child: BlocBuilder<AllProductsBloc, AllProductsState>(
          builder: (context, state) {
            if (state is AllProductsLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildProductList(state.products),
                  if (widget.mode == ProductListingPageMode.forSelect)
                    AppButton(AppStringsEn.save, () {
                      obj.products.addAll(products);
                      Navigator.pop(context, true);
                    })
                ],
              );
            } else if (state is AllProductsLoading) {
              return CircularProgressIndicator();
            } else if (state is AllProductsInitial) {
              return CircularProgressIndicator();
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Widget buildProductList(List<Product> products) => ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: products.length,
      shrinkWrap: true,
      itemBuilder: (context, i) {
        return buildProductItem(products[i], widget.mode);
      });

  Widget buildProductItem(Product product, ProductListingPageMode mode) =>
      ProductListItem(
        product,
        mode,
        onSelectCallback: (p, bool) {
          if (bool) {
            products.add(p);
          } else {
            products.remove(p);
          }
        },
      );
}
