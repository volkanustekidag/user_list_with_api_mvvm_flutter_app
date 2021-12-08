import 'package:flutter/material.dart';

class AppError extends StatelessWidget {
  final String errorTxt;

  const AppError({this.errorTxt = ''});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: null != errorTxt && errorTxt.isNotEmpty,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          errorTxt,
          style: TextStyle(color: Colors.red, fontSize: 18.0),
        ),
      ),
    );
  }
}
