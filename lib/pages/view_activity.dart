import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nu_mobile/utils/colors.dart';

class ViewActivity extends StatefulWidget {
  const ViewActivity({Key? key}) : super(key: key);

  @override
  _ViewActivityState createState() => _ViewActivityState();
}

class _ViewActivityState extends State<ViewActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: MediaQuery.of(context).size.width * 0.05,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Activity',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 60.sp, color: NUColors.NUPurple),
        ),
      ),
    );
  }
}
