import 'package:auto_route/auto_route.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nu_mobile/router/router.gr.dart';
import 'package:nu_mobile/utils/colors.dart';
import 'package:thindek_ui/thindek_ui.dart';

const String jscodeSchedule =
    "document.getElementsByTagName('body')[0].style.padding = '0';" +
        "document.getElementsByTagName('header')[0].style.display = 'none';" +
        "document.getElementsByTagName('header')[1].style.display = 'none';" +
        "document.getElementsByClassName('sidearm-schedule-title')[0].style.display = 'none';" +
        "document.getElementsByClassName('content-ad')[0].style.display = 'none';" +
        "document.getElementsByTagName('footer')[0].style.display = 'none';";

class PageRecreation extends StatefulWidget {
  const PageRecreation({Key? key}) : super(key: key);

  @override
  _PageRecreationState createState() => _PageRecreationState();
}

class _PageRecreationState extends State<PageRecreation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: NUColors.Purple80,
        ),
        title: Text(
          'Recreation',
          style: TextStyle(
            color: NUColors.Purple80,
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            libraryTitle(context, 'Facilities Schedules'),
            ListTile(
              leading: Icon(
                Icons.apartment_rounded,
                color: Colors.blueGrey,
                size: 30,
              ),
              onTap: () {
                context.pushRoute(
                  PageWebView(
                    title: 'Henry Crown Sports Pavilion',
                    url: "https://nurecreation.com/sports/hcsp/schedule",
                    jscode: jscodeSchedule,
                  ),
                );
              },
              title: Text(
                'Henry Crown Sports Pavilion',
                style: TextStyle(
                  fontSize: 35.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 30.sp,
              ),
            ),
            tdkDivider(context),
            ListTile(
              leading: Icon(
                CommunityMaterialIcons.swim,
                color: Colors.blueGrey,
                size: 30,
              ),
              onTap: () {
                context.pushRoute(
                  PageWebView(
                    title: 'Norris Aquatics Center',
                    url: "https://nurecreation.com/sports/norris/schedule",
                    jscode: jscodeSchedule,
                  ),
                );
              },
              title: Text(
                'Norris Aquatics Center',
                style: TextStyle(
                  fontSize: 35.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 30.sp,
              ),
            ),
            tdkDivider(context),
            ListTile(
              leading: Icon(
                Icons.accessibility_new_rounded,
                color: Colors.blueGrey,
                size: 30,
              ),
              onTap: () {
                context.pushRoute(
                  PageWebView(
                    title: 'Blomquist Recreation Center',
                    url: "https://nurecreation.com/sports/blomquist/schedule",
                    jscode: jscodeSchedule,
                  ),
                );
              },
              title: Text(
                'Blomquist Recreation Center',
                style: TextStyle(
                  fontSize: 35.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 30.sp,
              ),
            ),
            tdkDivider(context),
            ListTile(
              leading: Icon(
                Icons.sports_football_rounded,
                color: Colors.blueGrey,
                size: 30,
              ),
              onTap: () {
                context.pushRoute(
                  PageWebView(
                    title: 'Ryan Fieldhouse/Wilson Field',
                    url: "https://nurecreation.com/sports/ryan/schedule",
                    jscode: jscodeSchedule,
                  ),
                );
              },
              title: Text(
                'Ryan Fieldhouse/Wilson Field',
                style: TextStyle(
                  fontSize: 35.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 30.sp,
              ),
            ),
            tdkDivider(context),
            ListTile(
              leading: Icon(
                Icons.sports_handball,
                color: Colors.blueGrey,
                size: 30,
              ),
              onTap: () {
                context.pushRoute(
                  PageWebView(
                    title: 'Wellness Suite',
                    url:
                        "https://nurecreation.com/sports/wellnesssuite/schedule",
                    jscode: jscodeSchedule,
                  ),
                );
              },
              title: Text(
                'Wellness Suite',
                style: TextStyle(
                  fontSize: 35.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 30.sp,
              ),
            ),
            tdkDivider(context),
            ListTile(
              leading: Icon(
                Icons.sports_kabaddi_rounded,
                color: Colors.blueGrey,
                size: 30,
              ),
              onTap: () {
                context.pushRoute(
                  PageWebView(
                    title: 'Massage Therapy',
                    url: "https://nurecreation.com/sports/massage/schedule",
                    jscode: jscodeSchedule,
                  ),
                );
              },
              title: Text(
                'Massage Therapy',
                style: TextStyle(
                  fontSize: 35.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 30.sp,
              ),
            ),
            tdkDivider(context),
            ListTile(
              leading: Icon(
                Icons.sailing_rounded,
                color: Colors.blueGrey,
                size: 30,
              ),
              onTap: () {
                context.pushRoute(
                  PageWebView(
                    title: 'Sailing Center',
                    url: "https://nurecreation.com/sports/sailing/schedule",
                    jscode: jscodeSchedule,
                  ),
                );
              },
              title: Text(
                'Sailing Center',
                style: TextStyle(
                  fontSize: 35.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 30.sp,
              ),
            ),
            tdkDivider(context),
            ListTile(
              leading: Icon(
                Icons.beach_access_rounded,
                color: Colors.blueGrey,
                size: 30,
              ),
              onTap: () {
                context.pushRoute(
                  PageWebView(
                    title: 'Northwestern Beach',
                    url: "https://nurecreation.com/sports/beach/schedule",
                    jscode: jscodeSchedule,
                  ),
                );
              },
              title: Text(
                'Northwestern Beach',
                style: TextStyle(
                  fontSize: 35.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 30.sp,
              ),
            ),
            tdkDivider(context),
            ListTile(
              leading: Icon(
                Icons.work_rounded,
                color: Colors.blueGrey,
                size: 30,
              ),
              onTap: () {
                context.pushRoute(
                  PageWebView(
                    title: 'Membership Office',
                    url: "https://nurecreation.com/sports/membership/schedule",
                    jscode: jscodeSchedule,
                  ),
                );
              },
              title: Text(
                'Membership Office',
                style: TextStyle(
                  fontSize: 35.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 30.sp,
              ),
            ),
            libraryTitle(context, 'Recreation Membership'),
            InkWell(
              onTap: () {
                context.pushRoute(
                  PageWebBrowse(url: "https://recreation.northwestern.edu/"),
                );
              },
              child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal:
                        MediaQuery.of(context).size.width * MARGIN_RATIO,
                    vertical: 15.sp),
                height: MediaQuery.of(context).size.width *
                    (1 - 2 * MARGIN_RATIO) *
                    0.2,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.width *
                          (1 - 2 * MARGIN_RATIO) *
                          0.2,
                      decoration: BoxDecoration(
                        borderRadius: TDKRadii.r10,
                        color: Colors.white,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'assets/images/tech_room_finder.jpeg',
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width *
                          (1 - 2 * MARGIN_RATIO) *
                          0.2,
                      decoration: BoxDecoration(
                        borderRadius: TDKRadii.r10,
                        color: Color(0xbc4e2a84),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width *
                          (1 - 2 * MARGIN_RATIO) *
                          0.2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Access Your Account >',
                            style: TextStyle(
                                fontSize: 40.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget libraryImage(BuildContext context, String path) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO,
          vertical: 15.sp),
      height: MediaQuery.of(context).size.width * (1 - 2 * MARGIN_RATIO) * 0.4,
      child: Container(
        height:
            MediaQuery.of(context).size.width * (1 - 2 * MARGIN_RATIO) * 0.4,
        decoration: BoxDecoration(
          borderRadius: TDKRadii.r10,
          color: Colors.white,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              path,
            ),
          ),
        ),
      ),
    );
  }

  Widget libraryDescription(String description) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO,
          vertical: 15.sp),
      child: Text(description),
    );
  }

  Container libraryTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO,
          vertical: 30.sp),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 40.sp, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }

  Widget routeMap(
      BuildContext context, String level, dynamic route, Color color) {
    return InkWell(
      onTap: route,
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO,
            vertical: 15.sp),
        child: Text(
          level,
          style: TextStyle(
              fontSize: 40.sp, fontWeight: FontWeight.w600, color: color),
        ),
      ),
    );
  }
}
