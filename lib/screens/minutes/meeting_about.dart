import 'package:flutter/material.dart';

class MeetingAboutInfo extends StatelessWidget {
  const MeetingAboutInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(12, 0, 12, 15),
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(70, 204, 204, 204),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/icons/location.png",
                      color: Colors.black54,
                      width: 18,
                      height: 18,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Kahawa Farmers Church Boardroom",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Image.asset(
                      "assets/icons/calendar.png",
                      color: Colors.black54,
                      width: 16,
                      height: 16,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Sun, 4th Nov 2023 From 4pm",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Image.asset(
                      "assets/icons/people.png",
                      color: Colors.black54,
                      width: 18,
                      height: 18,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "12 Present, 5 Absent",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Text(
              "Meeting Approval Status",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
