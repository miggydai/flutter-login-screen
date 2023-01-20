import 'dart:html';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/screens/signin.dart';
import 'package:flutter_login/screens/signup.dart';
import 'package:flutter_login/widgets/button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:flutter_login/widgets/textfield.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomePage(),
        '/second': (context) => SignIn(),
        '/third': (context) => SignUp()
      },
    ));

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * .2,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Center( child: Icon(FontAwesomeIcons.airbnb, size: 100,)),
                      SizedBox(height: 20,),
                      AutoSizeText(
                        'Welcome!',
                        style: TextStyle(fontSize: 30),
                        maxLines: 1,
                      ),
                      SizedBox(height: 20,),
                      AutoSizeText(
                        'Log in with your data that you entered during your registration',
                        style: TextStyle(fontSize: 15),
                        maxLines: 2,
                      ),
                       SizedBox(height: 20,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyButton(title: "Sign Up", route: "/third"),
                          SizedBox(height: 10,),
                          MyButton(title: "Sign In", route: "/second"),
                        ],
                      )
                    ],
                  ),
                )
              ],
            )));
  }
}
