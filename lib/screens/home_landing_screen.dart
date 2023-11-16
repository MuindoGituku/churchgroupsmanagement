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
                          const SizedBox(width: 5),
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
                      child: const Text(
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
                              child: const Text(
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
                              child: const Text(
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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(-3, 3),
                            blurRadius: 10,
                            color: Colors.grey.withOpacity(0.5),
                          )
                        ],
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(187, 255, 255, 255),
                      ),
                      child: Column(
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SingleAnalyticItem(
                                numberCount: "5",
                                tallyDesc: "Pending Documents",
                                artLocation: "assets/icons/time_management.png",
                              ),
                              SingleAnalyticItem(
                                numberCount: "47",
                                tallyDesc: "% Budget Utilisation",
                                artLocation: "assets/icons/speedometer.png",
                              ),
                              SingleAnalyticItem(
                                numberCount: "80",
                                tallyDesc: "% Audit Score",
                                artLocation: "assets/icons/trophy.png",
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    "assets/images/calendar_small.png",
                                  ),
                                  const SizedBox(width: 10),
                                  const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Visiting The Chaplain",
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          height: 2,
                                        ),
                                      ),
                                      Text(
                                        "November 2023",
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 11,
                                          fontWeight: FontWeight.w800,
                                          height: 2,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Text(
                                "Upcoming Activity",
                                style: TextStyle(
                                  fontSize: 9,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(15, 5, 0, 10),
                    child: Text(
                      "Notifications",
                      style: TextStyle(
                        fontFamily: "OpenSansSemiCondensed",
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SingleAnalyticItem extends StatelessWidget {
  const SingleAnalyticItem({
    super.key,
    required this.numberCount,
    required this.tallyDesc,
    required this.artLocation,
  });

  final String numberCount;
  final String tallyDesc;
  final String artLocation;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 64, 156, 255),
      surfaceTintColor: Colors.transparent,
      clipBehavior: Clip.hardEdge,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: ScreenDimension().screenWidth(context) * .2,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    numberCount,
                    style: const TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 3,
                      height: 1.5,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    tallyDesc,
                    textAlign: TextAlign.left,
                    maxLines: 2,
                    overflow: TextOverflow.clip,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 241, 241, 241),
                    ),
                  ),
                ],
              ),
              Positioned(
                right: -5,
                top: -5,
                child: Container(
                  width: 35,
                  height: 35,
                  decoration: const BoxDecoration(),
                  child: Image.asset(
                    artLocation,
                    color: Colors.white.withOpacity(0.3),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
