import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget buildTitleRow(IconData icon, String title) {
  return Row(
    children: [
      FaIcon(
        icon,
        size: 20,
      ),
      SizedBox(width: 20),
      Text(
        title,
        style: TextStyle(fontSize: 20),
      ),
    ],
  );
}

Widget buildInfoRow(List<String> labels, List<String> values) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      SizedBox(),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (String label in labels) Text(label),
        ],
      ),
      SizedBox(),
      SizedBox(),
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          for (String value in values) Text(value),
        ],
      ),
    ],
  );
}
