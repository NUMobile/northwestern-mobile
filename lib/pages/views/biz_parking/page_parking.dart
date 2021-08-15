import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nu_mobile/router/router.gr.dart';
import 'package:nu_mobile/utils/colors.dart';
import 'package:thindek_ui/thindek_ui.dart';

const String jscodeParking = "document.getElementsByTagName('header')[0].style.display = 'none';" +
    "document.getElementsByTagName('h1')[0].style.display = 'none';" +
    "document.getElementsByTagName('footer')[0].style.display = 'none';" +
    "document.getElementById('breadcrumbs').style.display = 'none';";

class PageParking extends StatefulWidget {
  const PageParking({Key? key}) : super(key: key);

  @override
  _PageParkingState createState() => _PageParkingState();
}

class _PageParkingState extends State<PageParking> {
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
          'Parking',
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
              "Parking Maps",
              style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
          InkWell(
            onTap: () => context.pushRoute(PageWebView(
                title: 'Evanston Parking',
                url: 'https://www.northwestern.edu/transportation-parking/evanston-parking/parking-map/index.html',
                jscode: jscodeParking)),
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
                          'assets/images/segal-center.jpg',
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
                          'Evanston Parking >',
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
            onTap: () => context.pushRoute(PageWebView(
                title: 'Parking Garage Locations',
                jscode: jscodeParking,
                url:
                    'https://www.northwestern.edu/transportation-parking/chicago-parking/parking-garage-locations.html')),
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
                          'assets/images/chicago-hero.jpg',
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
                          'Chicago Parking >',
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
