import 'package:churchgroupsmanagement/forms/create_new_meeting.dart';
import 'package:churchgroupsmanagement/screens/root_navigation.dart';
import 'package:churchgroupsmanagement/services/constants.dart';
import 'package:churchgroupsmanagement/widgets/main_app_bar.dart';
import 'package:churchgroupsmanagement/widgets/meeting_list_item.dart';
import 'package:churchgroupsmanagement/widgets/search_text_filter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AllGroupMinutes extends StatefulWidget {
  const AllGroupMinutes({super.key});

  @override
  State<AllGroupMinutes> createState() => _AllGroupMinutesState();
}

class _AllGroupMinutesState extends State<AllGroupMinutes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainPageAppBar(
            pageTitle: "Meeting Minutes",
            pageSubtitle: "Woman's Guild",
            onTapTrailing: () {
              Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
                return CreateNewMeeting();
              }));
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 10, 20, 10),
                    child: SearchTextFilter(
                      searchLabel: "Search for minutes...",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 10, 20, 5),
                    child: Text(
                      "3rd Quarter (Apr - Jun 2023)",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 15,
                        letterSpacing: 0.5,
                        height: 1.5,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  ListView(
                    shrinkWrap: true,
                    padding: const EdgeInsets.fromLTRB(15, 10, 15, 20),
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      SingleMeetingListItem(
                        meetingTitle: "Audit Committee Meeting",
                        meetingDate: "Meeting held on 3rd Oct 2023 from 4 PM",
                        meetingStatus: false,
                        lastUpdated: "Last updated on 20/06/2023",
                      ),
                      SingleMeetingListItem(
                        meetingTitle: "Full Council Meeting",
                        meetingDate: "Meeting held on 3rd Oct 2023 from 4 PM",
                        meetingStatus: true,
                        lastUpdated: "Last updated on 20/06/2023",
                      ),
                      SingleMeetingListItem(
                        meetingTitle: "Handing Over Meeting",
                        meetingDate: "Meeting held on 3rd Oct 2023 from 4 PM",
                        meetingStatus: false,
                        lastUpdated: "Last updated on 20/06/2023",
                      ),
                      SingleMeetingListItem(
                        meetingTitle: "Executive Committee Meeting",
                        meetingDate: "Meeting held on 3rd Oct 2023 from 4 PM",
                        meetingStatus: true,
                        lastUpdated: "Last updated on 20/06/2023",
                      ),
                      SingleMeetingListItem(
                        meetingTitle: "Executive Committee Meeting",
                        meetingDate: "Meeting held on 3rd Oct 2023 from 4 PM",
                        meetingStatus: true,
                        lastUpdated: "Last updated on 20/06/2023",
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 10, 20, 25),
                    child: Text(
                      "2nd Quarter (Jan - Mar 2023)",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 15,
                        letterSpacing: 0.5,
                        height: 1.5,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  ListView(
                    shrinkWrap: true,
                    padding: const EdgeInsets.fromLTRB(15, 10, 15, 20),
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      SingleMeetingListItem(
                        meetingTitle: "Audit Committee Meeting",
                        meetingDate: "Meeting held on 3rd Oct 2023 from 4 PM",
                        meetingStatus: false,
                        lastUpdated: "Last updated on 20/06/2023",
                      ),
                      SingleMeetingListItem(
                        meetingTitle: "Full Council Meeting",
                        meetingDate: "Meeting held on 3rd Oct 2023 from 4 PM",
                        meetingStatus: true,
                        lastUpdated: "Last updated on 20/06/2023",
                      ),
                      SingleMeetingListItem(
                        meetingTitle: "Handing Over Meeting",
                        meetingDate: "Meeting held on 3rd Oct 2023 from 4 PM",
                        meetingStatus: false,
                        lastUpdated: "Last updated on 20/06/2023",
                      ),
                      SingleMeetingListItem(
                        meetingTitle: "Executive Committee Meeting",
                        meetingDate: "Meeting held on 3rd Oct 2023 from 4 PM",
                        meetingStatus: true,
                        lastUpdated: "Last updated on 20/06/2023",
                      ),
                      SingleMeetingListItem(
                        meetingTitle: "Executive Committee Meeting",
                        meetingDate: "Meeting held on 3rd Oct 2023 from 4 PM",
                        meetingStatus: true,
                        lastUpdated: "Last updated on 20/06/2023",
                      ),
                    ],
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
