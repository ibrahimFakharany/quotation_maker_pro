import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  String hint;
  var controller = TextEditingController();

  SearchField(this.hint, this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: TextField(
        controller: controller,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.0),
          ),
          filled: true,
          fillColor: Colors.white,
          hintText: hint,
          hintStyle: TextStyle(
            color: Color(0xFFC6C5C5),
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
        ),
        keyboardType: TextInputType.text,
        style: TextStyle(
          color: Color(0xFF000000),
          fontSize: 16,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class DataInput extends StatelessWidget {
  String hint;
  var controller = TextEditingController();
  TextInputType? keyboardType;

  DataInput(this.hint, this.controller, {this.keyboardType, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: TextField(
        controller: controller,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.0),
          ),
          filled: true,
          fillColor: Color(0x4F838383),
          hintText: hint,
          hintStyle: TextStyle(
            color: Color(0xFF676767),
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
        ),
        keyboardType: keyboardType ?? TextInputType.text,
        style: TextStyle(
          color: Color(0xFF676767),
          fontSize: 16,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
