import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calculator/src/core/providers/color_provider.dart';
import 'package:calculator/src/ui/screens/bottom_navigation.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ColorProvider>(
      create: (context) => ColorProvider(),
      child: Consumer<ColorProvider>(
        builder: (context, colorProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Colorful Calculator',
            theme: ThemeData(
              primarySwatch: colorProvider.currentColor,
            ),
            home: BottomNavigationScreen(),
          );
        },
      ),
    );
  }
}
