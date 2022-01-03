import 'package:auto_route/auto_route.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nu_mobile/router/router.gr.dart';
import 'package:nu_mobile/utils/colors.dart';
import 'package:thindek_ui/thindek_ui.dart';

const String jscodeFaq =
    "document.getElementsByTagName('header')[0].style.display = 'none';";
const String scriptBreathe =
    'Breathe is a stress management resource, created purposely for NU students. In Breathe, you will find a variety of guided meditations and breathing practices to help you deal with stress.';

class PageHealth extends StatefulWidget {
  const PageHealth({Key? key}) : super(key: key);

  @override
  _PageHealthState createState() => _PageHealthState();
}

class _PageHealthState extends State<PageHealth> {
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
          'Health',
          style: TextStyle(
            color: NUColors.Purple80,
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            // libraryTitle(context, 'NU Shuttle Tracker'),
            ListTile(
              leading: Icon(
                CommunityMaterialIcons.hospital_box_outline,
                color: NUColors.Purple90,
                size: 30,
              ),
              onTap: () {
                context.pushRoute(
                  PageWebBrowse(
                    url:
                        "https://www.northwestern.edu/healthservice-evanston/index.html",
                  ),
                );
              },
              title: Text(
                'Evanston Health Service',
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
            Container(
                    margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO),
                    child: Divider()),
            ListTile(
              leading: Icon(
                CommunityMaterialIcons.hospital_box_outline,
                color: NUColors.Purple90,
                size: 30,
              ),
              onTap: () {
                context.pushRoute(
                  PageWebBrowse(
                    url:
                        "https://www.northwestern.edu/healthservice-chicago/index.html",
                  ),
                );
              },
              title: Text(
                'Chicago Health Service',
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
            Container(
                    margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO),
                    child: Divider()),
            ListTile(
              leading: Icon(
                CommunityMaterialIcons.hospital_building,
                color: NUColors.Purple90,
                size: 30,
              ),
              onTap: () {
                context.pushRoute(
                  PageWebBrowse(
                    url: "https://www.nm.org/",
                  ),
                );
              },
              title: Text(
                'Northwestern Medicine',
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
            // Container(
            //         margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO),
            //         child: Divider()),
            // ListTile(
            //   leading: Icon(
            //     Icons.attach_money_rounded,
            //     color: NUColors.Purple90,
            //     size: 30,
            //   ),
            //   onTap: () {
            //     context.pushRoute(PageWebBrowse(
            //       url: 'https://get.cbord.com/northwestern/full/funds_home.php',
            //     ));
            //   },
            //   title: Text(
            //     'Balance Check (GET)',
            //     style: TextStyle(
            //       fontSize: 35.sp,
            //       fontWeight: FontWeight.w500,
            //     ),
            //   ),
            //   trailing: Icon(
            //     Icons.arrow_forward_ios,
            //     size: 30.sp,
            //   ),
            // ),
            // Container(
            //         margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO),
            //         child: Divider()),
            // ListTile(
            //   leading: Icon(
            //     Icons.apps_rounded,
            //     color: NUColors.Purple90,
            //     size: 30,
            //   ),
            //   onTap: () {
            //     context.pushRoute(
            //       PageWebBrowse(
            //           url: "https://dineoncampus.com/northwestern",
            //           jscode: jscodeFaq),
            //     );
            //   },
            //   title: Text(
            //     'More Dining Info >',
            //     style: TextStyle(
            //       fontSize: 35.sp,
            //       fontWeight: FontWeight.w500,
            //     ),
            //   ),
            // ),
            Container(
              height: 20.sp,
            ),
            resourceCard(context, 'Breathe', scriptBreathe,
                'assets/images/breathe-hero.jpg', () {
              context.pushRoute(
                PageBreathe(),
              );
            }),
            // libraryImage(context, 'assets/images/shuttle1440.jpg'),
            // InkWell(
            //   onTap: () => context.pushRoute(PageMapPdf(
            //       title: 'Evanston Campus',
            //       path: 'assets/PDF/shuttle-overview.pdf')),
            //   child: Container(
            //     margin: EdgeInsets.symmetric(
            //         horizontal:
            //             MediaQuery.of(context).size.width * MARGIN_RATIO,
            //         vertical: 15.sp),
            //     child: Text(
            //       "Northwestern Shuttles 2020-2021 >",
            //       style: TextStyle(
            //           fontSize: 30.sp,
            //           fontWeight: FontWeight.bold,
            //           color: NUColors.NUPurple,
            //           fontStyle: FontStyle.italic),
            //     ),
            //   ),
            // ),
            // libraryDescription(
            //     'Northwestern University operates several shuttles for students, faculty, and staff on the Evanston and Chicago campuses. '),
            // routeMap(context, 'Intercampus >', () {
            //   context.pushRoute(PageWebView(
            //     title: 'Intercampus',
            //     url:
            //         'https://www.google.com/maps/d/u/0/viewer?mid=1MkGRPsCy0e7vWkyu_WIWChAepU8',
            //   ));
            // }, Colors.red),
            // routeMap(context, 'Evanston Loop >', () {
            //   context.pushRoute(PageWebView(
            //     title: 'Evanston Loop',
            //     url:
            //         'https://www.google.com/maps/d/u/0/viewer?mid=1Vb6-WLFdIrBg1u2Nqd1kByCeVbU&ll=42.05271836553796%2C-87.6806563&z=15',
            //   ));
            // }, NUColors.NUPurple),
            // routeMap(context, 'Campus Loop >', () {
            //   context.pushRoute(PageWebView(
            //     title: 'Campus Loop',
            //     url:
            //         'https://www.google.com/maps/d/u/0/viewer?mid=1eloZBnx13Ix-B9WyMSqqevospJc&ll=42.05373021645418%2C-87.67500742900472&z=14',
            //   ));
            // }, Colors.green),
          ],
        ),
      ),
    );
  }
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

Widget resourceCard(BuildContext context, String title, String description,
    String path, dynamic route) {
  return InkWell(
    splashColor: NUColors.Purple40,
    onTap: route,
    child: Container(
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO,
          vertical: 15.sp),
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO,
          vertical: 15.sp),
      decoration: BoxDecoration(
        borderRadius: TDKRadii.r10,
        color: Colors.white,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            'assets/images/purple-polygons.png',
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 40.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15.sp),
            height: MediaQuery.of(context).size.width *
                (1 - 2 * MARGIN_RATIO) *
                0.3,
            decoration: BoxDecoration(
              borderRadius: TDKRadii.r10,
              color: Colors.white,
              image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: AssetImage(
                  path,
                ),
              ),
            ),
          ),
          Text(
            description,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    ),
  );
}
