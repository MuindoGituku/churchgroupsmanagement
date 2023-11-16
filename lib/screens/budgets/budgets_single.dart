import 'package:churchgroupsmanagement/screens/budgets/budget_info.dart';
import 'package:churchgroupsmanagement/screens/budgets/edit_group_budget.dart';
import 'package:churchgroupsmanagement/widgets/details_screen_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleGroupBudget extends StatefulWidget {
  const SingleGroupBudget({super.key});

  @override
  State<SingleGroupBudget> createState() => _SingleGroupBudgetState();
}

class _SingleGroupBudgetState extends State<SingleGroupBudget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DetailsScreenAppBar(
            pageHeading: "Year 2023 - 2024",
            pageSubHeading: "tap to view info about the budget",
            onTapEditor: () {
              Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
                return const EditGroupBudget();
              }));
            },
            onTapMoreDetails: () {
              Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
                return const GroupBudgetInfo();
              }));
            },
          ),
          const Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                    child: SingleEventItem(
                      eventMonth: "NOV",
                      eventTitle: "Handing Over",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: SingleEventItem(
                      eventMonth: "DEC",
                      eventTitle: "Visiting The Chaplain",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: SingleEventItem(
                      eventMonth: "JAN",
                      eventTitle: "World Day of Prayer",
                      initiallyExpanded: true,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: SingleEventItem(
                      eventMonth: "FEB",
                      eventTitle: "Acts of Mercy",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: SingleEventItem(
                      eventMonth: "Mar",
                      eventTitle: "Joint Fellowship",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: SingleEventItem(
                      eventMonth: "Apr",
                      eventTitle: "Full Council Meeting",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: SingleEventItem(
                      eventMonth: "May",
                      eventTitle: "All Ladies Seminar",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: SingleEventItem(
                      eventMonth: "Jun",
                      eventTitle: "Economic Empowerment",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: SingleEventItem(
                      eventMonth: "Jul",
                      eventTitle: "Executive Meeting",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: SingleEventItem(
                      eventMonth: "Aug",
                      eventTitle: "Retreat",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: SingleEventItem(
                      eventMonth: "Sep",
                      eventTitle: "Token to Outgoing Officials",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: SingleEventItem(
                      eventMonth: "Oct",
                      eventTitle: "AGM",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: SingleEventItem(
                      eventMonth: "Nov",
                      eventTitle: "Handing Over",
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
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
                boxShadow: [
                  BoxShadow(
                    offset: Offset(3, 5),
                    blurRadius: 10,
                    color: Color.fromARGB(100, 190, 187, 187),
                  ),
                ],
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
            "Source of Funds",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
          const Text(
            "1. LCC Budget - KShs. 57,000",
            style: TextStyle(
              fontSize: 12,
              height: 2,
            ),
          ),
          const Text(
            "2. Group Kitty - KShs. 40,000",
            style: TextStyle(
              fontSize: 12,
              height: 2,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Total Budget",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
          const Text(
            "KShs. 97,000",
            style: TextStyle(
              fontSize: 16,
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
