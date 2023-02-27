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
    return Container(
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: [
            Color.fromRGBO(107, 137, 232, 1),
            Color.fromRGBO(82, 93, 221, 1)
          ],
          begin: FractionalOffset.centerLeft,
          end: FractionalOffset.centerRight,
        ),
        borderRadius: BorderRadius.circular(40),
      ),
      child: TextButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, route, ModalRoute.withName('/'));
          },
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0),
              )),
              side: MaterialStateProperty.all(BorderSide(
                color: Color.fromRGBO(107, 137, 232, 1),
                width: .5,
                style: BorderStyle.solid,
              )),
              padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 100, vertical: 20)),
              overlayColor:
                  MaterialStateProperty.all(Color.fromRGBO(231, 236, 249, 1)),
              textStyle: MaterialStateProperty.all(
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.w300))),
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}
