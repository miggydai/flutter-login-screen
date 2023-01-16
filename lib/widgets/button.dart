import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyButton extends StatelessWidget {
  final String title;
  final String route;
  const MyButton({Key? key, required this.title, required this.route})
      : super(key: key);
  // const MyButton({Key key, this.route}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0))),
            side: MaterialStateProperty.all(BorderSide(
                color: Color(0xFF03bfcb),
                width: 1.0,
                style: BorderStyle.solid,
                strokeAlign: StrokeAlign.inside)),
            padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 85, vertical: 20)),
            backgroundColor:
                MaterialStateProperty.all(const Color.fromRGBO(35, 30, 57, 1)),
            foregroundColor: MaterialStateProperty.all(
                const Color.fromRGBO(152, 177, 203, 1)),
            overlayColor:
                MaterialStateProperty.all(const Color.fromRGBO(3, 191, 203, 1)),
            textStyle: MaterialStateProperty.all(const TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w300))),
        child: Text(title));
  }
}
