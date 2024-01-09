import 'package:churchgroupsmanagement/data/sample_budget.dart';
import 'package:churchgroupsmanagement/services/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SingleCalendarofEvents extends StatefulWidget {
  const SingleCalendarofEvents({super.key});

  @override
  State<SingleCalendarofEvents> createState() => _SingleCalendarofEventsState();
}

class _SingleCalendarofEventsState extends State<SingleCalendarofEvents> {
  final List<String> monthsList = [
    'October 2023',
    'November 2023',
    'December 2023',
    'January 2024',
    'February 2024',
    'March 2024',
    'April 2024',
    'May 2024',
    'June 2024',
    'July 2024',
    'August 2024',
    'September 2024',
  ];

  int scrollingTabView = 0;
  PanelController panelController = PanelController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                    width: 1,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Image.asset(
                    "assets/icons/back.png",
                    color: Colors.blue,
                    width: 15,
                    height: 15,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 15),
            SizedBox(
              width: ScreenDimension().screenWidth(context) * 0.60,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.zero,
                    child: Text(
                      "Financial Year 2023 - 2024",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.7,
                        height: 1.5,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Text(
                    "Woman's Guild (Parish Office)",
                    style: TextStyle(
                      letterSpacing: 0.7,
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: SlidingUpPanel(
        controller: panelController,
        color: Theme.of(context).scaffoldBackgroundColor,
        minHeight: ScreenDimension().screenHeight(context) * 0.1,
        maxHeight: ScreenDimension().screenHeight(context),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
        body: MasonryGridView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.only(
            left: 15,
            right: 15,
            bottom: MediaQuery.of(context).padding.bottom +
                ScreenDimension().screenHeight(context) * 0.2 +
                30,
          ),
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: monthsList.length,
          itemBuilder: (context, monthsIndex) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  scrollingTabView = monthsIndex;
                });
                panelController.open();
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(
                  monthsIndex.isOdd ? 5 : 0,
                  10,
                  monthsIndex.isOdd ? 0 : 5,
                  10,
                ),
                decoration: const BoxDecoration(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: AppDecorations().mainBlueColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          monthsList[monthsIndex],
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            fontFamily: "Poppins",
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppDecorations().mainBlueColor,
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                        ),
                      ),
                      child: sampleCalendarBudget
                              .where((activity) =>
                                  activity["month"] == monthsList[monthsIndex])
                              .isEmpty
                          ? Center(
                              child: Column(
                                children: [
                                  Image.asset(
                                    "assets/images/emptylist.png",
                                    width: 60,
                                    height: 60,
                                    color: AppDecorations()
                                        .mainBlueColor
                                        .withOpacity(0.3),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.fromLTRB(5, 5, 5, 6),
                                    child: Text(
                                      "No activities added to this month",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              padding: const EdgeInsets.fromLTRB(5, 5, 5, 10),
                              shrinkWrap: true,
                              itemCount: sampleCalendarBudget
                                  .where((activity) =>
                                      activity["month"] ==
                                      monthsList[monthsIndex])
                                  .length,
                              itemBuilder: (BuildContext context, int index) {
                                return Text(
                                  "${index + 1}. ${sampleCalendarBudget.where((activity) => activity["month"] == monthsList[monthsIndex]).toList()[index]["title"]}",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    height: 2,
                                    fontWeight: FontWeight.w400,
                                  ),
                                );
                              },
                            ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
        panelBuilder: (scrollConroller) {
          return PreviewPanel(
            scrollController: scrollConroller,
            monthTabs: monthsList,
            monthIndex: scrollingTabView,
            panelController: panelController,
          );
        },
        //header: ,
      ),
    );
  }
}

class PreviewPanel extends StatefulWidget {
  const PreviewPanel({
    super.key,
    required this.scrollController,
    required this.monthTabs,
    required this.monthIndex,
    required this.panelController,
  });

  final ScrollController scrollController;
  final List<String> monthTabs;
  final int monthIndex;
  final PanelController panelController;

  @override
  State<PreviewPanel> createState() => _PreviewPanelState();
}

class _PreviewPanelState extends State<PreviewPanel>
    with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(
      length: widget.monthTabs.length,
      vsync: this,
      initialIndex: widget.monthIndex,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.panelController.close();
        },
        backgroundColor: AppDecorations().mainBlueColor,
        foregroundColor: Colors.white,
        child: Text(
          "Calendar View",
          style: TextStyle(),
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        bottom: TabBar(
          isScrollable: true,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
            color: AppDecorations().mainBlueColor,
            borderRadius: BorderRadius.circular(5),
          ),
          labelColor: Color.fromARGB(255, 255, 255, 255),
          unselectedLabelColor: Color.fromARGB(255, 144, 143, 143),
          controller: tabController,
          tabs: List.generate(
            widget.monthTabs.length,
            (index) => Tab(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.monthTabs[index]
                        .split(" ")[0]
                        .substring(0, 3)
                        .toUpperCase(),
                    style: const TextStyle(
                      fontSize: 13,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    widget.monthTabs[index].split(" ")[1],
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: List.generate(
          widget.monthTabs.length,
          (index) {
            return sampleCalendarBudget
                    .where((activity) =>
                        activity["month"] == widget.monthTabs[index])
                    .toList()
                    .isEmpty
                ? Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/emptylist.png",
                          width: ScreenDimension().screenWidth(context) * 0.5,
                          color:
                              AppDecorations().mainBlueColor.withOpacity(0.2),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(5, 20, 5, 6),
                          child: Text(
                            "No activities added to this month",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : ActivitiesPerMonthList(
                    eventsPerMonthList: sampleCalendarBudget
                        .where((activity) =>
                            activity["month"] == widget.monthTabs[index])
                        .toList(),
                  );
          },
        ),
      ),
    );
  }
}

class ActivitiesPerMonthList extends StatefulWidget {
  const ActivitiesPerMonthList({super.key, required this.eventsPerMonthList});

  final List<Map<String, dynamic>> eventsPerMonthList;

  @override
  State<ActivitiesPerMonthList> createState() => _ActivitiesPerMonthListState();
}

class _ActivitiesPerMonthListState extends State<ActivitiesPerMonthList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.eventsPerMonthList.length,
      itemBuilder: (context, index) {
        return IndividualActivityDetails(
          singleEvent: widget.eventsPerMonthList[index],
        );
      },
    );
  }
}

class IndividualActivityDetails extends StatelessWidget {
  const IndividualActivityDetails({super.key, required this.singleEvent});

