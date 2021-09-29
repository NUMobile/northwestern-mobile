import 'package:auto_route/auto_route.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nu_mobile/router/router.gr.dart';
import 'package:nu_mobile/utils/colors.dart';
import 'package:nu_mobile/utils/icons.dart';
import 'package:thindek_ui/thindek_ui.dart';
import 'package:url_launcher/url_launcher.dart';

const String jscodeSearch = "document.getElementsByTagName('header')[0].style.display = 'none';" +
    "document.getElementsByTagName('footer')[0].style.display = 'none';";

class TabPageAccount extends StatefulWidget {
  @override
  _TabPageAccountState createState() => _TabPageAccountState();
}

class _TabPageAccountState extends State<TabPageAccount> {
  final EasyRefreshController _controller = EasyRefreshController();
  @override
  Widget build(BuildContext context) {
    return Container(
        color: CupertinoColors.systemGroupedBackground,
        child: GestureDetector(
          child: ListView(
            children: [
              // Container(
              //   padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO),
              //   margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO),
              //   decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10))),
              //   child: Container(
              //     child: Stack(
              //       children: [
              //         Column(
              //           children: [
              //             SizedBox(
              //               height: 15.sp,
              //             ),
              //             Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               children: [
              //                 Row(
              //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //                   children: [
              //                     Container(
              //                       width: 35.sp * 4,
              //                     ),
              //                     Container(
              //                       child: Column(
              //                         children: [
              //                           GestureDetector(
              //                             onTap: () {
              //                               // isLogged ? context.pushRoute(PageHomepageMe()) : context.pushRoute(PageLogin());
              //                             },
              //                             child: Row(
              //                               children: [
              //                                 Icon(
              //                                   Icons.person,
              //                                   size: 30.sp,
              //                                   color: Colors.black54,
              //                                 ),
              //                                 Text(
              //                                   'Mobile ID (Coming Soon)',
              //                                   textAlign: TextAlign.left,
              //                                   style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30.sp),
              //                                 ),
              //                               ],
              //                             ),
              //                           ),
              //                         ],
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ],
              //             ),
              //             SizedBox(
              //               height: 30.sp * 2,
              //             ),
              //           ],
              //         ),
              //         FractionalTranslation(
              //           translation: Offset(0, -0.2),
              //           child: Container(
              //             child: GestureDetector(
              //                 onTap: () {
              //                   // isLogged ? context.pushRoute(PageHomepageMe()) : context.pushRoute(PageLogin());
              //                 },
              //                 child: CircleAvatar(
              //                   backgroundColor: NUColors.Purple80,
              //                   backgroundImage: AssetImage('assets/images/logo_n.png'),
              //                   maxRadius: 45.sp,
              //                 )),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 15.sp * 2,
              // ),
              // Container(
              //   margin:
              //       EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO, vertical: 15.sp),
              //   height: MediaQuery.of(context).size.width * (1 - 2 * MARGIN_RATIO) * 0.4,
              //   child: Stack(
              //     children: [
              //       Container(
              //         height: MediaQuery.of(context).size.width * (1 - 2 * MARGIN_RATIO) * 0.4,
              //         decoration: BoxDecoration(
              //           borderRadius: TDKRadii.r10,
              //           color: Colors.white,
              //           image: DecorationImage(
              //             fit: BoxFit.cover,
              //             image: AssetImage(
              //               'assets/images/purple-polygons.png',
              //             ),
              //           ),
              //         ),
              //       ),
              //       Container(
              //         height: MediaQuery.of(context).size.width * (1 - 2 * MARGIN_RATIO) * 0.4,
              //         decoration: BoxDecoration(
              //           borderRadius: TDKRadii.r10,
              //           color: Color(0xbc4e2a84),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(
                height: 15.sp * 2,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  children: [
                    // menuList(
                    //   'My Wildcard',
                    //   () {
                    //     // context.pushRoute(
                    //     //   PageQrcodeUser(
                    //     //     avatar: model.meInfo['avatar'],
                    //     //     userName: model.meInfo['name_zh'],
                    //     //     userId: model.meInfo.objectId,
                    //     //   ),
                    //     // );
                    //   },
                    //   Icons.qr_code,
                    // ),
                    menuList(
                      'Academic Calendar',
                      () {
                        context.pushRoute(
                          PageWebBrowse(url: "https://planitpurple.northwestern.edu/calendar/academic_calendar/"),
                        );
                      },
                      CommunityMaterialIcons.calendar_clock,
                    ),
                    menuList(
                      'Printing',
                      () {
                        context.pushRoute(
                          PageWebBrowse(url: "https://nuprint.northwestern.edu/mr"),
                        );
                      },
                      Icons.print_rounded,
                    ),
                    menuList(
                      'Canvas',
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
                    // menuList(
                    //   'Download Apps',
                    //   () {
                    //     context.pushRoute(
                    //       PageApps(),
                    //     );
                    //   },
                    //   Icons.get_app_rounded,
                    // ),
                    // menuList(
                    //   'Social Media',
                    //   () async {
                    //     const url = 'https://google.com';
                    //
                    //     if (await canLaunch(url)) {
                    //       await launch(url, forceWebView: true);
                    //     } else {
                    //       throw 'Could not launch $url';
                    //     }
                    //   },
                    //   CupertinoIcons.chart_bar_circle_fill,
                    // ),
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
        ));
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
