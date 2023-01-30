import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_login/widgets/card.dart';
import 'package:flutter_login/widgets/sidebar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sidebarx/sidebarx.dart';

const backgroundColor = Color.fromRGBO(233, 233, 233, 1);

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
        LayoutBuilder(builder: (BuildContext, BoxConstraints constraints) {
      if (constraints.maxWidth > 600) {
        return WebView(context);
      } else {
        return mobileView(context);
      }
    }));
  }
}

//=============================================Web View==========================================================
Scaffold WebView(BuildContext context) {
  return Scaffold(
    endDrawer: Container(
      width: MediaQuery.of(context).size.width * .3,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.only(bottom: 150, left: 30, right: 30),
      color: backgroundColor,
      child: MyCard(),
    ),
    body: Container(
      width: MediaQuery.of(context).size.width,
      color: backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(child: MySidebar()),
          Center(
            child: Icon(FontAwesomeIcons.airbnb),
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
                        color: Colors.black)),
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
Scaffold mobileView(BuildContext context) {
  return Scaffold(
    endDrawer: Container(
      width: MediaQuery.of(context).size.width * .5,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.only(bottom: 150, left: 30, right: 30),
      color: Colors.blue[50],
      child: MyCard(),
    ),
    appBar: AppBar(
      title: Text("hello"),
      actions: [
        Builder(
            builder: (context) => IconButton(
                onPressed: () => Scaffold.of(context).openEndDrawer(),
                icon:
                    Icon(FontAwesomeIcons.userAstronaut, color: Colors.black))),
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
          Center(
            child: Icon(FontAwesomeIcons.airbnb),
          ),
        ],
      ),
    ),
  );
}
