import 'package:churchgroupsmanagement/data/sample_minutes.dart';
import 'package:churchgroupsmanagement/screens/minutes/edit_selected_meeting.dart';
import 'package:churchgroupsmanagement/screens/minutes/meeting_info.dart';
import 'package:churchgroupsmanagement/services/constants.dart';
import 'package:churchgroupsmanagement/widgets/details_screen_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SingleGroupMinute extends StatefulWidget {
  const SingleGroupMinute({super.key});

  @override
  State<SingleGroupMinute> createState() => _SingleGroupMinuteState();
}

class _SingleGroupMinuteState extends State<SingleGroupMinute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DetailsScreenAppBar(
            pageHeading: "Audit Committee Meeting",
            pageSubHeading: "tap to view info about the meeting",
            onTapEditor: () {
              Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
                return const EditSelectedMeeting();
              }));
            },
            onTapMoreDetails: () {
              Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
                return const SingleMeetingInfo();
              }));
            },
          ),
          const Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  MeetingOverview(),
                  MeetingMinutesList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MeetingOverview extends StatelessWidget {
  const MeetingOverview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
          return const SingleMeetingInfo();
        }));
      },
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(12, 0, 12, 15),
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(70, 204, 204, 204),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/icons/location.png",
                      color: Colors.black54,
                      width: 18,
                      height: 18,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Kahawa Farmers Church Boardroom",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Image.asset(
                      "assets/icons/calendar.png",
                      color: Colors.black54,
                      width: 16,
                      height: 16,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Sun, 4th Nov 2023 From 4pm",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Image.asset(
                      "assets/icons/people.png",
                      color: Colors.black54,
                      width: 18,
                      height: 18,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "12 Present, 5 Absent",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(CupertinoPageRoute(builder: (context) {
                  return const SingleMeetingInfo();
                }));
              },
              child: const Icon(
                CupertinoIcons.question_circle_fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MeetingMinutesList extends StatelessWidget {
  const MeetingMinutesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
      itemBuilder: (context, index) => SingleMinuteContainer(index: index),
      itemCount: sampleMeetingMinutes.length,
    );
  }
}

class SingleMinuteContainer extends StatelessWidget {
  const SingleMinuteContainer({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "MIN ${sampleMeetingMinutes[index]["minuteNumber"]}/23/11/2023",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: "Poppins",
                  color: Colors.blue,
                  fontSize: 10,
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: ScreenDimension().screenWidth(context) * 0.60,
                child: Text(
                  sampleMeetingMinutes[index]["minuteTitle"].toUpperCase(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.5,
                    letterSpacing: 0.3,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: ScreenDimension().screenWidth(context),
            child: Text(
              "Last updated on ${DateFormat.yMMMMEEEEd().format(
                DateTime.parse(
                  sampleMeetingMinutes[index]["dateModified"],
                ),
              )}",
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w300,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            width: ScreenDimension().screenWidth(context),
            child: Text(
              sampleMeetingMinutes[index]["minuteBody"],
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 12,
                letterSpacing: 0.3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
