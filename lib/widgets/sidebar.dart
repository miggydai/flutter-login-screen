import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sidebarx/sidebarx.dart';

class MySidebar extends StatelessWidget {
  final int side;
  const MySidebar({Key? key, required this.side}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: side == 1 ? sidebar1(context) : sidebar2(context),
    );
  }
}

SidebarX sidebar1(BuildContext context) {
  return SidebarX(
    controller: SidebarXController(selectedIndex: 0, extended: true),
    theme: const SidebarXTheme(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(107, 137, 232, 1),
              Color.fromARGB(255, 68, 79, 197)
            ],
            begin: FractionalOffset.topLeft,
            end: FractionalOffset.bottomRight,
          ),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), bottomRight: Radius.circular(20))),
      iconTheme: IconThemeData(color: Colors.white),
      selectedTextStyle: TextStyle(color: Colors.white),
    ),
    extendedTheme: const SidebarXTheme(width: 250),
    footerDivider: Divider(color: Colors.white.withOpacity(0.8), height: 1),
    headerBuilder: (context, extended) {
      return const SizedBox(
        height: 100,
        child: Icon(
          FontAwesomeIcons.airbnb,
          size: 60,
          color: Colors.white,
        ),
      );
    },
    items: [
      SidebarXItem(
        icon: Icons.home,
        label: ' Home',
        onTap: () {
          Navigator.pushNamedAndRemoveUntil(
              context, "/Home", ModalRoute.withName('/'));
          ;
        },
      ),
      SidebarXItem(icon: Icons.settings, label: ' Setting'),
      SidebarXItem(icon: Icons.dark_mode, label: ' Light/Dark Mode'),
      SidebarXItem(icon: Icons.question_mark, label: ' About', onTap: null),
    ],
  );
}

SidebarX sidebar2(BuildContext context) {
  return SidebarX(
    controller: SidebarXController(selectedIndex: 0, extended: true),
    theme: const SidebarXTheme(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(107, 137, 232, 1),
              Color.fromARGB(255, 68, 79, 197)
            ],
            begin: FractionalOffset.topLeft,
            end: FractionalOffset.bottomRight,
          ),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), bottomRight: Radius.circular(20))),
      iconTheme: IconThemeData(color: Colors.white),
      selectedTextStyle: TextStyle(color: Colors.white),
    ),
    extendedTheme: const SidebarXTheme(width: 250),
    footerDivider: Divider(color: Colors.white.withOpacity(0.8), height: 1),
    headerBuilder: (context, extended) {
      return const SizedBox(
        height: 100,
        child: Icon(
          FontAwesomeIcons.airbnb,
          size: 60,
          color: Colors.white,
        ),
      );
    },
    items: [
      SidebarXItem(
        icon: Icons.home,
        label: ' Home',
        onTap: null,
      ),
      SidebarXItem(icon: Icons.settings, label: ' Setting'),
      SidebarXItem(icon: Icons.dark_mode, label: ' Light/Dark Mode'),
      SidebarXItem(
          icon: Icons.question_mark,
          label: ' About',
          onTap: (() {
            Navigator.pushNamedAndRemoveUntil(
                context, "/About", ModalRoute.withName('/Home'));
          })),
    ],
  );
}
