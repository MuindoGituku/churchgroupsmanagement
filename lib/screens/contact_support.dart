import 'package:churchgroupsmanagement/data/sample_chat.dart';
import 'package:churchgroupsmanagement/screens/root_navigation.dart';
import 'package:churchgroupsmanagement/services/constants.dart';
import 'package:churchgroupsmanagement/widgets/main_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class ContactSupport extends StatefulWidget {
  const ContactSupport({super.key});

  @override
  State<ContactSupport> createState() => _ContactSupportState();
}

class _ContactSupportState extends State<ContactSupport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MainPageAppBar(
            pageTitle: "Contact Support",
            hasRightButtons: false,
            pageSubtitle: "Open a chat with an IT Consultant",
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  ...sampleConsultationChat.map(
                    (eachMessage) {
                      return eachMessage["sender"] == "Isabel"
                          ? Padding(
                              padding: const EdgeInsets.fromLTRB(15, 10, 5, 5),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      "assets/icons/user.png",
                                      width: 25,
                                      height: 25,
                                    ),
                                    const SizedBox(width: 10),
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      width: ScreenDimension()
                                              .screenWidth(context) *
                                          .8,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                          bottomLeft: Radius.zero,
                                          bottomRight: Radius.circular(10),
                                        ),
                                        color:
                                            Color.fromARGB(255, 188, 222, 250),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: Text(
                                              eachMessage["messageContent"]!,
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: Text(
                                              "${DateFormat.yMMMEd().format(
                                                DateTime.parse(
                                                  eachMessage["dateTime"]!,
                                                ),
                                              )} at ${DateFormat.jm().format(
                                                DateTime.parse(
                                                  eachMessage["dateTime"]!,
                                                ),
                                              )}",
                                              style: TextStyle(
                                                fontSize: 9,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.fromLTRB(5, 10, 15, 5),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      width: ScreenDimension()
                                              .screenWidth(context) *
                                          .8,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.zero,
                                        ),
                                        color: const Color.fromARGB(
                                            255, 217, 216, 216),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: Text(
                                              eachMessage["messageContent"]!,
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: Text(
                                              "${DateFormat.yMMMEd().format(
                                                DateTime.parse(
                                                  eachMessage["dateTime"]!,
                                                ),
                                              )} at ${DateFormat.jm().format(
                                                DateTime.parse(
                                                  eachMessage["dateTime"]!,
                                                ),
                                              )}",
                                              style: TextStyle(
                                                fontSize: 9,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Image.asset(
                                      "assets/icons/user.png",
                                      width: 25,
                                      height: 25,
                                    ),
                                  ],
                                ),
                              ),
                            );
                    },
                  ),
                ],
              ),
            ),
          ),
          IntrinsicHeight(
            child: Container(
              padding: EdgeInsets.fromLTRB(
                10,
                5,
                10,
                MediaQuery.of(context).padding.bottom,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: ScreenDimension().screenWidth(context) * 0.8,
                    child: TextFormField(
                      showCursor: true,
                      maxLines: 5,
                      minLines: 1,
                      textInputAction: TextInputAction.done,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: InputDecoration(
                        hintText: "Type a Message...",
                        filled: true,
                        fillColor: Color.fromARGB(255, 210, 233, 252),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                          gapPadding: 0,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppDecorations().mainBlueColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: SvgPicture.asset(
                          "assets/icons/paper_plane_filled.svg",
                          width: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
