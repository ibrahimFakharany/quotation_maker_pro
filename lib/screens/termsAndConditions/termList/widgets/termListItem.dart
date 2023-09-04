import 'package:flutter/material.dart';

import '../../../../base/styles.dart';
import '../../../../base/widgets/dashboard_grid_item.dart';
import '../../../../pojo/make_quotation_singleton.dart';
import '../../../../pojo/term.dart';
import '../../addNewTerm/add_new_term.dart';

class TermListItem extends StatefulWidget {
  Term term;
  TermsListingPageMode mode;
  Function(Term, bool)? onSelectCallback;
  VoidCallback? onDeleteClicked;

  TermListItem(this.term, this.mode,{this.onSelectCallback, this.onDeleteClicked,Key? key}) : super(key: key);

  @override
  State<TermListItem> createState() => _TermListItemState();
}

class _TermListItemState extends State<TermListItem> {
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
                  if (widget.mode == TermsListingPageMode.forSelect)
                    Checkbox(
                      value: itemSelected,
                      onChanged: (value) {
                        setState(() {
                          itemSelected = value;
                          widget.onSelectCallback!(
                              widget.term, itemSelected!);
                        });
                      },
                    ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.term.title,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
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
                              builder: (context) => AddNewTermScreen(term: widget.term),
                            ),
                          );
                        },
                        child: AppIconImageSVG('assets/images/edit_icon.svg')),
                  ),
                  if (widget.mode == TermsListingPageMode.afterSelect)
                    SizedBox(
                      width: 10,
                    ),
                  if (widget.mode == TermsListingPageMode.afterSelect)
                    Container(
                      height: 24,
                      width: 24,
                      child: InkWell(
                        onTap: () {
                          obj.terms.remove(widget.term);
                          widget.onDeleteClicked!.call();
                        },
                        child: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
enum TermsListingPageMode { normal, forSelect, afterSelect }