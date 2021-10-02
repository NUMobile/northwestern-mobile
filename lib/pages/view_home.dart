import 'package:auto_route/auto_route.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nu_mobile/pages/views/biz_news/widget_news.dart';
import 'package:nu_mobile/router/router.gr.dart';
import 'package:nu_mobile/store/model_news.dart';
import 'package:nu_mobile/utils/colors.dart';
import 'package:provider/provider.dart';
import 'package:thindek_ui/thindek_ui.dart';

const String jscodeDirectory =
    "document.getElementsByTagName('header')[0].style.display = 'none';" +
        "document.getElementsByTagName('h1')[0].style.display = 'none';" +
        "document.getElementsByTagName('footer')[0].style.display = 'none';" +
        "document.getElementById('sidebar').style.display = 'none';";

const String jscodeCovid =
    "document.getElementsByTagName('header')[0].style.display = 'none';" +
        "document.getElementsByTagName('h1')[0].style.display = 'none';" +
        "document.getElementsByTagName('footer')[0].style.display = 'none';" +
        "document.getElementById('breadcrumbs').style.display = 'none';";

class ViewHome extends StatefulWidget {
  const ViewHome({Key? key}) : super(key: key);

  @override
  _ViewHomeState createState() => _ViewHomeState();
}

class _ViewHomeState extends State<ViewHome>
    with AutomaticKeepAliveClientMixin {
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: MediaQuery.of(context).size.width * 0.05,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Container(
          height: MediaQuery.of(context).size.width * 0.07,
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              alignment: AlignmentDirectional.centerStart,
              fit: BoxFit.contain,
              image: AssetImage(
                'assets/images/nulogo.png',
              ),
            ),
          ),
        ),
      ),
      body: TabPageNewsNow(),
    );
  }
}

class TabPageNewsNow extends StatefulWidget {
  @override
  _TabPageNewsNowState createState() => _TabPageNewsNowState();
}

class _TabPageNewsNowState extends State<TabPageNewsNow> {
  final EasyRefreshController _controller = EasyRefreshController();

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsModel>(builder: (context, model, child) {
      return EasyRefresh(
          enableControlFinishRefresh: true,
          controller: _controller,
          header: BallPulseHeader(color: NUColors.NUPurple),
          onRefresh: () async {
            await model.fetchNewsNow();
            _controller.finishRefresh();
          },
          child: ListView(
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.width *
                        (1 - 2 * MARGIN_RATIO) *
                        0.4,
                    decoration: BoxDecoration(
                      borderRadius: TDKRadii.r0,
                      color: Colors.white,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          'assets/images/uhall14402.jpg',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // Row(
              //   children: [
              //     TextButton.icon(
              //       icon: Icon(
              //         Icons.local_library,
              //         color: Colors.white,
              //       ),
              //       onPressed: () {},
              //       style: TextButton.styleFrom(backgroundColor: NUColors.NUPurple),
              //       label: Text(
              //         'Libaray',
              //         style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold, color: Colors.white),
              //       ),
              //     )
              //   ],
              // ),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal:
                        MediaQuery.of(context).size.width * MARGIN_RATIO,
                    vertical: 15.sp),
                child: Text(
                  "Take a Northwestern Direction",
                  style: TextStyle(
                      fontSize: 40.sp,
                      fontWeight: FontWeight.bold,
                      color: NUColors.NUPurple),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.width * 0.4,
                child: Wrap(
                  direction: Axis.horizontal,
                  children: [
                    homeButton(context, 'Maps', 'Northwestern Maps', () {
                      context.pushRoute(PageMap());
                    }, CommunityMaterialIcons.compass),
                    homeButton(context, 'Shuttles', 'Campus Shuttles', () {
                      context.pushRoute(PageShuttles());
                    }, Icons.directions_bus_rounded),
                    homeButton(context, 'Parking', 'Parking Locations', () {
                      context.pushRoute(PageParking());
                    }, Icons.garage_rounded),
                    homeButton(context, 'Library', 'Visit all Libraries', () {
                      context.pushRoute(PageLibrary());
                    }, Icons.account_balance_rounded),
                    homeButton(context, 'Directory', 'Browse Offices', () {
                      context.pushRoute(
                        PageWebView(
                          title: 'Browse Departments',
                          url: "https://offices.northwestern.edu",
                          jscode: jscodeDirectory,
                        ),
                      );
                    }, Icons.find_in_page_rounded),
                    homeButton(context, 'Dining', 'Places to Eat', () {
                      context.pushRoute(
                        PageWebBrowse(
                          url: "https://dineoncampus.com/northwestern",
                        ),
                      );
                    }, Icons.dining),
                    homeButton(
                      context,
                      'Recreation',
                      'Northwestern Recreation',
                      () {
                        context.pushRoute(PageRecreation());
                      },
                      Icons.accessibility_new_rounded,
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  context.pushRoute(
                    PageWebView(
                      title: 'COVID-19 Dashboard',
                      url:
                          "https://www.northwestern.edu/coronavirus-covid-19-updates/university-status/dashboard/index.html",
                      jscode: jscodeCovid,
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 15.sp),
                  height: MediaQuery.of(context).size.width *
                      (1 - 2 * MARGIN_RATIO) *
                      0.15,
                  child: Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.width *
                            (1 - 2 * MARGIN_RATIO) *
                            0.15,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              'assets/images/purple-polygons.png',
                            ),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 120.sp,
                        child: Text(
                          'COVID-19 and Campus Updates >',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal:
                        MediaQuery.of(context).size.width * MARGIN_RATIO,
                    vertical: 15.sp),
                child: Text(
                  "Northwestern Now",
                  style: TextStyle(
                      fontSize: 40.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              model.rssItemListNow != null
                  ? ListView.separated(
                      separatorBuilder: (BuildContext context, int index) =>
                          Container(
                        height: 10.sp,
                      ),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: model.rssItemListNow.length,
                      itemBuilder: (BuildContext context, int index) {
                        return nuNewsCard(index, context, model.rssItemListNow);
                      },
                    )
                  : Center(
                      child: Column(
                      children: [
                        Text('Loading...'),
                        Text('Pull down to Refresh'),
                      ],
                    )),
            ],
          ));
    });
  }

  Widget homeButton(BuildContext context, String title, String description,
      dynamic route, IconData icon) {
    return InkWell(
      onTap: route,
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO * 1.3,
            vertical: 15.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 15.sp, horizontal: 30.sp),
              margin: EdgeInsets.only(bottom: 10.sp),
              decoration: BoxDecoration(
                  color: NUColors.Purple10,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Icon(
                icon,
                size: 70.sp,
                color: NUColors.NUPurple,
              ),
            ),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold,
                  color: NUColors.NUPurple),
            ),
          ],
        ),
      ),
    );
  }

  Widget directionButton(BuildContext context, String title, String description,
      dynamic route, IconData icon) {
    return InkWell(
      onTap: route,
      child: Container(
        // width: MediaQuery.of(context).size.width * 0.35,
        decoration: BoxDecoration(
            color: NUColors.Purple10,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO,
            vertical: 15.sp),
        padding: EdgeInsets.all(20.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  icon,
                  size: 40.sp,
                  color: NUColors.NUPurple,
                ),
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 40.sp,
                      fontWeight: FontWeight.bold,
                      color: NUColors.NUPurple),
                ),
              ],
            ),
            Text(
              description,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 20.sp, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
