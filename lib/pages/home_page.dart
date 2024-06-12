import 'package:exam_test/pages/print_dara.dart';
import 'package:exam_test/pages/search_page.dart';
import 'package:exam_test/res/app_color.dart';
import 'package:exam_test/res/app_images.dart';
import 'package:exam_test/res/app_string.dart';
import 'package:exam_test/res/app_style.dart';

import 'package:exam_test/service/comments_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding:
                const EdgeInsets.only(left: 20, top: 10, bottom: 10, right: 15),
            margin:
                const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 50),
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: scondryColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  ALLPROJECTS,
                  style: NameStyle,
                ),
                Row(
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SearchPage()));
                        },
                        child: const Icon(
                          Icons.search,
                          size: 27,
                        )),
                    const SizedBox(
                      width: 15,
                    ),
                    Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          FutureBuilder(
              future: CommentsServiceImp().getComments(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const PrintDataPage()));
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
                                      "Project name: ${snapshot.data![index].body.substring(0, 10)}",
                                      style: textCardStyle
                                    ),
                                  ),
                                  Positioned(
                                    right: 60,
                                    bottom: 30,
                                    child: Text(
                                      "Crearted by ${snapshot.data![index].user.username}",
                                      style:textCardStyle,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              })
        ],
      ),
    );
  }
}
