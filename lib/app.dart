import 'package:flutter/material.dart';
import 'package:payme/data/upi.dart';
import 'package:payme/design/color.dart';
import 'package:payme/design/theme.dart';
import 'package:payme/screen/home.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    var data =
        'upi://pay?pa=9840954063@paytm&pn=Sivasundaranarayanan%20G&am=100';
    return MaterialApp(
      theme: AppTheme.data,
      home: const HomeScreen(),
    );
  }
}
