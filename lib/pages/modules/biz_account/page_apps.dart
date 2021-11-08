import 'package:auto_route/auto_route.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nu_mobile/router/router.gr.dart';
import 'package:nu_mobile/utils/colors.dart';
import 'package:nu_mobile/utils/icons.dart';
import 'package:thindek_ui/thindek_ui.dart';
import 'package:url_launcher/url_launcher.dart';

class PageApps extends StatefulWidget {
  const PageApps({Key? key}) : super(key: key);

  @override
  _PageAppsState createState() => _PageAppsState();
}

class _PageAppsState extends State<PageApps> {
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
          'Download Apps',
          style: TextStyle(
            color: NUColors.Purple80,
          ),
        ),
      ),
      body: Container(
          color: Colors.black12,
          child: GestureDetector(
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    children: [
                      menuList(
                        'Canvas',
                        () {
                          // context.pushRoute(
                          //   PageQrcodeUser(
                          //     avatar: model.meInfo['avatar'],
                          //     userName: model.meInfo['name_zh'],
                          //     userId: model.meInfo.objectId,
                          //   ),
                          // );
                        },
                        Icons.qr_code,
                      ),
                      menuList(
                        'Duo',
                        () {
                          context.pushRoute(
                            PageWebBrowse(url: "https://planitpurple.northwestern.edu/calendar/academic_calendar/"),
                          );
                        },
                        CommunityMaterialIcons.calendar_clock,
                      ),
                      menuList(
                        'Symptom Tracker',
                        () {
                          context.pushRoute(
                            PageWebBrowse(url: "https://nuprint.northwestern.edu/mr"),
                          );
                        },
                        Icons.print_rounded,
                      ),
                      menuList(
                        'NAVICA',
                        () async {
                          String _url = 'canvas-student://canvas.northwestern.edu';
                          await canLaunch(_url)
                              ? await launch(_url)
                              : context.pushRoute(
                                  PageWebBrowse(url: "https://canvas.northwestern.edu/"),
                                );
                        },
                        IconFont.icon_Canvas,
                      ),
                      menuList(
                        'Recreation Membership',
                        () {
                          context.pushRoute(
                            PageWebBrowse(url: "https://recreation.northwestern.edu/"),
                          );
                        },
                        Icons.sports_handball,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.sp * 2,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    children: [
                      menuList(
                        'Shuttle Tracker(TransLoc)',
                        () {
                          context.pushRoute(
                            PageWebBrowse(url: "https://northwestern.transloc.com"),
                          );
                        },
                        Icons.bus_alert,
                      ),
                      menuList(
                        'Social Media',
                        () async {
                          const url = 'https://google.com';

                          if (await canLaunch(url)) {
                            await launch(url, forceWebView: true);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        CupertinoIcons.chart_bar_circle_fill,
                      ),
                      menuList(
                        'Social Media',
                        () async {
                          const url = 'https://google.com';

                          if (await canLaunch(url)) {
                            await launch(url, forceWebView: true);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        CupertinoIcons.chart_bar_circle_fill,
                      ),
                      menuList(
                        'Share a Concern',
                        () {
                          // context.pushRoute(
                          //   PageWebBrowse(url: "https://tutorial.munshare.com/"),
                          // );
                        },
                        CupertinoIcons.hand_raised_fill,
                      ),
                      menuList(
                        'Lost and Found',
                        () {
                          // context.pushRoute(
                          //   PageWebBrowse(url: "https://tutorial.munshare.com/"),
                          // );
                        },
                        Icons.find_replace_rounded,
                      ),
                      menuList(
                        'RespectNU: Report an Incident',
                        () {
                          // context.pushRoute(
                          //   PageWebBrowse(url: "https://tutorial.munshare.com/"),
                          // );
                        },
                        CupertinoIcons.hand_raised_fill,
                      ),
                      menuList(
                        'Settings',
                        () {
                          context.pushRoute(
                            PageSettings(),
                          );
                        },
                        Icons.settings,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

ListTile menuList(
  String title,
  dynamic route,
  IconData icon,
) {
  return ListTile(
    leading: Icon(
      icon,
      color: NUColors.Purple90,
      size: 30,
    ),
    onTap: route,
    title: Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.w500,
      ),
    ),
    trailing: Icon(
      Icons.arrow_forward_ios,
      size: 30.sp,
    ),
  );
}
