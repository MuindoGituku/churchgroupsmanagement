import 'package:churchgroupsmanagement/screens/budgets/create_new_budget.dart';
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
        ],
      ),
    );
  }
}
