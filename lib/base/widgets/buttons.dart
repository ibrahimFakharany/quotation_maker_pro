import 'package:flutter/material.dart';
import 'package:quotation_maker_pro/base/styles.dart';

class AppButton extends StatelessWidget {
  String title;
  VoidCallback buttonCallback;
  double width;

  AppButton(this.title, this.buttonCallback,
      {this.width = double.infinity, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      width: width,
      child: ElevatedButton(
        onPressed: buttonCallback,
        style: ElevatedButton.styleFrom(primary: AppColors.mainColor),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            title,
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
    );
  }
}
