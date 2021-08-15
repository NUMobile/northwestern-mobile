import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nu_mobile/router/router.gr.dart';
import 'package:nu_mobile/utils/colors.dart';
import 'package:thindek_ui/thindek_ui.dart';

class PageMap extends StatefulWidget {
  const PageMap({Key? key}) : super(key: key);

  @override
  _PageMapState createState() => _PageMapState();
}

class _PageMapState extends State<PageMap> {
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
          'Maps',
          style: TextStyle(
            color: NUColors.Purple80,
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO, vertical: 15.sp),
            child: Text(
              "Interactive Maps",
              style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
          InkWell(
            onTap: () => context.pushRoute(PageWebBrowse(url: 'https://maps.northwestern.edu/evanston')),
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
                          'Evanston Campus >',
                          style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () => context.pushRoute(PageWebBrowse(url: 'https://maps.northwestern.edu/chicago')),
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
                          'assets/images/chicago-sm.jpg',
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
                          'Chicago Campus >',
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
            margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO, vertical: 15.sp),
            child: Text(
              "Printable Maps (PDF View)",
              style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
          InkWell(
            onTap: () => context.pushRoute(PageMapPdf(title: 'Evanston Campus', path: 'assets/PDF/EV_campusmap.pdf')),
            child: Container(
              margin:
                  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO, vertical: 15.sp),
              child: Text(
                "Evanston Campus Map",
                style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                    color: NUColors.NUPurple,
                    fontStyle: FontStyle.italic),
              ),
            ),
          ),
        ],
      ),
    );
  }
}