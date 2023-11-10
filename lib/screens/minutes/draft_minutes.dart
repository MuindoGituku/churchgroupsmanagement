import 'package:churchgroupsmanagement/widgets/meeting_list_item.dart';
import 'package:flutter/material.dart';

class DraftMinutesList extends StatefulWidget {
  const DraftMinutesList({super.key});

  @override
  State<DraftMinutesList> createState() => _DraftMinutesListState();
}

class _DraftMinutesListState extends State<DraftMinutesList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 20),
        children: const [
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
    );
  }
}
