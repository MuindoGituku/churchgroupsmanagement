import 'package:churchgroupsmanagement/services/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchTextFilter extends StatelessWidget {
  const SearchTextFilter({
    super.key,
    required this.searchLabel,
  });

  final String searchLabel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: ScreenDimension().screenWidth(context) * 0.75,
          child: TextFormField(
            style: const TextStyle(
              height: 1,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              prefixIcon: const Icon(
                CupertinoIcons.search,
                size: 15,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              labelText: searchLabel,
              labelStyle: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                height: 1,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: const Icon(
            CupertinoIcons.slider_horizontal_3,
            color: Colors.blue,
            size: 30,
          ),
        ),
      ],
    );
  }
}
