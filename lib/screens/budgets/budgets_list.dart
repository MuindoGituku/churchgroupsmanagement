import 'package:churchgroupsmanagement/screens/budgets/budgets_single.dart';
import 'package:churchgroupsmanagement/screens/budgets/create_new_budget.dart';
import 'package:churchgroupsmanagement/services/constants.dart';
import 'package:churchgroupsmanagement/widgets/main_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllGroupBudgets extends StatefulWidget {
  const AllGroupBudgets({super.key});

  @override
  State<AllGroupBudgets> createState() => _AllGroupBudgetsState();
}

class _AllGroupBudgetsState extends State<AllGroupBudgets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainPageAppBar(
            pageTitle: "Group Budgets",
            pageSubtitle: "Woman's Guild",
            onTapAdd: () {
              Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
                return const CreateNewBudget();
              }));
            },
            onTapSearch: () {
              Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
                return const CreateNewBudget();
              }));
            },
          ),
          const Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(15, 20, 15, 25),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: SingleBudgetListItem(
                      budgetStatus: "Proposed",
                      budgetYear: "2023 - 2024",
                      lastUpdateDate: "Sun 20/11/2023 at 4:37 PM",
                      budgetTotal: "378,500",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                    child: SingleBudgetListItem(
                      budgetStatus: "Current",
                      budgetYear: "2022 - 2023",
                      lastUpdateDate: "Tue 20/09/2022 at 7:10 PM",
                      budgetTotal: "240,760",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                    child: SingleBudgetListItem(
                      budgetStatus: "Closed",
                      budgetYear: "2021 - 2022",
                      lastUpdateDate: "Tue 20/09/2022 at 7:10 PM",
                      budgetTotal: "200,540",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                    child: SingleBudgetListItem(
                      budgetStatus: "Closed",
                      budgetYear: "2020 - 2021",
                      lastUpdateDate: "Tue 20/09/2022 at 7:10 PM",
                      budgetTotal: "150,290",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                    child: SingleBudgetListItem(
                      budgetStatus: "Closed",
                      budgetYear: "2019 - 2020",
                      lastUpdateDate: "Tue 20/09/2022 at 7:10 PM",
                      budgetTotal: "200,180",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SingleBudgetListItem extends StatelessWidget {
  const SingleBudgetListItem({
    super.key,
    required this.budgetYear,
    required this.budgetTotal,
    required this.lastUpdateDate,
    required this.budgetStatus,
  });

  final String budgetYear;
  final String budgetTotal;
  final String lastUpdateDate;
  final String budgetStatus;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
          return const SingleGroupBudget();
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
                "assets/images/planning.png",
                width: 32,
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: ScreenDimension().screenWidth(context) * .65,
                    child: Text(
                      "Year $budgetYear".toUpperCase(),
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
                      "Total Budget: KShs. $budgetTotal",
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
              color: budgetStatus == "Proposed"
                  ? Colors.amber
                  : budgetStatus == "Current"
                      ? Colors.green
                      : Colors.red,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(6, 4, 6, 4),
              child: Text(
                budgetStatus,
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
