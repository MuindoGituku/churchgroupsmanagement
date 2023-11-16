import 'package:churchgroupsmanagement/services/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsScreenAppBar extends StatelessWidget {
  const DetailsScreenAppBar({
    super.key,
    required this.onTapMoreDetails,
    required this.onTapEditor,
    required this.pageHeading,
    required this.pageSubHeading,
  });

  final void Function() onTapMoreDetails;
  final void Function() onTapEditor;
  final String pageHeading;
  final String pageSubHeading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenDimension().screenWidth(context),
      height: ScreenDimension().screenHeight(context) * 0.13,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          15,
          MediaQuery.of(context).padding.top,
          20,
          0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Image.asset(
                      "assets/icons/back.png",
                      color: Colors.blue,
                      width: 17,
                      height: 17,
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                GestureDetector(
                  onTap: onTapMoreDetails,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: ScreenDimension().screenWidth(context) * 0.50,
                        child: Text(
                          pageHeading,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600,
                            height: 1.5,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: ScreenDimension().screenWidth(context) * 0.53,
                        child: Text(
                          pageSubHeading,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            letterSpacing: 0.4,
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: onTapEditor,
                    child: Icon(
                      CupertinoIcons.pencil_outline,
                      color: AppDecorations().mainBlueColor,
                      size: 25,
                    ),
                  ),
                  const SizedBox(width: 25),
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      CupertinoIcons.ellipsis_vertical,
                      color: AppDecorations().mainBlueColor,
                      size: 25,
                    ),
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
