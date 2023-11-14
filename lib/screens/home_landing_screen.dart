import 'package:churchgroupsmanagement/screens/root_navigation.dart';
import 'package:churchgroupsmanagement/services/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeLandingScreen extends StatefulWidget {
  const HomeLandingScreen({super.key});

  @override
  State<HomeLandingScreen> createState() => _HomeLandingScreenState();
}

class _HomeLandingScreenState extends State<HomeLandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
              15,
              MediaQuery.of(context).padding.top,
              15,
              5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => zoomDrawerController.toggle!(),
                  child: Image.asset(
                    "assets/icons/menus.png",
                    width: 25,
                    color: AppDecorations().mainBlueColor,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppDecorations().mainBlueColor,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Woman's Guild",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                              color: AppDecorations().mainBlueColor,
                            ),
                          ),
                          SizedBox(width: 5),
                          Icon(
                            CupertinoIcons.chevron_down,
                            size: 20,
                            color: AppDecorations().mainBlueColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.zero,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 5, 10, 10),
                    child: SizedBox(
                      width: ScreenDimension().screenWidth(context) * 0.9,
                      child: Text(
                        "Welcome Back!",
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "OpenSansSemiCondensed",
                          height: 2,
                          fontWeight: FontWeight.w800,
                          color: Color.fromARGB(255, 66, 65, 65),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 10, 10, 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/icons/user.png",
                          width: 40,
                          height: 40,
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width:
                                  ScreenDimension().screenWidth(context) * 0.78,
                              child: Text(
                                "Isabel Ramirez",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "Poppins",
                                  height: 1.5,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 66, 65, 65),
                                ),
                              ),
                            ),
                            SizedBox(
                              width:
                                  ScreenDimension().screenWidth(context) * 0.78,
                              child: Text(
                                "Secretary - Woman's Guild (Parish Office)",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 12,
                                  height: 2,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 66, 65, 65),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
