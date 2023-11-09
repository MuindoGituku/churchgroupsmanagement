import 'package:churchgroupsmanagement/forms/create_new_budget.dart';
import 'package:churchgroupsmanagement/screens/root_navigation.dart';
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
            onTapTrailing: () {
              Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
                return CreateNewBudget();
              }));
            },
          ),
        ],
      ),
    );
  }
}
