import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nu_mobile/router/router.gr.dart';
import 'package:nu_mobile/utils/colors.dart';
import 'package:thindek_ui/thindek_ui.dart';

const String scriptBreathe =
    'Breathe is a stress management resource, created purposely for NU students. In Breathe, you will find a variety of guided meditations and breathing practices to help you deal with stress.';

class TabPageResources extends StatefulWidget {
  const TabPageResources({Key? key}) : super(key: key);

  @override
  _TabPageResourcesState createState() => _TabPageResourcesState();
}

class _TabPageResourcesState extends State<TabPageResources> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                resourceTitle(context, 'Health Service'),
                Container(
                  height: MediaQuery.of(context).size.width * 0.2,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      resourceButton(context, 'Directory', 'Browse Offices', () {
                        context.pushRoute(
                          PageWebView(
                            title: 'Browse Departments',
                            url: "https://offices.northwestern.edu",
                          ),
                        );
                      }),
                      resourceButton(context, 'Library', 'Visit all Libraries', () {
                        context.pushRoute(PageLibrary());
                      }),
                      resourceButton(context, 'Maps', 'Northwestern Maps', () {
                        context.pushRoute(PageMap());
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
          resourceCard(context, 'Breathe', scriptBreathe, 'assets/images/breathe-hero.jpg'),
        ],
      ),
    );
  }
}

Widget resourceCard(BuildContext context, String title, String description, String path) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO, vertical: 15.sp),
    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO, vertical: 15.sp),
    decoration: BoxDecoration(
      borderRadius: TDKRadii.r10,
      color: NUColors.Purple10,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold, color: NUColors.NUPurple),
        ),
        Container(
          height: MediaQuery.of(context).size.width * (1 - 2 * MARGIN_RATIO) * 0.3,
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
        Text(description),
      ],
    ),
  );
}

Widget resourceTitle(BuildContext context, String title) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO, vertical: 15.sp),
    child: Text(
      title,
      style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold, color: Colors.black),
    ),
  );
}

Widget resourceButton(BuildContext context, String title, String description, dynamic route) {
  return InkWell(
    onTap: route,
    child: Container(
      decoration: BoxDecoration(color: NUColors.Purple10, borderRadius: BorderRadius.all(Radius.circular(10))),
      margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO, vertical: 15.sp),
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * MARGIN_RATIO),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold, color: NUColors.NUPurple),
          ),
          Text(
            description,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 20.sp, color: Colors.black),
          )
        ],
      ),
    ),
  );
}
