import 'package:churchgroupsmanagement/services/constants.dart';
import 'package:flutter/material.dart';

class SingleMeetingListItem extends StatelessWidget {
  const SingleMeetingListItem({
    super.key,
    required this.meetingTitle,
    required this.meetingDate,
    required this.lastUpdated,
    required this.meetingStatus,
  });

  final String meetingTitle;
  final String meetingDate;
  final String lastUpdated;
  final bool meetingStatus;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
        //   return const SingleGroupMinute();
        // }));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.only(bottom: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              "assets/images/meeting.png",
              fit: BoxFit.cover,
              width: 45,
              height: 45,
            ),
            const SizedBox(width: 15),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: ScreenDimension().screenWidth(context) * 0.70,
                    child: Text(
                      meetingTitle.toUpperCase(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: ScreenDimension().screenWidth(context) * 0.70,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 1, 0, 9),
                      child: Text(
                        meetingDate,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.grey[900],
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: ScreenDimension().screenWidth(context) * 0.70,
                    child: Text(
                      lastUpdated,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
