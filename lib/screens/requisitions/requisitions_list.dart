import 'package:churchgroupsmanagement/screens/requisitions/create_new_requisition.dart';
import 'package:churchgroupsmanagement/widgets/main_app_bar.dart';
import 'package:churchgroupsmanagement/widgets/search_text_filter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllExpenseRequisitions extends StatefulWidget {
  const AllExpenseRequisitions({super.key});

  @override
  State<AllExpenseRequisitions> createState() => _AllExpenseRequisitionsState();
}

class _AllExpenseRequisitionsState extends State<AllExpenseRequisitions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainPageAppBar(
            pageTitle: "Expense Requisitions",
            pageSubtitle: "Woman's Guild",
            onTapAdd: () {
              Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
                return const CreateNewRequisition();
              }));
            },
            onTapSearch: () {
              Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
                return const CreateNewRequisition();
              }));
            },
          ),
          const Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 10, 20, 10),
                    child: SearchTextFilter(
                      searchLabel: "Search for requisitions...",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 10, 20, 5),
                    child: Text(
                      "3rd Quarter (Apr - Jun 2023)",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 15,
                        letterSpacing: 0.5,
                        height: 1.5,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 10, 20, 25),
                    child: Text(
                      "2nd Quarter (Jan - Mar 2023)",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 15,
                        letterSpacing: 0.5,
                        height: 1.5,
                        fontWeight: FontWeight.w700,
                      ),
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
