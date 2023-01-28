import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class StField extends StatelessWidget {
  final String text;
  final bool ob;
  const StField({Key? key, required this.text, required this.ob})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .2,
      padding: const EdgeInsets.only(right: 35, left: 35, bottom: 15),
      child: Material(
          elevation: 18,
          shadowColor: Colors.grey[300],
          borderRadius: BorderRadius.circular(30),
          child: TextField(
            obscureText: ob,
            maxLines: 1,
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                labelText: text,
                fillColor: Colors.white,
                filled: true),
          )
      )

    );
  }
}