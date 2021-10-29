import 'package:auto_route/auto_route.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nu_mobile/router/router.gr.dart';
import 'package:nu_mobile/utils/colors.dart';
import 'package:thindek_ui/thindek_ui.dart';

const String scriptBreathe =
    'Breathe is a stress management resource, created purposely for NU students. In Breathe, you will find a variety of guided meditations and breathing practices to help you deal with stress.';

const String jscodeCollections =
    "document.getElementsByTagName('header')[0].style.display = 'none';" +
        "document.getElementsByTagName('footer')[0].style.display = 'none';";

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
          /// Athletics
          resourceTitle(context, 'Athletics'),
          Container(
            child: Container(
              height: MediaQuery.of(context).size.width * 0.2,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  resourceButton(context, 'Schedule', 'Calendar', () {
                    context.pushRoute(
                      PageWebBrowse(
                        url:
                            "https://nusports.com/calendar?date=10/3/2021&vtype=list",
                      ),
                    );
                  }, CommunityMaterialIcons.calendar_star),
                  resourceButton(context, 'Tickets', 'Event List', () {
                    context.pushRoute(
                      PageWebBrowse(
                        url:
                            "https://nusports.evenue.net/cgi-bin/ncommerce3/SEGetGroupList?groupCode=NW&linkID=nwu&shopperContext=&caller=&appCode=",
                      ),
                    );
                  }, CommunityMaterialIcons.ticket),
                  resourceButton(context, 'My Account', 'Manage My Account',
                      () {
                    context.pushRoute(
                      PageWebBrowse(
                        url:
                            "https://nusports.evenue.net/cgi-bin/ncommerce3/EVExecMacro?linkID=nwu&evm=myac&entry=DisplayGroupList.html&url=https%3A//ev10.evenue.net/cgi-bin/ncommerce3/SEGetGroupList%3FgroupCode%3DNW%26linkID%3Dnwu%26shopperContext%3D%26caller%3D%26appCode%3D",
                      ),
                    );
                  }, CommunityMaterialIcons.ticket_account),
                ],
              ),
            ),
          ),

          /// Music & Performing Arts
          resourceTitle(context, 'Music & Performing Arts'),
          Container(
            child: Container(
              height: MediaQuery.of(context).size.width * 0.2,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  resourceButton(context, 'Music Events', 'Concerts & Events',
                      () {
                    context.pushRoute(
                      PageWebBrowse(
                        jscode: jscodeCollections,
                        url:
                            "https://www.music.northwestern.edu/events/calendar",
                      ),
                    );
                  }, CommunityMaterialIcons.bookmark_music),
                  resourceButton(context, 'Performances', '2021-2022 Season',
                      () {
                    context.pushRoute(
                      PageWebBrowse(
                        jscode: jscodeCollections,
                        url: "https://wirtz.northwestern.edu/2021-2022-season/",
                      ),
                    );
                  }, CommunityMaterialIcons.theater),
                ],
              ),
            ),
          ),

          /// Block Museum
          resourceTitle(context, 'Block Museum'),
          Container(
            child: Container(
              height: MediaQuery.of(context).size.width * 0.2,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  resourceButton(context, 'Exhibitions', 'Current Exhibitions',
                      () {
                    context.pushRoute(
                      PageWebBrowse(
                        jscode: jscodeCollections,
                        url:
                            "https://www.blockmuseum.northwestern.edu/exhibitions/index.html#2021",
                      ),
                    );
                  }, CommunityMaterialIcons.artstation),
                  resourceButton(context, 'Artworks', 'All Artworks', () {
                    context.pushRoute(
                      PageWebBrowse(
                        jscode: jscodeCollections,
                        url: "https://blockmuseum.emuseum.com/objects/images",
                      ),
                    );
                  }, CommunityMaterialIcons.format_paint),
                  resourceButton(context, 'Artists', 'All Artists', () {
                    context.pushRoute(
                      PageWebBrowse(
                        jscode: jscodeCollections,
                        url: "https://blockmuseum.emuseum.com/people",
                      ),
                    );
                  }, CommunityMaterialIcons.palette),
                ],
              ),
            ),
          ),
          resourceTitle(context, 'More to Explore...'),
        ],
      ),
    );
  }
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

Widget resourceTitle(BuildContext context, String title) {
  return Container(
    margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO,
        vertical: 20.sp),
    child: Text(
      title,
      style: TextStyle(
          fontSize: 40.sp, fontWeight: FontWeight.bold, color: Colors.black),
    ),
  );
}

Widget resourceButton(BuildContext context, String title, String description,
    dynamic route, IconData icon) {
  return InkWell(
    highlightColor: Colors.transparent,
    splashColor: NUColors.Purple40,
    onTap: route,
    child: Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          decoration: BoxDecoration(
            color: NUColors.Purple10,
            // image: DecorationImage(
            //   fit: BoxFit.cover,
            //   image: AssetImage(
            //     'assets/images/purple-polygons.png',
            //   ),
            // ),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * MARGIN_RATIO,
              top: 15.sp,
              bottom: 15.sp),
          padding:
              EdgeInsets.all(MediaQuery.of(context).size.width * MARGIN_RATIO),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 40.sp,
                    fontWeight: FontWeight.bold,
                    color: NUColors.NUPurple),
              ),
              Text(
                description,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 20.sp, color: Colors.blueGrey),
              )
            ],
          ),
        ),
        Icon(
          icon,
          color: NUColors.Purple90,
          size: 60.sp,
        ),
      ],
    ),
  );
}
