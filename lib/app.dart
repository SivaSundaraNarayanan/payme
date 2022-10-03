import 'package:flutter/material.dart';
import 'package:payme/design/theme.dart';
import 'package:payme/screen/home.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.data,
      home: const HomeScreen(),
    );
  }
}
