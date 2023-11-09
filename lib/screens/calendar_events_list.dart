import 'package:churchgroupsmanagement/forms/create_new_calendar.dart';
import 'package:churchgroupsmanagement/screens/root_navigation.dart';
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainPageAppBar(
            pageTitle: "Calendars of Events",
            pageSubtitle: "Woman's Guild",
            onTapTrailing: () {
              Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
                return CreateNewCalendar();
              }));
            },
          ),
        ],
      ),
    );
  }
}
