import 'package:churchgroupsmanagement/screens/minutes/create_new_meeting.dart';
import 'package:churchgroupsmanagement/screens/minutes/approved_minutes.dart';
import 'package:churchgroupsmanagement/screens/minutes/draft_minutes.dart';
import 'package:churchgroupsmanagement/screens/minutes/prepared_minutes.dart';
import 'package:churchgroupsmanagement/services/constants.dart';
import 'package:churchgroupsmanagement/widgets/main_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllGroupMinutes extends StatefulWidget {
  const AllGroupMinutes({super.key});

  @override
  State<AllGroupMinutes> createState() => _AllGroupMinutesState();
}

class _AllGroupMinutesState extends State<AllGroupMinutes>
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
            return const CreateNewMeeting();
          }));
        },
        backgroundColor: AppDecorations().mainBlueColor,
        label: const Text(
          "New Meeting",
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
            pageTitle: "Meeting Minutes",
            pageSubtitle: "Woman's Guild",
            onTapAdd: () {
              Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
                return const CreateNewMeeting();
              }));
            },
            onTapSearch: () {
              Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
                return const CreateNewMeeting();
              }));
            },
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
                  text: "Confirmed",
                ),
                Tab(
                  text: "Prepared",
                ),
                Tab(
                  text: "Drafts",
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
                ApprovedMinutesList(),
                PreparedMinutesList(),
                DraftMinutesList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
