import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  String? message;

  Messages(this.message, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (message != null)
      return Text(message!);
    else
      return Text("");
  }
}
