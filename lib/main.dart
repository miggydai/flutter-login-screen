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
            color: Color.fromRGBO(233, 233, 233, 1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        constraints: const BoxConstraints(maxHeight: 250),
                        child: Image.asset("gif.gif"),
                      ),
                      // Center( child: Icon(FontAwesomeIcons.airbnb, size: 100,)),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: AutoSizeText(
                              'Welcome!',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                              maxLines: 1,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: AutoSizeText(
                              'Log in with your data that you entered during your registration',
                              style: TextStyle(fontSize: 15),
                              maxLines: 2,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyButton(title: "Sign Up", route: "/third"),
                          SizedBox(
                            height: 10,
                          ),
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
