import 'package:churchgroupsmanagement/screens/reports/create_new_activity_report.dart';
import 'package:churchgroupsmanagement/widgets/main_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllActivityReports extends StatefulWidget {
  const AllActivityReports({super.key});

  @override
  State<AllActivityReports> createState() => _AllActivityReportsState();
}

class _AllActivityReportsState extends State<AllActivityReports> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainPageAppBar(
            pageTitle: "Group Activity Reports",
            pageSubtitle: "Woman's Guild",
            onTapAdd: () {
              Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
                return const CreateNewActivityReport();
              }));
            },
            onTapSearch: () {
              Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
                return const CreateNewActivityReport();
              }));
            },
          ),
        ],
      ),
    );
  }
}
