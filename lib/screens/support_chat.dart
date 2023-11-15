import 'package:churchgroupsmanagement/data/sample_chat.dart';
import 'package:churchgroupsmanagement/screens/root_navigation.dart';
import 'package:churchgroupsmanagement/services/constants.dart';
import 'package:churchgroupsmanagement/widgets/document_form_appbar.dart';
import 'package:churchgroupsmanagement/widgets/main_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class ConsultationChat extends StatefulWidget {
  const ConsultationChat({super.key});

  @override
  State<ConsultationChat> createState() => _ConsultationChatState();
}

class _ConsultationChatState extends State<ConsultationChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DocumentFormAppBar(
            formHeading: "Uploading Attatchments to Reports",
            showSecondaryButton: false,
            formSubHeading: "Chat in progress",
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
                                      width: 20,
                                      height: 20,
                                    ),
                                    const SizedBox(width: 10),
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      width: ScreenDimension()
                                              .screenWidth(context) *
                                          .82,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                          bottomLeft: Radius.zero,
                                          bottomRight: Radius.circular(10),
                                        ),
                                        color:
                                            Color.fromARGB(255, 214, 234, 252),
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
                                            padding: const EdgeInsets.all(5)
                                                .copyWith(top: 0),
                                            child: Text(
                                              "${DateFormat.yMEd().format(
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
                                                color: const Color.fromARGB(
                                                    255, 119, 118, 118),
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
                                          .82,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.zero,
                                        ),
                                        color:
                                            Color.fromARGB(255, 232, 232, 232),
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
                                            padding: const EdgeInsets.all(5)
                                                .copyWith(top: 0),
                                            child: Text(
                                              "${DateFormat.yMEd().format(
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
                                                color: Color.fromARGB(
                                                    255, 119, 118, 118),
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
                        fillColor: Color.fromARGB(255, 214, 234, 252),
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
                        borderRadius: BorderRadius.circular(10),
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
