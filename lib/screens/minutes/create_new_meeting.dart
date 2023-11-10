import 'package:churchgroupsmanagement/data/sample_agenda.dart';
import 'package:churchgroupsmanagement/data/sample_attendance.dart';
import 'package:churchgroupsmanagement/data/sample_minutes.dart';
import 'package:churchgroupsmanagement/services/constants.dart';
import 'package:churchgroupsmanagement/widgets/document_form_appbar.dart';
import 'package:churchgroupsmanagement/widgets/stepper_buttons.dart';
import 'package:churchgroupsmanagement/widgets/text_form_field.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateNewMeeting extends StatefulWidget {
  const CreateNewMeeting({super.key});

  @override
  State<CreateNewMeeting> createState() => _CreateNewMeetingState();
}

class _CreateNewMeetingState extends State<CreateNewMeeting> {
  int activeStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body: Column(
        children: [
          const DocumentFormAppBar(
            formHeading: "Create New Meeting",
            formSubHeading: "Woman's Guild",
          ),
          Expanded(
            child: Stepper(
              type: StepperType.horizontal,
              currentStep: activeStep,
              margin: EdgeInsets.zero,
              elevation: 0,
              onStepTapped: (value) => setState(() => activeStep = value),
              controlsBuilder: (context, details) {
                return CustomStepperButtons(
                  onTapContinue: () {
                    if (activeStep + 1 < newMeetingSteps.length) {
                      setState(() {
                        activeStep++;
                      });
                    } else if (activeStep + 1 == newMeetingSteps.length) {
                      Navigator.of(context).pop();
                    } else {
                      null;
                    }
                  },
                  onTapCancel: () {
                    if (activeStep == 0) {
                      Navigator.of(context).pop();
                    } else {
                      setState(() {
                        activeStep--;
                      });
                    }
                  },
                  continueText: activeStep == 0
                      ? "Metadata"
                      : activeStep == 1
                          ? "Attendance"
                          : activeStep == 2
                              ? "Agenda"
                              : activeStep == 3
                                  ? "Minutes"
                                  : "Upload Meeting",
                  cancelText: activeStep == 0 ? "Discard" : "Go Back",
                );
              },
              steps: newMeetingSteps,
            ),
          ),
        ],
      ),
    );
  }

  List<Step> get newMeetingSteps {
    return [
      Step(
        isActive: activeStep >= 0,
        state: activeStep == 0 ? StepState.editing : StepState.complete,
        title: activeStep == 0
            ? const Text(
                "Info",
                style: TextStyle(
                  fontFamily: "OpenSansCondensed",
                  fontSize: 12,
                ),
              )
            : const SizedBox(),
        content: const NewMeetingInfo(),
      ),
      Step(
        isActive: activeStep >= 1,
        state: activeStep == 1
            ? StepState.editing
            : activeStep < 1
                ? StepState.indexed
                : StepState.complete,
        title: activeStep == 1
            ? const Text(
                "About",
                style: TextStyle(
                  fontFamily: "OpenSansCondensed",
                  fontSize: 12,
                ),
              )
            : const SizedBox(),
        content: const NewMeetingAbout(),
      ),
      Step(
        isActive: activeStep >= 2,
        state: activeStep == 2
            ? StepState.editing
            : activeStep < 2
                ? StepState.indexed
                : StepState.complete,
        title: activeStep == 2
            ? const Text(
                "Members",
                style: TextStyle(
                  fontFamily: "OpenSansCondensed",
                  fontSize: 12,
                ),
              )
            : const SizedBox(),
        content: const NewMeetingAttendance(),
      ),
      Step(
        isActive: activeStep >= 3,
        state: activeStep == 3
            ? StepState.editing
            : activeStep < 3
                ? StepState.indexed
                : StepState.complete,
        title: activeStep == 3
            ? const Text(
                "Agenda",
                style: TextStyle(
                  fontFamily: "OpenSansCondensed",
                  fontSize: 12,
                ),
              )
            : const SizedBox(),
        content: const NewMeetingAgenda(),
      ),
      Step(
        isActive: activeStep >= 4,
        state: activeStep == 4
            ? StepState.editing
            : activeStep < 4
                ? StepState.indexed
                : StepState.complete,
        title: activeStep == 4
            ? const Text(
                "Minutes",
                style: TextStyle(
                  fontFamily: "OpenSansCondensed",
                  fontSize: 12,
                ),
              )
            : const SizedBox(),
        content: const NewMeetingMinutes(),
      ),
    ];
  }
}

