import 'package:churchgroupsmanagement/data/sample_attendance.dart';
import 'package:flutter/material.dart';

class MeetingAttendanceInfo extends StatelessWidget {
  const MeetingAttendanceInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Text(
            "Members Present",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
        Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          columnWidths: const {
            0: IntrinsicColumnWidth(),
            1: FlexColumnWidth(),
            2: FlexColumnWidth(),
          },
          children: List.generate(
            meetingAttendanceList
                .where((element) => element["attendance"] == "Present")
                .length,
            (index) {
              Iterable<Map<String, String>> newList = meetingAttendanceList
                  .where((element) => element["attendance"] == "Present");
              return TableRow(
                children: [
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Text(
                        "${index + 1}.",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        newList
                            .toList()
                            .elementAt(index)["full_names"]
                            .toString(),
                        style: const TextStyle(
                          fontSize: 14,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        newList
                            .toList()
                            .elementAt(index)["position"]
                            .toString(),
                        style: const TextStyle(
                          fontSize: 14,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
          child: Text(
            "Absent With Apology",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ),
        Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          columnWidths: const {
            0: IntrinsicColumnWidth(),
            1: FlexColumnWidth(),
            2: FlexColumnWidth(),
          },
          children: List.generate(
            meetingAttendanceList
                .where(
                    (element) => element["attendance"] == "Absent With Apology")
                .length,
            (index) {
              Iterable<Map<String, String>> newList =
                  meetingAttendanceList.where((element) =>
                      element["attendance"] == "Absent With Apology");
              return TableRow(
                children: [
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Text(
                        "${index + 1}.",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        newList
                            .toList()
                            .elementAt(index)["full_names"]
                            .toString(),
                        style: const TextStyle(
                          fontSize: 14,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        newList
                            .toList()
                            .elementAt(index)["position"]
                            .toString(),
                        style: const TextStyle(
                          fontSize: 14,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
          child: Text(
            "Absent Without Apology",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ),
        Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          columnWidths: const {
            0: IntrinsicColumnWidth(),
            1: FlexColumnWidth(),
            2: FlexColumnWidth(),
          },
          children: List.generate(
            meetingAttendanceList
                .where((element) =>
                    element["attendance"] == "Absent Without Apology")
                .length,
            (index) {
              Iterable<Map<String, String>> newList =
                  meetingAttendanceList.where((element) =>
                      element["attendance"] == "Absent Without Apology");
              return TableRow(
                children: [
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Text(
                        "${index + 1}.",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        newList
                            .toList()
                            .elementAt(index)["full_names"]
                            .toString(),
                        style: const TextStyle(
                          fontSize: 14,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        newList
                            .toList()
                            .elementAt(index)["position"]
                            .toString(),
                        style: const TextStyle(
                          fontSize: 14,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
