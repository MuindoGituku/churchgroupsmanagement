import 'package:churchgroupsmanagement/screens/minutes/meeting_about.dart';
import 'package:churchgroupsmanagement/screens/minutes/meeting_agenda_list.dart';
import 'package:churchgroupsmanagement/screens/minutes/meeting_attendance.dart';
import 'package:churchgroupsmanagement/services/constants.dart';
import 'package:churchgroupsmanagement/widgets/document_form_appbar.dart';
import 'package:flutter/material.dart';

class SingleMeetingInfo extends StatefulWidget {
  const SingleMeetingInfo({super.key});

  @override
  State<SingleMeetingInfo> createState() => _SingleMeetingInfoState();
}

class _SingleMeetingInfoState extends State<SingleMeetingInfo>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DocumentFormAppBar(
            formHeading: "Audit Committee Meeting",
            formSubHeading: "Last updated on Sun, 21st Nov 2023 at 4pm",
            showSecondaryButton: false,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
            child: TabBar(
              controller: tabController,
              isScrollable: true,
              padding: EdgeInsets.zero,
              indicatorPadding: EdgeInsets.zero,
              indicatorSize: TabBarIndicatorSize.tab,
              tabAlignment: TabAlignment.start,
              dividerColor: Colors.transparent,
              tabs: const [
                Tab(
                  text: "About",
                ),
                Tab(
                  text: "Attendance",
                ),
                Tab(
                  text: "Agenda",
                ),
              ],
              unselectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                letterSpacing: 0.5,
                color: Colors.grey,
              ),
              labelStyle: TextStyle(
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
                fontSize: 14,
                color: AppDecorations().mainBlueColor,
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: const [
                MeetingAboutInfo(),
                MeetingAttendanceInfo(),
                MeetingAgendaList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
