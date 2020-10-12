import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'home_screen.dart';
import 'color_setting_screen.dart';

class BottomNavigationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CupertinoTabScaffold(
        tabBuilder: (context, index) {
          return CupertinoTabView(
            builder: (context) {
              switch (index) {
                case 0:
                  return HomeScreen();
                case 1:
                  return ColorSettingScreen();
                default:
                  return Container();
              }
            },
          );
        },
        tabBar: CupertinoTabBar(
          border: Border(
            top: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 0.0,
              style: BorderStyle.solid,
            ),
          ),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.calculator),
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.palette),
            ),
          ],
        ),
      ),
    );
  }
}
