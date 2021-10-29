import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nu_mobile/router/router.gr.dart';
import 'package:nu_mobile/utils/colors.dart';
import 'package:thindek_ui/thindek_ui.dart';

class PageShuttles extends StatefulWidget {
  const PageShuttles({Key? key}) : super(key: key);

  @override
  _PageShuttlesState createState() => _PageShuttlesState();
}

class _PageShuttlesState extends State<PageShuttles> {
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
          'Shuttles',
          style: TextStyle(
            color: NUColors.Purple80,
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            libraryTitle(context, 'NU Shuttle Tracker'),
            ListTile(
              leading: Icon(
                Icons.bus_alert,
                color: Colors.red,
                size: 30,
              ),
              onTap: () {
                context.pushRoute(
                  PageShuttlesIC(),
                );
              },
              title: Text(
                'IC: Intercampus',
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
                Icons.bus_alert,
                color: NUColors.Purple90,
                size: 30,
              ),
              onTap: () {
                context.pushRoute(
                  PageShuttlesEL(),
                );
              },
              title: Text(
                'EL: Evanston Loop',
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
                Icons.bus_alert,
                color: Colors.green,
                size: 30,
              ),
              onTap: () {
                context.pushRoute(
                  PageShuttlesCL(),
                );
              },
              title: Text(
                'CL: Campus Loop',
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
                Icons.apps_rounded,
                color: Colors.blueGrey,
                size: 30,
              ),
              onTap: () {
                context.pushRoute(
                  PageWebBrowse(url: "https://northwestern.transloc.com/m/"),
                );
              },
              title: Text(
                'More Shuttles Info >',
                style: TextStyle(
                  fontSize: 35.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              height: 20.sp,
            ),
            libraryTitle(context, 'Route Maps'),
            libraryImage(context, 'assets/images/shuttle1440.jpg'),
            InkWell(
              onTap: () => context.pushRoute(PageMapPdf(
                  title: 'Evanston Campus',
                  path: 'assets/PDF/shuttle-overview.pdf')),
              child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal:
                        MediaQuery.of(context).size.width * MARGIN_RATIO,
                    vertical: 15.sp),
                child: Text(
                  "Northwestern Shuttles 2020-2021 >",
                  style: TextStyle(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                      color: NUColors.NUPurple,
                      fontStyle: FontStyle.italic),
                ),
              ),
            ),
            libraryDescription(
                'Northwestern University operates several shuttles for students, faculty, and staff on the Evanston and Chicago campuses. '),
            routeMap(context, 'Intercampus >', () {
              context.pushRoute(PageWebView(
                title: 'Intercampus',
                url:
                    'https://www.google.com/maps/d/u/0/viewer?mid=1MkGRPsCy0e7vWkyu_WIWChAepU8',
              ));
            }, Colors.red),
            routeMap(context, 'Evanston Loop >', () {
              context.pushRoute(PageWebView(
                title: 'Evanston Loop',
                url:
                    'https://www.google.com/maps/d/u/0/viewer?mid=1Vb6-WLFdIrBg1u2Nqd1kByCeVbU&ll=42.05271836553796%2C-87.6806563&z=15',
              ));
            }, NUColors.NUPurple),
            routeMap(context, 'Campus Loop >', () {
              context.pushRoute(PageWebView(
                title: 'Campus Loop',
                url:
                    'https://www.google.com/maps/d/u/0/viewer?mid=1eloZBnx13Ix-B9WyMSqqevospJc&ll=42.05373021645418%2C-87.67500742900472&z=14',
              ));
            }, Colors.green),
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
