import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nu_mobile/router/router.gr.dart';
import 'package:nu_mobile/utils/colors.dart';
import 'package:nu_mobile/utils/values.dart';

class TabPageAccount extends StatefulWidget {
  @override
  _TabPageAccountState createState() => _TabPageAccountState();
}

class _TabPageAccountState extends State<TabPageAccount> {
  final EasyRefreshController _controller = EasyRefreshController();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO),
          margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Container(
            child: Stack(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 15.sp,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                          'Mobile ID (Coming Soon)',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30.sp),
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
                          backgroundImage: AssetImage('assets/images/logo_n.png'),
                          maxRadius: 45.sp,
                        )),
                  ),
                ),
              ],
            ),
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
                'My Wildcard',
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
                'Edit My Info',
                () {
                  // context.pushRoute(
                  //   PageMyInfo(),
                  // );
                },
                Icons.person_pin_rounded,
              ),
              menuList(
                'Directory',
                () {
                  // context.navigateTo();
                },
                CupertinoIcons.square_favorites_fill,
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
                'Maps',
                () {
                  context.pushRoute(
                    PageWebBrowse(url: "https://maps.northwestern.edu"),
                  );
                },
                Icons.map_rounded,
              ),
              menuList(
                'PDF',
                () {
                  context.pushRoute(
                    PageWebPdf(
                        title: 'Evanston Campus',
                        url: "https://www.northwestern.edu/campus-life/visiting-campus/documents/EV_campusmap.pdf"),
                  );
                },
                Icons.map_rounded,
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
              // menuList(
              //   '模联U+',
              //   () {
              //     context.pushRoute(
              //       PageMunUniversity(),
              //     );
              //   },
              //   Icons.account_balance,
              // ),
              menuList(
                'Settings',
                () {
                  // context.pushRoute(PageSettings());
                },
                Icons.settings,
              ),
            ],
          ),
        ),
      ],
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
