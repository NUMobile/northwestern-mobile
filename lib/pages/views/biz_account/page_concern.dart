import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nu_mobile/router/router.gr.dart';
import 'package:nu_mobile/utils/colors.dart';
import 'package:thindek_ui/thindek_ui.dart';

class PageConcern extends StatefulWidget {
  @override
  _PageConcernState createState() => _PageConcernState();
}

class _PageConcernState extends State<PageConcern> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        centerTitle: true,
        iconTheme: IconThemeData(color: NUColors.Purple90),
        title: Text(
          'Share a Concern',
          style: TextStyle(color: NUColors.Purple90),
        ),
      ),
      body: ListView(children: [
        // Container(
        //   // padding: EdgeInsets.fromLTRB(
        //   //     8.w, 4.h, 8.w, 4.h),
        //   child: Card(
        //     elevation: 0,
        //     child: Column(
        //       children: [
        //         ListTile(
        //           title: Text('账号设置'),
        //           trailing: Icon(
        //             Icons.arrow_forward_ios,
        //             size: 30.sp,
        //           ),
        //         ),
        //         ListTile(
        //           title: Text('我的收藏'),
        //           trailing: Icon(
        //             Icons.arrow_forward_ios,
        //             size: 30.sp,
        //           ),
        //         ),
        //         ListTile(
        //           title: Text('帮助中心'),
        //           trailing: Icon(
        //             Icons.arrow_forward_ios,
        //             size: 30.sp,
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        // ),
        Container(
          // padding: EdgeInsets.fromLTRB(
          //     8.w, 4.h, 8.w, 4.h),
          child: Card(
            elevation: 0,
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    context.pushRoute(
                      PageWebBrowse(
                          url:
                              "https://cm.maxient.com/reportingform.php?NorthwesternUniv&layout_id=127"),
                    );
                  },
                  title: Text('General Concern'),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 30.sp,
                  ),
                ),
                tdkDivider(context),
                ListTile(
                  onTap: () {
                    context.pushRoute(
                      PageWebBrowse(
                          url:
                              "https://cm.maxient.com/reportingform.php?NorthwesternUniv&layout_id=31"),
                    );
                  },
                  title: Text('Report Sexual Misconduct'),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 30.sp,
                  ),
                ),
                tdkDivider(context),
                ListTile(
                  onTap: () {
                    context.pushRoute(
                      PageWebBrowse(
                          url:
                              "https://cm.maxient.com/reportingform.php?NorthwesternUniv&layout_id=32"),
                    );
                  },
                  title: Text('Report Discrimination and Harassment'),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 30.sp,
                  ),
                ),
                tdkDivider(context),
                ListTile(
                  onTap: () {
                    context.pushRoute(
                      PageWebBrowse(
                          url:
                              "https://cm.maxient.com/reportingform.php?NorthwesternUniv&layout_id=26"),
                    );
                  },
                  title: Text('Share a Concern Related to Hate or Bias'),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 30.sp,
                  ),
                ),
                tdkDivider(context),
                ListTile(
                  onTap: () {
                    context.pushRoute(
                      PageWebBrowse(
                          url:
                              "https://cm.maxient.com/reportingform.php?NorthwesternUniv&layout_id=124"),
                    );
                  },
                  title: Text('Wildcats Aware'),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 30.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
