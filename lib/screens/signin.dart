import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_login/widgets/button.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_login/widgets/textfield.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
        LayoutBuilder(builder: (BuildContext, BoxConstraints constraints) {
      if (constraints.maxWidth > 400) {
        return WebView(context);
      } else {
        return mobileView(context);
      }
    }));
  }
}

ElevatedButton IconButton(String a) {
  return ElevatedButton(onPressed: () {}, child: Text(a));
}

Scaffold WebView(BuildContext context) {
  return Scaffold(
    body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Color.fromRGBO(238, 239, 248, 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          //right side
          Container(
              width: MediaQuery.of(context).size.width * .5,
              height: MediaQuery.of(context).size.height,
              decoration: new BoxDecoration(
                gradient: new LinearGradient(
                  colors: [
                    Color.fromRGBO(107, 137, 232, 1),
                    Color.fromRGBO(82, 93, 221, 1)
                  ],
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                ),
              )),
          //left side
          Container(
            width: MediaQuery.of(context).size.width * .5,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                TField(text: "Email", ob: false),
                TField(text: "Password", ob: true),

                MyButton(title: "Sign In", route: "/second"),
                SizedBox(
                  height: 15,
                ),
                TextButton(onPressed: () {}, child: Text("Forgot Password?")),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(FontAwesomeIcons.facebook),
                    SizedBox(
                      width: 25,
                    ),
                    Icon(FontAwesomeIcons.google),
                    SizedBox(
                      width: 25,
                    ),
                    Icon(FontAwesomeIcons.twitter)
                  ],
                ),
                // SizedBox(height: 100,),
                //bottom
                Container(
                  height: 50,
                ),
                MyButton(title: "Sign Up", route: "./third"),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Scaffold mobileView(BuildContext context) {
  return Scaffold(
    body: Container(
        color: Color.fromRGBO(238, 239, 248, 1),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * .99,
                height: MediaQuery.of(context).size.width * .35,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.zero),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(255, 219, 219, 219), //New
                        blurRadius: 25.0,
                        offset: Offset(0, 25))
                  ],
                ),
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(15),
                        right: Radius.circular(30),
                      ),
                      color: Colors.white),
                  padding: EdgeInsets.only(left: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        'Welcome!',
                        style: TextStyle(
                            fontSize: 30,
                            color: const Color.fromRGBO(112, 144, 234, 1),
                            fontWeight: FontWeight.w400),
                        maxLines: 1,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      AutoSizeText(
                        'Sign In and get started',
                        style: TextStyle(fontSize: 15),
                        maxLines: 2,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Column(
                children: [
                  TField(text: "Email", ob: false),
                  // ignore: prefer_const_constructors

                  TField(text: "Password", ob: true),

                  MyButton(title: "Sign In", route: "./second"),

                  SizedBox(
                    height: 15,
                  ),

                  TextButton(onPressed: () {}, child: Text("Forgot Password?")),

                  SizedBox(
                    height: 15,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(FontAwesomeIcons.facebook),
                      SizedBox(
                        width: 25,
                      ),
                      Icon(FontAwesomeIcons.google),
                      SizedBox(
                        width: 25,
                      ),
                      Icon(FontAwesomeIcons.twitter)
                    ],
                  ),

                  SizedBox(
                    height: 50,
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width * .6,
                    height: 2,
                    color: Colors.grey[300],
                  ),

                  SizedBox(
                    height: 35,
                  ),

                  MyButton(title: "Sign Up", route: "./third")
                ],
              ),
            ])),
  );
}
