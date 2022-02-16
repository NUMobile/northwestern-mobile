import 'package:auto_route/auto_route.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nu_mobile/pages/modules/biz_resources/tab_page_resources.dart';
import 'package:nu_mobile/utils/colors.dart';
import 'package:thindek_ui/thindek_ui.dart';

import '../../router/router.gr.dart';

class ViewDiscover extends StatefulWidget {
  // final ScrollController scrollController;
  const ViewDiscover({Key? key}) : super(key: key);

  @override
  _ViewDiscoverState createState() => _ViewDiscoverState();
}

class _ViewDiscoverState extends State<ViewDiscover>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final ScrollController scrollController = ScrollController();
  final ChromeSafariBrowser browser = ChromeSafariBrowser();
  bool showToTop = false;

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (scrollController.hasClients) {
        var shouldScrollTop = false;
        if (scrollController.offset >= (150) &&
            !scrollController.position.outOfRange) {
          shouldScrollTop = true;
        }
        setState(() {
          showToTop = shouldScrollTop;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  _jumpToTop() {
    scrollController.animateTo(0.0,
        duration: Duration(milliseconds: 500), curve: Curves.decelerate);
    // _scrollController.jumpTo(1);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: MediaQuery.of(context).size.width * 0.05,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Onboarding',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 60.sp,
              color: NUColors.NUPurple),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            // buildCupertinoButton(
            //     context,
            //     'Get Started',
            //     () {},
            //     DecorationImage(
            //       image: AssetImage("assets/images/ill2.png"),
            //       fit: BoxFit.cover,
            //     )),
            buildCupertinoButton(context, 'Northwestern Traditions', () async {
              await browser.open(
                  url: Uri.parse(
                      "https://www.northwestern.edu/studentaffairs/community/students/traditions.html"),
                  options: ChromeSafariBrowserClassOptions(
                      android: AndroidChromeCustomTabsOptions(
                          addDefaultShareMenuItem: false),
                      ios: IOSSafariOptions(barCollapsingEnabled: true)));
            },
                DecorationImage(
                  image: AssetImage("assets/images/ill1.png"),
                  fit: BoxFit.cover,
                )),
            buildCupertinoButton(context, 'Student Organizations', () async {
              await browser.open(
                  url: Uri.parse(
                      "https://northwestern.campuslabs.com/engage/organizations"),
                  options: ChromeSafariBrowserClassOptions(
                      android: AndroidChromeCustomTabsOptions(
                          addDefaultShareMenuItem: false),
                      ios: IOSSafariOptions(barCollapsingEnabled: true)));
            },
                DecorationImage(
                  image: AssetImage("assets/images/ill3.png"),
                  fit: BoxFit.cover,
                )),

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
                          url:
                              "https://wirtz.northwestern.edu/2021-2022-season/",
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
                    resourceButton(
                        context, 'Exhibitions', 'Current Exhibitions', () {
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
      ),
      floatingActionButton: showToTop
          ? FloatingActionButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)),
              backgroundColor: NUColors.NUPurple,
              child: Icon(
                Icons.keyboard_arrow_up,
                size: 40,
              ),
              onPressed: () {
                _jumpToTop();
              },
            )
          : null,
    );
  }

  CupertinoButton categoryButton(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {},
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.width * 0.3,
            width: MediaQuery.of(context).size.width * 0.45,
            decoration: BoxDecoration(
              borderRadius: TDKRadii.r10,
              color: Colors.white,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/images/DL.jpeg',
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.width * 0.3,
            width: MediaQuery.of(context).size.width * 0.45,
            decoration: BoxDecoration(
                borderRadius: TDKRadii.r10,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xffff2d55), Colors.white.withOpacity(0.4)],
                )),
          ),
          // Container(
          //   height: MediaQuery.of(context).size.width * 0.3,
          //   width: MediaQuery.of(context).size.width * 0.45,
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage("assets/images/cl_gradient.png"),
          //       fit: BoxFit.cover,
          //     ),
          //     borderRadius: BorderRadius.circular(12),
          //   ),
          // ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(15, 15, 0, 0),
                child: Text(
                  "Mindfulness",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.sp,
                      fontWeight: FontWeight.w600),
                ),
              ),
              // Container(
              //   margin: EdgeInsets.fromLTRB(15, 5, 0, 0),
              //   child: Text(
              //     "Mindfulness",
              //     style: TextStyle(
              //         color: Colors.white,
              //         fontSize: 30.sp,
              //         fontWeight: FontWeight.w600),
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }

  CupertinoButton buildCupertinoButton(
    BuildContext context,
    String title,
    dynamic function,
    DecorationImage image,
  ) {
    return CupertinoButton(
      onPressed: function,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.width * 0.3,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              image: image,
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.width * 0.1,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              border: Border.all(
                color: NUColors.NUPurple,
                width: 0.5,
              ),
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(12)),
            ),
            child: Container(
              margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
