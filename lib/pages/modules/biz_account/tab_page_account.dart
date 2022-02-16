import 'package:auto_route/auto_route.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nu_mobile/router/router.gr.dart';
import 'package:nu_mobile/store/sign_logic.dart';
import 'package:nu_mobile/utils/colors.dart';
import 'package:nu_mobile/utils/icons.dart';
import 'package:thindek_ui/thindek_ui.dart';
import 'package:url_launcher/url_launcher.dart';

const String jscodeSearch =
    "document.getElementsByTagName('header')[0].style.display = 'none';" +
        "document.getElementsByTagName('footer')[0].style.display = 'none';";

const String jscodeCalendar =
    "document.getElementById('header').style.display = 'none';" +
        "document.getElementById('footer').style.display = 'none';" +
        "document.getElementById('searchbox').style.display = 'none';";

class TabPageAccount extends StatefulWidget {
  @override
  _TabPageAccountState createState() => _TabPageAccountState();
}

class _TabPageAccountState extends State<TabPageAccount> {
  final EasyRefreshController _controller = EasyRefreshController();

  final ChromeSafariBrowser browser = ChromeSafariBrowser();

  @override
  Widget build(BuildContext context) {
    return Container(
        color: CupertinoColors.systemGroupedBackground,
        child: GestureDetector(
          child: ListView(
            children: [
              SizedBox(
                height: 15.sp * 2,
              ),
              Obx(() {
                return SignLogic.to.isSigned.value
                    ? Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width *
                                MARGIN_RATIO),
                        margin: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width *
                                MARGIN_RATIO),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Container(
                          child: Stack(
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    height: 15.sp,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            width: 35.sp * 4,
                                          ),
                                          Container(
                                            child: Column(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    // isLogged ? context.pushRoute(PageHomepageMe()) : context.pushRoute(PageLogin());
                                                  },
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.person,
                                                        size: 30.sp,
                                                        color: Colors.black54,
                                                      ),
                                                      Text(
                                                        SignLogic
                                                            .to.userInfo['name']
                                                            .toString(),
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 30.sp),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 30.sp * 2,
                                  ),
                                ],
                              ),
                              FractionalTranslation(
                                translation: Offset(0, -0.2),
                                child: Container(
                                  child: GestureDetector(
                                      onTap: () {
                                        // isLogged ? context.pushRoute(PageHomepageMe()) : context.pushRoute(PageLogin());
                                      },
                                      child: CircleAvatar(
                                        backgroundColor: NUColors.Purple80,
                                        backgroundImage: AssetImage(
                                            'assets/images/logo_n.png'),
                                        maxRadius: 45.sp,
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : Container();
              }),

//               SignLogic.to.isSigned.value
//                   ? GestureDetector(
//                       onTap: () async {
// // Present the dialog to the user
// //                   final result = await FlutterWebAuth.authenticate(
// //                       url:
// //                           "https://prd-nusso.it.northwestern.edu/nusso/XUI/?realm=%2Fnorthwestern&goto=https%3A%2F%2Fprd-nusso.it.northwestern.edu%3A443%2Fnusso%2Foauth2%2Fauthorize%3Fresponse_mode%3Dform_post%26state%3Dee0765bd-ce96-509f-b9ed-651a5045f29a%26redirect_uri%3Dhttps%253A%252F%252Fwww.it.northwestern.edu%253A443%252Fagent%252Fcdsso-oauth2%26response_type%3Did_token%26scope%3Dopenid%26client_id%3Dnuit-nuinfo%26agent_provider%3Dtrue%26agent_realm%3D%252Fnorthwestern%26nonce%3D2DE32711851B742D27CD557050722881#login/",
// //                       callbackUrlScheme:
// //                           "https://caesar.ent.northwestern.edu/");
// //
// // // Extract token from resulting url
// //                   final token = Uri.parse(result).queryParameters['token'];
// //                   print(token.toString());
//                       },
//                       child: Container(
//                         margin: EdgeInsets.symmetric(
//                             horizontal: MediaQuery.of(context).size.width *
//                                 MARGIN_RATIO,
//                             vertical: 15.sp),
//                         height: MediaQuery.of(context).size.width *
//                             (1 - 2 * MARGIN_RATIO) *
//                             0.4,
//                         child: Stack(
//                           children: [
//                             Container(
//                               height: MediaQuery.of(context).size.width *
//                                   (1 - 2 * MARGIN_RATIO) *
//                                   0.4,
//                               decoration: BoxDecoration(
//                                 borderRadius: TDKRadii.r10,
//                                 color: Colors.white,
//                                 image: DecorationImage(
//                                   fit: BoxFit.cover,
//                                   image: AssetImage(
//                                     'assets/images/purple-polygons.png',
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Column(
//                               children: [
//                                 Container(
//                                   margin: EdgeInsets.symmetric(
//                                       horizontal:
//                                           MediaQuery.of(context).size.width *
//                                               MARGIN_RATIO,
//                                       vertical: 20.sp),
//                                   child: GestureDetector(
//                                     onTap: () {
//                                       // isLogged ? context.pushRoute(PageHomepageMe()) : context.pushRoute(PageLogin());
//                                     },
//                                     child: Row(
//                                       children: [
//                                         Icon(
//                                           Icons.person,
//                                           size: 30.sp,
//                                           color: Colors.white,
//                                         ),
//                                         Container(
//                                           padding: EdgeInsets.symmetric(
//                                               horizontal: 10.sp),
//                                           child: Text(
//                                             SignLogic.to.userInfo['name'],
//                                             textAlign: TextAlign.left,
//                                             style: TextStyle(
//                                                 fontWeight: FontWeight.w500,
//                                                 fontSize: 30.sp,
//                                                 color: Colors.white),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 Container(
//                                   margin: EdgeInsets.symmetric(
//                                       horizontal:
//                                           MediaQuery.of(context).size.width *
//                                               MARGIN_RATIO,
//                                       vertical: 20.sp),
//                                   child: GestureDetector(
//                                     onTap: () {
//                                       // isLogged ? context.pushRoute(PageHomepageMe()) : context.pushRoute(PageLogin());
//                                     },
//                                     child: Row(
//                                       children: [
//                                         Icon(
//                                           CommunityMaterialIcons.medal,
//                                           size: 30.sp,
//                                           color: Colors.white,
//                                         ),
//                                         Container(
//                                           padding: EdgeInsets.symmetric(
//                                               horizontal: 10.sp),
//                                           child: Text(
//                                             'kudos: 99',
//                                             textAlign: TextAlign.left,
//                                             style: TextStyle(
//                                                 fontWeight: FontWeight.w500,
//                                                 fontSize: 30.sp,
//                                                 color: Colors.white),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//
//                             // Container(
//                             //   height: MediaQuery.of(context).size.width *
//                             //       (1 - 2 * MARGIN_RATIO) *
//                             //       0.4,
//                             //   decoration: BoxDecoration(
//                             //     borderRadius: TDKRadii.r10,
//                             //     color: Color(0xbc4e2a84),
//                             //   ),
//                             // ),
//                           ],
//                         ),
//                       ),
//                     )
//                   : Container(),
              SizedBox(
                height: 15.sp * 2,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal:
                        MediaQuery.of(context).size.width * MARGIN_RATIO),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
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
                      'CAESAR (NetID)',
                      () async {
                        await browser.open(
                            url: Uri.parse(
                                "https://caesar.ent.northwestern.edu/"),
                            options: ChromeSafariBrowserClassOptions(
                                android: AndroidChromeCustomTabsOptions(
                                    addDefaultShareMenuItem: false),
                                ios: IOSSafariOptions(
                                    barCollapsingEnabled: true)));
                      },
                      Icons.assignment_rounded,
                    ),
                    menuList(
                      'Academic Calendar',
                      () {
                        context.pushRoute(
                          PageWebBrowse(
                              url:
                                  "https://planitpurple.northwestern.edu/calendar/academic_calendar/",
                              jscode: jscodeCalendar),
                        );
                      },
                      CommunityMaterialIcons.calendar_clock,
                    ),
                    menuList(
                      'Canvas',
                      () async {
                        String _url =
                            'canvas-student://canvas.northwestern.edu';
                        await canLaunch(_url)
                            ? await launch(_url)
                            : context.pushRoute(
                                PageWebBrowse(
                                    url: "https://canvas.northwestern.edu/"),
                              );
                      },
                      IconFont.icon_Canvas,
                    ),
                    menuList(
                      'Printing',
                      () async {
                        await browser.open(
                            url: Uri.parse(
                                "https://nuprint.northwestern.edu/mr"),
                            options: ChromeSafariBrowserClassOptions(
                                android: AndroidChromeCustomTabsOptions(
                                    addDefaultShareMenuItem: false),
                                ios: IOSSafariOptions(
                                    barCollapsingEnabled: true)));
                      },
                      Icons.print_rounded,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.sp * 2,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal:
                        MediaQuery.of(context).size.width * MARGIN_RATIO),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  children: [
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
                      'Share a Concern (NUhelp)',
                      () {
                        context.pushRoute(
                          PageConcern(),
                        );
                      },
                      CupertinoIcons.hand_raised_fill,
                    ),
                    // menuList(
                    //   'Lost and Found',
                    //   () {
                    //     // context.pushRoute(
                    //     //   PageWebBrowse(url: "https://tutorial.munshare.com/"),
                    //     // );
                    //   },
                    //   Icons.find_replace_rounded,
                    // ),
                    // menuList(
                    //   'RespectNU: Report an Incident',
                    //   () {
                    //     // context.pushRoute(
                    //     //   PageWebBrowse(url: "https://tutorial.munshare.com/"),
                    //     // );
                    //   },
                    //   CupertinoIcons.hand_raised_fill,
                    // ),
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
