import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:payme/app.dart';
import 'package:payme/design/color.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            secondaryBlue,
            primaryBlue,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.chevron_left_rounded,
              color: Colors.white,
            ),
            onPressed: Navigator.of(context).pop,
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              // Text(
              //   'Settings',
              //   style: Theme.of(context).primaryTextTheme.titleLarge,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
