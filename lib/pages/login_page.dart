import 'package:exam_test/config/get_it_config.dart';
import 'package:exam_test/pages/home_page.dart';
import 'package:exam_test/pages/print_dara.dart';
import 'package:exam_test/res/app_color.dart';
import 'package:exam_test/res/app_images.dart';
import 'package:exam_test/res/app_string.dart';
import 'package:exam_test/res/app_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  TextEditingController password = TextEditingController();

  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.all(50),
                width: double.infinity,
                height: 360,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: cardColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 60, bottom: 5, top: 60),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          EMAIL,
                          style: textAllStyle,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: SizedBox(
                        width: 226,
                        height: 43,
                        child: TextField(
                          controller: email,
                          decoration: InputDecoration(
                            hintText: HINT1,
                            hintStyle: hint1Style,
                            fillColor: scondryColor,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 60, bottom: 5, top: 20),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          PASSWORD,
                          style: textAllStyle,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      child: SizedBox(
                        width: 226,
                        height: 43,
                        child: TextField(
                          controller: password,
                          obscureText: true,
                          decoration: InputDecoration(
                            suffixIcon: const Icon(Icons.visibility_off),
                            hintText: HINT2,
                            hintStyle: hint2Style,
                            fillColor: scondryColor,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40, left: 60),
                      child: Row(
                        children: [
                          Container(
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            REMEMBER,
                            style: textAllStyle,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                        border: Border.all(color: primaryColor),
                        shape: BoxShape.circle,
                        color: buttonColor,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 160,
                    child: Container(
                      alignment: Alignment.center,
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: scondryColor,
                      ),
                      child: Image.asset(
                        intersectImage,
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          InkWell(
            onTap: () {
              if (password.text.length < 6) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("There is an error"),
                    backgroundColor: Colors.red,
                  ),
                );
              } else if (email.text.length < 3) {
                if (password.text.length < 6) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("There is an error"),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              } else {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
                core.get<SharedPreferences>().setString('email', email.text);
              }
            },
            child: Container(
              alignment: Alignment.center,
              width: 283,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: buttonColor,
              ),
              child: Text(
                LOGIN,
                style: loginStyle,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            DONTHAVE,
            style: dontStyle,
          )
        ],
      ),
    );
  }
}
