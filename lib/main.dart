import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/screens/signin.dart';
import 'package:flutter_login/screens/signup.dart';
import 'package:flutter_login/widgets/button.dart';

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * .9,
                  padding: EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        'Welcome!',
                        style: TextStyle(fontSize: 20),
                        maxLines: 1,
                      ),
                      AutoSizeText(
                        'Log in with your data that you entered during your registration',
                        style: TextStyle(fontSize: 15),
                        maxLines: 2,
                      ),
                      MyButton(title: "Sign Up", route: "/third"),
                      MyButton(title: "Sign In", route: "/second")
                    ],
                  ),
                )
              ],
            )));
  }
}