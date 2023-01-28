import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyLogo extends StatelessWidget {
  final Color color;
  final IconData logo;
  final String route;
  const MyLogo({Key? key, required this.color, required this.logo, required this.route})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        borderRadius: BorderRadius.circular(8),
        elevation: 12,
        child: TextButton(
          onPressed: () {
             Navigator.pushNamedAndRemoveUntil(context, route, ModalRoute.withName('/'));
          },
          child: Icon(
            logo,
            color: color,
          ),
          style: ButtonStyle(
              padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(vertical: 15))),
        ));
  }
}
