import 'package:churchgroupsmanagement/services/constants.dart';
import 'package:flutter/material.dart';

class CreateExpenditureReturn extends StatefulWidget {
  const CreateExpenditureReturn({super.key});

  @override
  State<CreateExpenditureReturn> createState() =>
      _CreateExpenditureReturnState();
}

class _CreateExpenditureReturnState extends State<CreateExpenditureReturn> {
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
                      "Create Expenditure Return",
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
    );
  }
}
