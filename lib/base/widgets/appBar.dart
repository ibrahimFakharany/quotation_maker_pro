import 'package:flutter/material.dart';

import '../styles.dart';

class Title extends StatelessWidget {
  String title;

  Title(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class ApplicationBar extends StatelessWidget {
  String title;
  bool showReset;
  VoidCallback? resetClicked;

  ApplicationBar(this.title, this.showReset, this.resetClicked, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 10, right: 10, top: 60, bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 1.5, color: AppColors.borderColor),
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Title(title)],
            ),
          ),
          if (showReset)
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                  onTap: resetClicked,
                  child: Text(
                    AppStringsEn.reset,
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: AppColors.mainColor,
                      fontSize: 18,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  )),
            ),
        ],
      ),
    );
  }
}