class NewMeetingMinutes extends StatelessWidget {
  const NewMeetingMinutes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            CoolAlert.show(
              context: context,
              type: CoolAlertType.custom,
              barrierDismissible: false,
              showCancelBtn: true,
              cancelBtnText: "Discard",
              lottieAsset: "assets/json/add.json",
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              loopAnimation: true,
              cancelBtnTextStyle: const TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
              confirmBtnText: "Add",
              confirmBtnColor: AppDecorations().mainBlueColor,
              confirmBtnTextStyle: const TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              widget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Add New Minute",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold,
                      height: 2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                    child: DropdownSearch(
                      items: sampleAgendas + ["Closing Remarks"],
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        baseStyle: const TextStyle(
                          height: 1,
                          fontSize: 13,
                        ),
                        dropdownSearchDecoration:
                            AppDecorations().inputDecoration1(
                          fieldLabel: "Agenda on Focus",
                          fieldHelper:
                              "Select the appropriate agenda to discuss about",
                          fieldIcon: CupertinoIcons.alt,
                        ),
                      ),
                      popupProps: const PopupProps.modalBottomSheet(),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: IconTextField(
                      fieldLabel: "Minute Details",
                      fieldHelper:
                          "Provide all the details discussed in regards to this minute",
                      fieldIcon: CupertinoIcons.text_cursor,
                    ),
                  ),
                ],
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 15),
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppDecorations().mainBlueColor,
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  CupertinoIcons.add,
                  color: Colors.white,
                ),
                SizedBox(width: 10),
                Text(
                  "Add New Minute",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        ...sampleMeetingMinutes.map(
          (eachMinute) => Theme(
            data: ThemeData(
              dividerColor: Colors.transparent,
            ),
            child: ExpansionTile(
              tilePadding: EdgeInsets.zero,
              title: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Text(
                      "${sampleMeetingMinutes.indexOf(eachMinute) + 1}.",
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins",
                      ),
                    ),
                  ),
                  Text(
                    eachMinute["minuteTitle"].toUpperCase(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      fontFamily: "Poppins",
                    ),
                  ),
                ],
              ),
              children: [
                Text(
                  eachMinute["minuteBody"],
                  style: const TextStyle(
                    fontSize: 13,
                    height: 1.5,
                    letterSpacing: 0.3,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class NewMeetingAgenda extends StatelessWidget {
  const NewMeetingAgenda({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            CoolAlert.show(
              context: context,
              type: CoolAlertType.custom,
              barrierDismissible: false,
              showCancelBtn: true,
              cancelBtnText: "Discard",
              lottieAsset: "assets/json/add.json",
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              loopAnimation: true,
              cancelBtnTextStyle: const TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
              confirmBtnText: "Add",
              confirmBtnColor: AppDecorations().mainBlueColor,
              confirmBtnTextStyle: const TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              widget: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Add New Agenda",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold,
                      height: 2,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: IconTextField(
                      fieldLabel: "Agenda Title",
                      fieldHelper: "Enter a title for this minute agenda",
                      fieldIcon: CupertinoIcons.textformat,
                    ),
                  ),
                ],
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 15),
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppDecorations().mainBlueColor,
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  CupertinoIcons.add,
                  color: Colors.white,
                ),
                SizedBox(width: 10),
                Text(
                  "Add New Agenda",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Text(
            "Meeting Agenda",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ),
        Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          columnWidths: const {
            0: IntrinsicColumnWidth(),
            2: IntrinsicColumnWidth(),
            3: IntrinsicColumnWidth(),
          },
          children: List.generate(
            sampleAgendas.length,
            (index) {
              return TableRow(
                children: [
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Text(
                        "${index + 1}.",
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Text(
                      sampleAgendas[index],
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  TableCell(
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(CupertinoIcons.delete),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

class NewMeetingAttendance extends StatefulWidget {
  const NewMeetingAttendance({
    super.key,
  });

  @override
  State<NewMeetingAttendance> createState() => _NewMeetingAttendanceState();
}

class _NewMeetingAttendanceState extends State<NewMeetingAttendance> {
  List<String> memberPositions = [
    "Group Patron",
    "Chairperson",
    "Vice Chairperson",
    "Secretary",
    "Vice Secretary",
    "Treasurer",
    "Vice Treasurer",
    "Organiser",
    "Church School Rep",
    "Council Member",
    "Other",
  ];
  List<String> meetingAttendance = [
    "Present",
    "Absent With Apology",
    "Absent Without Apology",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            CoolAlert.show(
              context: context,
              type: CoolAlertType.custom,
              barrierDismissible: false,
              showCancelBtn: true,
              cancelBtnText: "Discard",
              lottieAsset: "assets/json/add_person.json",
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              loopAnimation: true,
              cancelBtnTextStyle: const TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
              confirmBtnText: "Add",
              confirmBtnColor: AppDecorations().mainBlueColor,
              confirmBtnTextStyle: const TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              widget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Add New Attendance",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold,
                      height: 2,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: IconTextField(
                      fieldLabel: "Member Names",
                      fieldHelper: "Enter the full names of the member",
                      fieldIcon: CupertinoIcons.person_alt,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                    child: DropdownSearch(
                      items: memberPositions,
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        baseStyle: const TextStyle(
                          height: 1,
                          fontSize: 13,
                        ),
                        dropdownSearchDecoration:
                            AppDecorations().inputDecoration1(
                          fieldLabel: "Member Position",
                          fieldHelper:
                              "Select the appropriate position for this member",
                          fieldIcon: CupertinoIcons.alt,
                        ),
                      ),
                      popupProps: const PopupProps.modalBottomSheet(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                    child: DropdownSearch(
                      items: meetingAttendance,
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        baseStyle: const TextStyle(
                          height: 1,
                          fontSize: 13,
                        ),
                        dropdownSearchDecoration:
                            AppDecorations().inputDecoration1(
                          fieldLabel: "Meeting Presence",
                          fieldHelper:
                              "Select whether this member is present for the meeting or not",
                          fieldIcon: CupertinoIcons.eye,
                        ),
                      ),
                      popupProps: const PopupProps.modalBottomSheet(),
                    ),
                  ),
                ],
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 15),
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppDecorations().mainBlueColor,
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  CupertinoIcons.add,
                  color: Colors.white,
                ),
                SizedBox(width: 10),
                Text(
                  "Add New Attendance",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Text(
            "Members Present",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ),
        Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          columnWidths: const {
            0: IntrinsicColumnWidth(),
            1: FlexColumnWidth(),
            2: FlexColumnWidth(),
            3: IntrinsicColumnWidth(),
          },
          children: List.generate(
            meetingAttendanceList
                .where((element) => element["attendance"] == "Present")
                .length,
            (index) {
              Iterable<Map<String, String>> newList = meetingAttendanceList
                  .where((element) => element["attendance"] == "Present");
              return TableRow(
                children: [
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Text(
                        "${index + 1}.",
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Text(
                      newList
                          .toList()
                          .elementAt(index)["full_names"]
                          .toString(),
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  TableCell(
                    child: Text(
                      newList.toList().elementAt(index)["position"].toString(),
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  TableCell(
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(CupertinoIcons.delete),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Text(
            "Absent With Apology",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ),
        Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          columnWidths: const {
            0: IntrinsicColumnWidth(),
            1: FlexColumnWidth(),
            2: FlexColumnWidth(),
            3: IntrinsicColumnWidth(),
          },
          children: List.generate(
            meetingAttendanceList
                .where(
                    (element) => element["attendance"] == "Absent With Apology")
                .length,
            (index) {
              Iterable<Map<String, String>> newList =
                  meetingAttendanceList.where((element) =>
                      element["attendance"] == "Absent With Apology");
              return TableRow(
                children: [
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Text(
                        "${index + 1}.",
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Text(
                      newList
                          .toList()
                          .elementAt(index)["full_names"]
                          .toString(),
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  TableCell(
                    child: Text(
                      newList.toList().elementAt(index)["position"].toString(),
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  TableCell(
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(CupertinoIcons.delete),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Text(
            "Absent Without Apology",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ),
        Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          columnWidths: const {
            0: IntrinsicColumnWidth(),
            1: FlexColumnWidth(),
            2: FlexColumnWidth(),
            3: IntrinsicColumnWidth(),
          },
          children: List.generate(
            meetingAttendanceList
                .where((element) =>
                    element["attendance"] == "Absent Without Apology")
                .length,
            (index) {
              Iterable<Map<String, String>> newList =
                  meetingAttendanceList.where((element) =>
                      element["attendance"] == "Absent Without Apology");
              return TableRow(
                children: [
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Text(
                        "${index + 1}.",
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Text(
                      newList
                          .toList()
                          .elementAt(index)["full_names"]
                          .toString(),
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  TableCell(
                    child: Text(
                      newList.toList().elementAt(index)["position"].toString(),
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  TableCell(
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(CupertinoIcons.delete),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

class NewMeetingAbout extends StatelessWidget {
  const NewMeetingAbout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
          child: IconTextField(
            fieldLabel: "Meeting Title",
            fieldHelper: "Enter a title for the meeting",
            fieldIcon: CupertinoIcons.textformat,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
          child: IconTextField(
            fieldLabel: "Meeting Venue",
            fieldHelper: "Enter a venue where the meeting was held",
            fieldIcon: CupertinoIcons.building_2_fill,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
          child: IconTextField(
            fieldLabel: "Meeting Date",
            fieldHelper: "Set the date when the meeting happened",
            fieldIcon: CupertinoIcons.calendar,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
          child: IconTextField(
            fieldLabel: "Meeting Time",
            fieldHelper: "Set the time when the meeting happened",
            fieldIcon: CupertinoIcons.clock,
          ),
        ),
      ],
    );
  }
}

class NewMeetingInfo extends StatelessWidget {
  const NewMeetingInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [],
    );
  }
}
