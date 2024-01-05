import 'package:churchgroupsmanagement/screens/calendars/calendar_events_single.dart';
import 'package:churchgroupsmanagement/screens/calendars/create_new_calendar.dart';
import 'package:churchgroupsmanagement/services/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllCalendarEvents extends StatefulWidget {
  const AllCalendarEvents({super.key});

  @override
  State<AllCalendarEvents> createState() => _AllCalendarEventsState();
}

class _AllCalendarEventsState extends State<AllCalendarEvents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
            return const CreateNewCalendar();
          }));
        },
        backgroundColor: AppDecorations().mainBlueColor,
        label: const Text(
          "New Calendar",
          style: TextStyle(
            fontFamily: "Poppins",
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        icon: const Icon(
          CupertinoIcons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        centerTitle: false,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.zero,
              child: Text(
                "Calendars of Events",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.7,
                  height: 1.5,
                  fontSize: 15,
                ),
              ),
            ),
            Text(
              "Woman's Guild (Parish Office)",
              style: TextStyle(
                letterSpacing: 0.7,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(CupertinoIcons.search),
            ),
          ),
        ],
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(15, 20, 15, 25),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: SingleCalendarListItem(
                calendarStatus: "Proposed",
                calendarYear: "2023 - 2024",
                lastUpdateDate: "Sun 20/11/2023 at 4:37 PM",
                activitiesNumber: "18",
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
              child: SingleCalendarListItem(
                calendarStatus: "Current",
                calendarYear: "2022 - 2023",
                lastUpdateDate: "Tue 20/09/2022 at 7:10 PM",
                activitiesNumber: "25",
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
              child: SingleCalendarListItem(
                calendarStatus: "Closed",
                calendarYear: "2021 - 2022",
                lastUpdateDate: "Tue 20/09/2022 at 7:10 PM",
                activitiesNumber: "25",
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
              child: SingleCalendarListItem(
                calendarStatus: "Closed",
                calendarYear: "2020 - 2021",
                lastUpdateDate: "Tue 20/09/2022 at 7:10 PM",
                activitiesNumber: "25",
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
              child: SingleCalendarListItem(
                calendarStatus: "Closed",
                calendarYear: "2019 - 2020",
                lastUpdateDate: "Tue 20/09/2022 at 7:10 PM",
                activitiesNumber: "25",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SingleCalendarListItem extends StatelessWidget {
  const SingleCalendarListItem({
    super.key,
    required this.calendarYear,
    required this.activitiesNumber,
    required this.lastUpdateDate,
    required this.calendarStatus,
  });

  final String calendarYear;
  final String activitiesNumber;
  final String lastUpdateDate;
  final String calendarStatus;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
          return const SingleCalendarofEvents();
        }));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/calendars.png",
                width: 32,
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: ScreenDimension().screenWidth(context) * .65,
                    child: Text(
                      "Year $calendarYear".toUpperCase(),
                      style: const TextStyle(
                        fontFamily: "OpenSansSemiCondensed",
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5,
                        height: 1.7,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: ScreenDimension().screenWidth(context) * .65,
                    child: Text(
                      "$activitiesNumber event(s) added to calendar",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.3,
                        height: 1,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: ScreenDimension().screenWidth(context) * .65,
                    child: Text(
                      "Last updated on $lastUpdateDate",
                      style: const TextStyle(
                        fontSize: 10,
                        color: Color.fromARGB(255, 83, 82, 82),
                        letterSpacing: 0.3,
                        height: 1,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: calendarStatus == "Proposed"
                  ? Colors.amber
                  : calendarStatus == "Current"
                      ? Colors.green
                      : Colors.red,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(6, 4, 6, 4),
              child: Text(
                calendarStatus,
                style: const TextStyle(
                  fontSize: 9,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
