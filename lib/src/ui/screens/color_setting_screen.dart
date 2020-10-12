import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calculator/src/core/providers/color_provider.dart';

class ColorSettingScreen extends StatelessWidget {
  const ColorSettingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<MaterialColor> _colorList =
        Provider.of<ColorProvider>(context, listen: false).colorList;
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Setting'),
      ),
      body: SafeArea(
        child: Container(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: _colorList.length,
            itemBuilder: (context, index) {
              final MaterialColor colorItem = _colorList[index];
              final List<Color> colorItemList = [
                colorItem.shade100,
                colorItem.shade200,
                colorItem.shade300,
                colorItem.shade400,
                colorItem.shade500,
                colorItem.shade600,
                colorItem.shade700,
                colorItem.shade800,
                colorItem.shade900
              ];
              return GestureDetector(
                onTap: () => Provider.of<ColorProvider>(context, listen: false)
                    .handleColor(colorItem),
                child: Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: colorItemList,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
