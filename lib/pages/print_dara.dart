import 'package:exam_test/config/get_it_config.dart';
import 'package:exam_test/res/app_color.dart';
import 'package:exam_test/res/app_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrintDataPage extends StatelessWidget {
  const PrintDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
      ),
      backgroundColor: primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Welcome ${core.get<SharedPreferences>().getString('email')}",
              style: NameStyle,
            ),
          ),
        ],
      ),
    );
  }
}
