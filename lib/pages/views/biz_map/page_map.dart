import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nu_mobile/router/router.gr.dart';
import 'package:nu_mobile/utils/colors.dart';
import 'package:thindek_ui/thindek_ui.dart';

const String jscodeTech = "document.getElementsByTagName('header')[0].style.display = 'none';" +
    "document.getElementsByTagName('footer')[0].style.display = 'none';" +
    "document.getElementById('more-in-section').style.display = 'none';" +
    "document.getElementById('back-to-top').style.display = 'none';" +
    "document.getElementById('right-col').style.display = 'none';" +
    "document.getElementById('sidebar').style.display = 'none';";

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
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            Container(
              margin:
                  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO, vertical: 15.sp),
              child: Text(
                "Campus Interactive Maps",
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
              margin:
                  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO, vertical: 15.sp),
              child: Text(
                "Building Maps",
                style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
            InkWell(
              onTap: () {
                context.pushRoute(
                  PageWebBrowse(
                      url: 'https://www.mccormick.northwestern.edu/contact/tech-room-finder.html', jscode: jscodeTech),
                );
              },
              child: Container(
                margin:
                    EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO, vertical: 15.sp),
                height: MediaQuery.of(context).size.width * (1 - 2 * MARGIN_RATIO) * 0.2,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.width * (1 - 2 * MARGIN_RATIO) * 0.2,
                      decoration: BoxDecoration(
                        borderRadius: TDKRadii.r10,
                        color: Colors.white,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'assets/images/tech_room_finder.jpeg',
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width * (1 - 2 * MARGIN_RATIO) * 0.2,
                      decoration: BoxDecoration(
                        borderRadius: TDKRadii.r10,
                        color: Color(0xbc4e2a84),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width * (1 - 2 * MARGIN_RATIO) * 0.2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Tech Room Finder',
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
            InkWell(
              onTap: () => context.pushRoute(PageMapTech()),
              child: Container(
                margin:
                    EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO, vertical: 15.sp),
                child: Text(
                  "Technological Institute",
                  style: TextStyle(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                      color: NUColors.NUPurple,
                      fontStyle: FontStyle.italic),
                ),
              ),
            ),
            // Container(
            //   margin:
            //       EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO, vertical: 15.sp),
            //   child: Text(
            //     "Technological Institute (“Tech”) Building",
            //     style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold, color: Colors.black),
            //   ),
            // ),
            // floor(context, 'Basement >', 'Tech Basement', 'assets/PDF/tech/floorB.pdf'),
            // floor(context, 'Ground Floor >', 'Tech Ground Floor', 'assets/PDF/tech/floorG.pdf'),
            // floor(context, 'First Floor >', 'Tech First Floor', 'assets/PDF/tech/floor1.pdf'),
            // floor(context, 'Second Floor >', 'Tech Second Floor', 'assets/PDF/tech/floor2.pdf'),
            // floor(context, 'Third Floor >', 'Tech Third Floor', 'assets/PDF/tech/floor3.pdf'),
            // floor(context, 'Fourth Floor >', 'Tech Fourth Floor', 'assets/PDF/tech/floor4.pdf'),
          ],
        ),
      ),
    );
  }
}

Widget floor(BuildContext context, String title, String mapTitle, String path) {
  return InkWell(
    onTap: () => context.pushRoute(PageMapPdf(title: mapTitle, path: path)),
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO, vertical: 15.sp),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 30.sp, fontWeight: FontWeight.bold, color: NUColors.NUPurple, fontStyle: FontStyle.italic),
      ),
    ),
  );
}
