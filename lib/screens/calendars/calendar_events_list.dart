import 'package:churchgroupsmanagement/screens/calendars/create_new_calendar.dart';
import 'package:churchgroupsmanagement/services/constants.dart';
import 'package:churchgroupsmanagement/widgets/main_app_bar.dart';
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainPageAppBar(
            pageTitle: "Calendars of Events",
            pageSubtitle: "Woman's Guild",
            onTapAdd: () {
              Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
                return const CreateNewCalendar();
              }));
            },
            onTapSearch: () {
              Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
                return const CreateNewCalendar();
              }));
            },
          ),
        ],
      ),
    );
  }
}
