import 'package:churchgroupsmanagement/data/sample_agenda.dart';
import 'package:flutter/material.dart';

class MeetingAgendaList extends StatelessWidget {
  const MeetingAgendaList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.fromLTRB(15, 0, 15, 20),
      itemCount: sampleAgendas.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            "${index + 1}. ${sampleAgendas[index]}",
            style: TextStyle(
              height: 1.5,
              fontFamily: "Poppins",
              fontSize: 14,
            ),
          ),
        );
      },
    );
  }
}
