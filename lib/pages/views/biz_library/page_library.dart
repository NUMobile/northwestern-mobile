import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nu_mobile/router/router.gr.dart';
import 'package:nu_mobile/utils/colors.dart';
import 'package:thindek_ui/thindek_ui.dart';

const String jscodeLibraryHours = "document.getElementsByTagName('header')[0].style.display = 'none';" +
    "document.getElementById('breadcrumbs',).style.display = 'none';" +
    "document.getElementById('tab-header',).style.display = 'none';" +
    "document.getElementById('page',).style.margin = '0';" +
    "document.getElementsByTagName('footer')[0].style.display = 'none';";

class PageLibrary extends StatefulWidget {
  const PageLibrary({Key? key}) : super(key: key);

  @override
  _PageLibraryState createState() => _PageLibraryState();
}

class _PageLibraryState extends State<PageLibrary> {
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
          'Libraries',
          style: TextStyle(
            color: NUColors.Purple80,
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            GestureDetector(
              child: Container(
                margin:
                    EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO, vertical: 15.sp),
                child: Text(
                  "Building Maps",
                  style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
            ),
            InkWell(
              onTap: () => context.pushRoute(PageLibraryMapList()),
              child: Container(
                margin:
                    EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO, vertical: 15.sp),
                height: MediaQuery.of(context).size.width * (1 - 2 * MARGIN_RATIO) * 0.4,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.width * (1 - 2 * MARGIN_RATIO) * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: TDKRadii.r10,
                        color: Colors.white,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'assets/images/our-places.jpg',
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width * (1 - 2 * MARGIN_RATIO) * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: TDKRadii.r10,
                        color: Color(0xbc4e2a84),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width * (1 - 2 * MARGIN_RATIO) * 0.4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Campus',
                            style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                          Text(
                            'Find Library >',
                            style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin:
                  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO, vertical: 15.sp),
              child: Text(
                "Building Hours",
                style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
            InkWell(
              onTap: () => context.pushRoute(
                PageWebView(
                    title: 'Building Hours',
                    url: "https://www.library.northwestern.edu/visit/hours/index.html",
                    jscode: jscodeLibraryHours),
              ),
              child: Container(
                margin:
                    EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO, vertical: 15.sp),
                height: MediaQuery.of(context).size.width * (1 - 2 * MARGIN_RATIO) * 0.4,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.width * (1 - 2 * MARGIN_RATIO) * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: TDKRadii.r10,
                        color: Colors.white,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'assets/images/libraries.jpg',
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width * (1 - 2 * MARGIN_RATIO) * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: TDKRadii.r10,
                        color: Color(0xbc4e2a84),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width * (1 - 2 * MARGIN_RATIO) * 0.4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Open Hours for Specific Library',
                            style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                          Text(
                            'View Today\'s Hours >',
                            style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
