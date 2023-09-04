import 'package:flutter/material.dart';
import 'package:quotation_maker_pro/pojo/make_quotation_singleton.dart';
import 'package:quotation_maker_pro/screens/products/addNewProduct/add_new_product.dart';

import '../../../../base/styles.dart';
import '../../../../base/widgets/dashboard_grid_item.dart';
import '../../../../pojo/product.dart';

class ProductListItem extends StatefulWidget {
  Product product;
  ProductListingPageMode mode;
  Function(Product, bool)? onSelectCallback;
  VoidCallback? onDeleteClicked;

  ProductListItem(this.product, this.mode,
      {this.onSelectCallback, this.onDeleteClicked, Key? key})
      : super(key: key);

  @override
  State<ProductListItem> createState() => _ProductListItemState();
}

class _ProductListItemState extends State<ProductListItem> {
  bool? itemSelected = false;
  var obj = MakeQuotationSingleton();

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
                  if (widget.mode == ProductListingPageMode.forSelect)
                    Checkbox(
                      value: itemSelected,
                      onChanged: (value) async {
                        if (value == true) {
                          var result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddNewProductScreen(
                                product: widget.product,
                                forCount: widget.mode ==
                                    ProductListingPageMode.forSelect,
                              ),
                            ),
                          );
                          if (result != null) {
                            setState(() {
                              itemSelected = value;
                              widget.onSelectCallback!(result, itemSelected!);
                            });
                          }
                        }
                      },
                    ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.brand,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        widget.product.width,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        widget.product.rimSize,
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
                                  AddNewProductScreen(product: widget.product),
                            ),
                          );
                        },
                        child: AppIconImageSVG('assets/images/edit_icon.svg')),
                  ),
                  if (widget.mode == ProductListingPageMode.afterSelect)
                    SizedBox(
                      width: 10,
                    ),
                  if (widget.mode == ProductListingPageMode.afterSelect)
                    Container(
                      height: 24,
                      width: 24,
                      child: InkWell(
                        onTap: () {
                          obj.products.remove(widget.product);
                          widget.onDeleteClicked!.call();
                        },
                        child: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

enum ProductListingPageMode { normal, forSelect, afterSelect }
