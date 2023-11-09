import 'package:churchgroupsmanagement/screens/root_navigation.dart';
import 'package:churchgroupsmanagement/services/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainPageAppBar extends StatelessWidget {
  const MainPageAppBar({
    super.key,
    required this.pageTitle,
    required this.pageSubtitle,
    required this.onTapTrailing,
  });

  final String pageTitle;
  final String pageSubtitle;
  final void Function() onTapTrailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenDimension().screenWidth(context),
      height: ScreenDimension().screenHeight(context) * 0.14,
      decoration: BoxDecoration(
        color: AppColors().mainBlueColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: Offset(1, 2),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          15,
          MediaQuery.of(context).padding.top,
          20,
          10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => zoomDrawerController.toggle!(),
                  child: Container(
                    padding: EdgeInsets.all(7),
                    margin: EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: SvgPicture.asset(
                      "assets/icons/menu_burger.svg",
                      color: AppColors().mainBlueColor,
                      width: 17,
                      height: 17,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pageTitle,
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 0.7,
                        height: 1.5,
                        fontSize: 17,
                        shadows: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            offset: Offset(1, 2),
                            blurRadius: 3,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      pageSubtitle,
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 0.7,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            GestureDetector(
              onTap: () => onTapTrailing,
              child: Icon(
                CupertinoIcons.add,
                color: Colors.white,
                size: 30,
                shadows: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    offset: Offset(1, 2),
                    blurRadius: 3,
                    spreadRadius: 5,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
