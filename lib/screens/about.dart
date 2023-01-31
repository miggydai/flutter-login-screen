import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:flutter_login/widgets/card.dart';
import 'package:flutter_login/widgets/sidebar.dart';
import 'package:flutter_login/widgets/logo.dart';

const backgroundColor = Color.fromRGBO(233, 233, 233, 1);
const primaryColor = Color.fromRGBO(107, 137, 232, 1);
const complimentColor = Color.fromRGBO(82, 93, 221, 1);

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body:
        LayoutBuilder(builder: (BuildContext, BoxConstraints constraints) {
      if (constraints.maxWidth > 600) {
        return WebView(context);
      } else {
        return mobileView(context);
      }
    })
    );
  }
}

//=============================================Web View==========================================================
Scaffold WebView (BuildContext context){
  return Scaffold(
    endDrawer: Container(
      width: MediaQuery.of(context).size.width * .3,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.only( left: 30, right: 30),
      color: backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MyCard(),
          SizedBox(height: 150,),
          Align(
            alignment: Alignment.bottomRight,
            child:MyLogo(color: Colors.red, logo: FontAwesomeIcons.doorOpen, route: "/")),
        ],

      ),
    ),
    body: Container(
      width: MediaQuery.of(context).size.width,
      color: backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(child: MySidebar()),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                        constraints: const BoxConstraints(maxHeight: 250),
                        child: Image.asset("patrick.jpg"),
                      ),
                      Text("1. jdkasjkdjlka"),
                      SizedBox(height: 5,),
                      Text("2. jdkasjkdjlka"),
                      SizedBox(height: 5,),
                      Text("3. jdkasjkdjlka"),
                      SizedBox(height: 5,),
                      Text("4. jdkasjkdjlka"),
                      SizedBox(height: 5,),
                      Text("5. jdkasjkdjlka")

                      

               ]
               ,
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Builder(
              builder: (context) => Material(
                borderRadius: BorderRadius.circular(8),
                elevation: 12,
                child: IconButton(
                    onPressed: () => Scaffold.of(context).openEndDrawer(),
                    icon: Icon(FontAwesomeIcons.userAstronaut,
                        color: primaryColor)),
              ),
            ),
          ),
          // Your app screen body
        ],
      ),
    ),
  );
}

//==================================================================Mobile View============================================================
Scaffold mobileView (BuildContext context) {
  return Scaffold(
     endDrawer: Container(
      width: MediaQuery.of(context).size.width * .5,
      height: MediaQuery.of(context).size.height,
      color: Colors.blue[50],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MyCard(),
          SizedBox(height: 150,),
          Align(
            alignment: Alignment.bottomRight,
            child:MyLogo(color: Colors.red, logo: FontAwesomeIcons.doorOpen, route: "/")),
        ],

      ),
    ),
    appBar: AppBar(
      backgroundColor: primaryColor,
      actions: [
        Builder(
            builder: (context) => IconButton(
                onPressed: () => Scaffold.of(context).openEndDrawer(),
                icon:
                    Icon(FontAwesomeIcons.userAstronaut, color: Colors.white))),
      ],
    ),
    drawer: MySidebar(),
    body: Container(
      width: MediaQuery.of(context).size.width,
      color: backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                Center(
            child:
                Text("Picture"),
          ),
            ],
          ),
        ],
      ),
    ),
  );
}
