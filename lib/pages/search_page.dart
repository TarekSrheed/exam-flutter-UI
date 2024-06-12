import 'package:exam_test/model/comments_model.dart';
import 'package:exam_test/pages/print_dara.dart';
import 'package:exam_test/res/app_color.dart';
import 'package:exam_test/res/app_images.dart';
import 'package:exam_test/res/app_string.dart';
import 'package:exam_test/res/app_style.dart';
import 'package:exam_test/service/comments_service.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  List<CommentsModel> result = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: FutureBuilder(
          future: CommentsServiceImp().getComments(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              result = snapshot.data!;
              return StatefulBuilder(builder: (context, setstate) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: SizedBox(
                        width: double.infinity,
                        child: TextField(
                          onChanged: (value) {
                            result = [];
                            for (var i = 0; i < snapshot.data!.length; i++) {
                              if (snapshot.data![i].user.username
                                  .contains(value)) {
                                result.add(snapshot.data![i]);
                              }
                            }
                            setstate(() {});
                          },
                          decoration: InputDecoration(
                            hintText: SEARCH,
                            suffixIcon: const Icon(Icons.search),
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
                    Expanded(
                      child: ListView.builder(
                          itemCount: result.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const PrintDataPage()));
                              },
                              child: Container(
                                margin: const EdgeInsets.all(30),
                                width: double.infinity,
                                height: 120,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        clipBehavior: Clip.hardEdge,
                                        child: Image.asset(
                                          triangleImage,
                                          fit: BoxFit.cover,
                                          height: 120,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 20,
                                      top: 30,
                                      child: Image(
                                        image: Image.asset(dateImage).image,
                                      ),
                                    ),
                                    Positioned(
                                      right: 30,
                                      top: 20,
                                      child: Text(
                                        "Project name: ${result[index].body.substring(0, 10)}",
                                        style: textCardStyle
                                      ),
                                    ),
                                    Positioned(
                                      right: 60,
                                      bottom: 30,
                                      child: Text(
                                        "Crearted by ${result[index].user.username}",
                                        style:textCardStyle
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                );
              });
            } else {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: SizedBox(
                      width: double.infinity,
                      child: TextField(
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          hintText: SEARCH,
                          suffixIcon: const Icon(Icons.search),
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
                  const Center(
                    child: CircularProgressIndicator(),
                  )
                ],
              );
            }
          }),
    );
  }
}
