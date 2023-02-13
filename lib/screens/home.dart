import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_login/widgets/button.dart';
import 'package:flutter_login/widgets/card.dart';
import 'package:flutter_login/widgets/logo.dart';
import 'package:flutter_login/widgets/products.dart';
import 'package:flutter_login/widgets/sidebar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:http/http.dart';

const backgroundColor = Color.fromRGBO(233, 233, 233, 1);
const primaryColor = Color.fromRGBO(107, 137, 232, 1);
const complimentColor = Color.fromRGBO(82, 93, 221, 1);

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  String fullName = "";
  String picture = "";
  String loc = "";
  double len = 0;
  String meal = "";
  List data = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getRandomData().then((value) {
      var jsonData = jsonDecode(value.body);
      // print(jsonData['results']);
      setState(() {
        fullName = jsonData['results'][0]['name']['first'] +
            " " +
            jsonData['results'][0]['name']['last']; //getname
        picture = jsonData['results'][0]['picture']['medium']; //get picture
        loc = jsonData['results'][0]['location']['country']; //get coutry
      });
    });
    getFood();

    // getFood().then((value) {
    //   var data = jsonDecode(value.body);
    //   print(data['meals'][0]['strMeal']);

    //   setState(() {
    //     len = data["meals"].length;
    //     meal = data['meals'][0]['strMeal'];
    //   });
    // });
  }

  Future<Response> getRandomData() async {
    Response response = await get(Uri.parse('https://randomuser.me/api/'));
    return response;
  }

  void getFood() async {
    Response response = await get(Uri.parse(
        'https://www.themealdb.com/api/json/v1/1/filter.php?a=Indian'));
    if (response.statusCode == 200) {
      setState(() {
        data = json.decode(response.body)["meals"];
      });
    } else {
      throw Exception("Failed to Load");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: fullName != null
            ? LayoutBuilder(
                builder: (BuildContext, BoxConstraints constraints) {
                if (constraints.maxWidth > 600) {
                  return WebView(context, fullName, picture, loc, data);
                } else {
                  return mobileView(context, fullName, picture, loc);
                }
              })
            : Text("oh no"));
  }
}

//=============================================Web View==========================================================
Scaffold WebView(
    BuildContext context, String name, String pic, String loc, List data) {
  return Scaffold(
    floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    endDrawer: Container(
      width: MediaQuery.of(context).size.width * .3,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.only(top: 10, left: 30, right: 30),
      color: backgroundColor,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Wrap(children: [
              MyCard(name: name != null ? name : 'bogo', pic: pic, loc: loc)
            ]),
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
    ),
    body: Container(
      width: MediaQuery.of(context).size.width,
      color: backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(child: MySidebar(side: 2)),
          Container(
              width: MediaQuery.of(context).size.width * .6,
              height: MediaQuery.of(context).size.height,
              child: data != null
                  ? ListView.builder(
                      itemCount: data.length,
                      itemBuilder: ((context, index) {
                        return ProdCard(name: data[index]['strMeal']);
                      }))
                  : Center(
                      child: CircularProgressIndicator(),
                    )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Builder(
              builder: (context) => FloatingActionButton(
                onPressed: () => Scaffold.of(context).openEndDrawer(),
                backgroundColor: primaryColor,
                child: Icon(FontAwesomeIcons.userAstronaut,
                    color: backgroundColor),
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
Scaffold mobileView(BuildContext context, String name, String pic, String loc) {
  return Scaffold(
    endDrawer: Container(
      width: MediaQuery.of(context).size.width * .5,
      height: MediaQuery.of(context).size.height,
      color: Colors.blue[50],
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Wrap(children: [MyCard(name: name, pic: pic, loc: loc)]),
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
    drawer: MySidebar(side: 2),
    body: Container(
      width: MediaQuery.of(context).size.width,
      color: backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child:
                Icon(FontAwesomeIcons.airbnb, size: 100, color: primaryColor),
          ),
        ],
      ),
    ),
  );
}
