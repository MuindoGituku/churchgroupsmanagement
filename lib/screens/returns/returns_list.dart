import 'package:churchgroupsmanagement/screens/returns/create_new_return.dart';
import 'package:churchgroupsmanagement/widgets/main_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllReturnForms extends StatefulWidget {
  const AllReturnForms({super.key});

  @override
  State<AllReturnForms> createState() => _AllReturnFormsState();
}

class _AllReturnFormsState extends State<AllReturnForms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainPageAppBar(
            pageTitle: "Expenditure Returns",
            pageSubtitle: "Woman's Guild",
            onTapAdd: () {
              Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
                return const CreateNewReturn();
              }));
            },
            onTapSearch: () {
              Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
                return const CreateNewReturn();
              }));
            },
          ),
        ],
      ),
    );
  }
}
