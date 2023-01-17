import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_login/widgets/button.dart';



class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body:Container(
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
            color: Colors.blue
          ),
          //left side
          Container(
            width: MediaQuery.of(context).size.width * .5,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //padd
                Container(
                  height: 200,
                ),

                TextField(obscureText: false,
            maxLines: 1,
            decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Email"
                      )),
                      SizedBox( height: 10),
                      TextField(obscureText: true,
            maxLines: 1,
            decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Password"
                      )),
                      SizedBox(height: 15,),
              MyButton(title: "Sign In", route: "/second"),
              SizedBox(height: 15,),
              TextButton(onPressed: () {}, child: Text("Forgot Password?")),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton("hi"),
                  SizedBox(width: 25,),
                  IconButton("hi"),
                  SizedBox(width: 25,),
                  IconButton("hi")
                ],
              ),
              // SizedBox(height: 100,),
              //bottom
              Container(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(top:20.0),
                child: MyButton(title: "Sign Up", route: "./third"),
              )
              ],
            ),
          )
         

            ],
          ),

          
          
        
      ),
    );
  }
}

ElevatedButton IconButton (String a) {
  return ElevatedButton(onPressed: () {}, child: Text(a));
}


Scaffold WebView (BuildContext context) {
  return Scaffold(
    body:Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.green,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

        ],
      ),
    )
  );
}

Scaffold mobileView (BuildContext context) {
  return Scaffold(

  );
}