  final Map<String, dynamic> singleEvent;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.fromLTRB(15, 10, 15, 15),
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 15),
        child: SizedBox(
          width: ScreenDimension().screenWidth(context) - 50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: ScreenDimension().screenWidth(context) * 0.7,
                      child: Text(
                        singleEvent["title"],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        CupertinoIcons.question_circle,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  IntrinsicHeight(
                    child: VerticalDivider(
                      thickness: 10,
                      color: AppDecorations().mainBlueColor,
                    ),
                  ),
                  SizedBox(width: 10),
                  SizedBox(
                    width: ScreenDimension().screenWidth(context) - 65,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "Objectives",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: singleEvent["objectives"].toList().length,
                          itemBuilder: (BuildContext context, int index) {
                            return Text(
                              "${index + 1}. ${singleEvent["objectives"][index]}",
                              style: const TextStyle(
                                fontSize: 12,
                                height: 2,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              const Text(
                "Requirements",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
              SizedBox(
                height: 30,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: singleEvent["requirements"].toList().length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.fromLTRB(
                          index != 0 ? 5 : 0, 2, index != 3 ? 0 : 0, 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppDecorations().mainBlueColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: Text(
                          "${index + 1}. ${singleEvent["requirements"][index]}",
                          style: const TextStyle(
                            fontSize: 12,
                            //height: 2,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SingleEventItem extends StatelessWidget {
  const SingleEventItem({
    super.key,
    required this.eventTitle,
    required this.eventMonth,
    this.initiallyExpanded = false,
  });

  final String eventTitle;
  final String eventMonth;
  final bool initiallyExpanded;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(dividerColor: Colors.transparent),
      child: ExpansionTile(
        initiallyExpanded: initiallyExpanded,
        tilePadding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        childrenPadding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        leading: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  // boxShadow: [
                  //   BoxShadow(
                  //     offset: Offset(3, 5),
                  //     blurRadius: 10,
                  //     color: Color.fromARGB(100, 190, 187, 187),
                  //   ),
                  // ],
                  ),
              child: Image.asset(
                "assets/images/calendar.png",
              ),
            ),
            Positioned(
              top: 25,
              left: 12,
              child: Text(
                eventMonth.toUpperCase(),
                style: const TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w900,
                  fontSize: 13,
                  letterSpacing: .5,
                ),
              ),
            ),
          ],
        ),
        title: Text(
          eventTitle,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            fontFamily: "Poppins",
            letterSpacing: .5,
          ),
        ),
        subtitle: const Text(
          "Tap to view details of the activity",
          style: TextStyle(
            fontSize: 12,
            letterSpacing: 0.3,
          ),
        ),
        children: [
          const Text(
            "Objectives",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
          const Text(
            "1. To allow smooth transition to the incoming leaders",
            style: TextStyle(
              fontSize: 12,
              height: 2,
            ),
          ),
          const Text(
            "2. Allow the Chaplain and the Guild Members to familiarize",
            style: TextStyle(
              fontSize: 12,
              height: 2,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Requirements",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
          const Text(
            "1. Snacks",
            style: TextStyle(
              fontSize: 12,
              height: 2,
            ),
          ),
          const Text(
            "2. Communication",
            style: TextStyle(
              fontSize: 12,
              height: 2,
            ),
          ),
          const Text(
            "2. Transport",
            style: TextStyle(
              fontSize: 12,
              height: 2,
            ),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(CupertinoIcons.cloud_upload),
                label: const Text(
                  "Update",
                ),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(CupertinoIcons.doc_on_doc),
                label: const Text(
                  "Duplicate",
                ),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.delete,
                  color: Colors.red,
                ),
                label: const Text(
                  "Delete",
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
