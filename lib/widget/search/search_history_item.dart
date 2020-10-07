import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget searchHistoryItem(value) {
  return Container(
    padding: EdgeInsets.all(20),
    child: Text(
      value,
      style: TextStyle(color: Colors.grey),
    ),
  );
}
