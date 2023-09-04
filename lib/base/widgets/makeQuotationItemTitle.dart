import 'package:flutter/material.dart';

import '../styles.dart';

class MakeQuotationItemTitle extends StatelessWidget {
  String sectionTitle;
  VoidCallback onIconClicked;

  MakeQuotationItemTitle(this.sectionTitle, this.onIconClicked, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: AppColors.mainColor,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            sectionTitle,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
          InkWell(onTap: onIconClicked, child: Icon(Icons.add))
        ],
      ),
    );
  }
}
