import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String displayNum = '0';
  String calcNum = '';
  String operationSymbol = '';
  double result;
  bool shouldCalculate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Calculator'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          displayNum,
                          textAlign: TextAlign.end,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 80.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: <Widget>[
                  _buttonRow('+', '-', '*', '/'),
                  _buttonRow('7', '8', '9', '0'),
                  _buttonRow('4', '5', '6', 'CE'),
                  _buttonRow('1', '2', '3', '='),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _calcuButton(String buttonText) {
    return Expanded(
      child: ButtonTheme(
        height: double.infinity,
        child: OutlineButton(
          onPressed: () => _pressButton(buttonText),
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          splashColor: Theme.of(context).primaryColor.withOpacity(0.1),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor.withOpacity(0.1),
          ),
          highlightedBorderColor:
              Theme.of(context).primaryColor.withOpacity(0.1),
        ),
      ),
    );
  }

  Widget _buttonRow(String firstButton, String secondButton, String thirdButton,
      String fourthButton) {
    return Expanded(
      child: Row(
        children: <Widget>[
          _calcuButton(firstButton),
          _calcuButton(secondButton),
          _calcuButton(thirdButton),
          _calcuButton(fourthButton),
        ],
      ),
    );
  }

  void _pressButton(String buttonText) {
    setState(() {
      switch (buttonText) {
        case '+':
        case '-':
        case '*':
        case '/':
          if (shouldCalculate) {
            _calculate();
          } else {
            result = double.tryParse(calcNum) ?? 0;
            shouldCalculate = true;
          }
          calcNum = '';
          operationSymbol = buttonText;

          break;
        case '=':
          _calculate();
          operationSymbol = '';
          shouldCalculate = false;
          break;
        case 'CE':
          calcNum = '';
          displayNum = '0';
          operationSymbol = '';
          result = 0;
          shouldCalculate = false;
          break;
        default:
          calcNum += buttonText;
          displayNum = calcNum;
      }
    });
  }

  void _calculate() {
    switch (operationSymbol) {
      case '+':
        result += double.tryParse(calcNum) ?? 0;
        break;
      case '-':
        result -= double.tryParse(calcNum) ?? 0;
        break;
      case '*':
        result *= double.tryParse(calcNum) ?? 0;
        break;
      case '/':
        result /= double.tryParse(calcNum) ?? 0;
        break;
      default:
        break;
    }
    if (result.isNaN) result = 0;
    calcNum = result.toString();
    displayNum = calcNum;
  }
}
