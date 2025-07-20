import 'package:flutter/material.dart';
import 'package:flutter_day_6/screens/Welcome_Screen.dart';

void main() {
  runApp(App_1());
}

class  App_1 extends StatelessWidget {
  const App_1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: WelcomeScreen());
  }
}

