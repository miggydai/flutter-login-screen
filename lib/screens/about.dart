import 'package:auto_size_text/auto_size_text.dart';
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
      padding: EdgeInsets.only(left: 30, right: 30),
      color: backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MyCard(
              name: 'migss',
              pic:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnYz_yN68eGjMSQ5pbum94YUpIPPvJOp4XTg&usqp=CAU"),
          SizedBox(
            height: 150,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                  alignment: Alignment.bottomCenter,
                  child: MyLogo(
                      color: Colors.red,
                      logo: FontAwesomeIcons.doorOpen,
                      route: "/")),
              Padding(
                padding: const EdgeInsets.only(left: 2),
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: MyLogo(
                        color: Colors.blueGrey,
                        logo: FontAwesomeIcons.discord,
                        route: "")),
              ),
            ],
          ),
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
          Container(child: MySidebar(side: 1)),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                constraints: const BoxConstraints(maxHeight: 250),
                child: Image.asset("patrick.jpg"),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 450,
                height: 250,
                child: AutoSizeText(
                  "My flutter experience so far has been a fun one. Learning flutter was a challenge since im used to coding is javascript but since i've been coding java for along time, I got a hand of it pretty quickly. Learning flutter for the first time and experimenting was very fun and though there were some challenges, overcoming them felt great and moving forward I want to learn flutter more and dive deeper into the rabit hole. ",
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
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
Scaffold mobileView(BuildContext context) {
  return Scaffold(
    endDrawer: Container(
      width: MediaQuery.of(context).size.width * .5,
      height: MediaQuery.of(context).size.height,
      color: Colors.blue[50],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MyCard(
              name: 'migs',
              pic:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnYz_yN68eGjMSQ5pbum94YUpIPPvJOp4XTg&usqp=CAU"),
          SizedBox(
            height: 150,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                  alignment: Alignment.bottomCenter,
                  child: MyLogo(
                      color: Colors.red,
                      logo: FontAwesomeIcons.doorOpen,
                      route: "/")),
              Padding(
                padding: const EdgeInsets.only(left: 2),
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: MyLogo(
                        color: Colors.blueGrey,
                        logo: FontAwesomeIcons.discord,
                        route: "")),
              ),
            ],
          ),
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
    drawer: MySidebar(side: 1),
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
              Container(
                constraints: const BoxConstraints(maxHeight: 250),
                child: Image.asset("patrick.jpg"),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 300,
                height: 250,
                child: AutoSizeText(
                  "My flutter experience so far has been a fun one. Learning flutter was a challenge since im used to coding is javascript but since i've been coding java for along time, I got a hand of it pretty quickly. Learning flutter for the first time and experimenting was very fun and though there were some challenges, overcoming them felt great and moving forward I want to learn flutter more and dive deeper into the rabit hole. ",
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
