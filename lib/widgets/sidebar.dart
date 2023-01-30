import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sidebarx/sidebarx.dart';

class MySidebar extends StatelessWidget {
  const MySidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: SidebarXController(selectedIndex: 0, extended: true),
      theme: const SidebarXTheme(
        decoration: BoxDecoration(
            color: Color(0xFF2E2E48),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        iconTheme: IconThemeData(color: Colors.white),
        selectedTextStyle: const TextStyle(color: Colors.white),
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
            Navigator.pushNamed(context, '/Home');
          },
        ),
        SidebarXItem(icon: Icons.settings, label: ' Setting'),
        SidebarXItem(icon: Icons.dark_mode, label: ' Light/Dark Mode'),
        SidebarXItem(
            icon: Icons.question_mark,
            label: ' About',
            onTap: (() {
              Navigator.pushNamed(context, '/About');
            })),
      ],
    );
  }
}
