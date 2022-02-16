import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DocTitle extends StatelessWidget {
  final String text;
  const DocTitle({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.sp),
      child: Text(
        text,
        style: TextStyle(fontSize: 36.sp, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class DocSection extends StatelessWidget {
  final String text;
  const DocSection({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.sp),
      child: Text(text),
    );
  }
}
