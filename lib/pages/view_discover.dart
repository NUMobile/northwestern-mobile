import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nu_mobile/utils/colors.dart';

class ViewDiscover extends StatefulWidget {
  const ViewDiscover({Key? key}) : super(key: key);

  @override
  _ViewDiscoverState createState() => _ViewDiscoverState();
}

class _ViewDiscoverState extends State<ViewDiscover> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: MediaQuery.of(context).size.width * 0.05,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Discover',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 60.sp, color: NUColors.NUPurple),
        ),
      ),
    );
  }
}
