import 'package:churchgroupsmanagement/services/constants.dart';
import 'package:flutter/material.dart';

class DocumentFormAppBar extends StatelessWidget {
  const DocumentFormAppBar({
    super.key,
    required this.formHeading,
    required this.formSubHeading,
    this.showSecondaryButton = true,
  });

  final String formHeading;
  final String formSubHeading;
  final bool? showSecondaryButton;

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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: showSecondaryButton!
                          ? ScreenDimension().screenWidth(context) * 0.53
                          : ScreenDimension().screenWidth(context) * 0.75,
                      child: Text(
                        formHeading,
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
                      width: showSecondaryButton!
                          ? ScreenDimension().screenWidth(context) * 0.53
                          : ScreenDimension().screenWidth(context) * 0.75,
                      child: Text(
                        formSubHeading,
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
              ],
            ),
            showSecondaryButton!
                ? GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(10, 7, 10, 7),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppDecorations().mainBlueColor,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        "Save Draft",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: AppDecorations().mainBlueColor,
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
