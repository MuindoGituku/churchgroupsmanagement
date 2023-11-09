import 'package:churchgroupsmanagement/screens/requisitions_single.dart';
import 'package:churchgroupsmanagement/services/constants.dart';
import 'package:flutter/cupertino.dart';
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
        Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
          return SingleExpenseRequisition();
        }));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.only(bottom: 15, top: 5),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Image.asset(
                  "assets/images/meeting.png",
                  fit: BoxFit.cover,
                  width: 50,
                  height: 50,
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: ScreenDimension().screenWidth(context) * 0.63,
                      child: Text(
                        meetingTitle.toUpperCase(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 13,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: ScreenDimension().screenWidth(context) * 0.63,
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
                      width: ScreenDimension().screenWidth(context) * 0.63,
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
                )
              ],
            ),
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: meetingStatus ? Colors.green : Colors.amber,
                shape: BoxShape.circle,
              ),
              child: Icon(
                meetingStatus
                    ? CupertinoIcons.checkmark_alt
                    : CupertinoIcons.exclamationmark,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
