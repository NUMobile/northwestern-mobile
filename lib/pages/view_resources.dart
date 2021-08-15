import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nu_mobile/pages/views/biz_resources/tab_page_resources.dart';
import 'package:nu_mobile/utils/colors.dart';

class ViewResources extends StatefulWidget {
  const ViewResources({Key? key}) : super(key: key);

  @override
  _ViewResourcesState createState() => _ViewResourcesState();
}

class _ViewResourcesState extends State<ViewResources> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: MediaQuery.of(context).size.width * 0.05,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Resources',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 60.sp, color: NUColors.NUPurple),
        ),
      ),
      body: TabPageResources(),
    );
  }
}
