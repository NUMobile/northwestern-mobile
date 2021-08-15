import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nu_mobile/router/router.gr.dart';
import 'package:nu_mobile/utils/colors.dart';
import 'package:thindek_ui/thindek_ui.dart';

const String jscodeLibraryMap = "document.getElementsByTagName('header')[0].style.display = 'none';" +
    "document.getElementById('breadcrumbs',).style.display = 'none';" +
    "document.getElementsByClassName('sorting-row')[0].style.display = 'none';" +
    "document.getElementById('building-map-control',).style.margin = '0';" +
    "document.getElementsByTagName('footer')[0].style.display = 'none';" +
    "document.getElementsByTagName('h2')[1].style.display = 'none';";

const String ULScript =
    'The University Library, designed by architect Walter Netsch, has served as the main Evanston campus library since 1970. With approximately 800,000 visitors annually, the Main Library is one of the busiest buildings on Northwestern’s Evanston campus.';

const String DLScript =
    'The Charles Deering Memorial Library is a campus architectural landmark designed by James Gamble Rogers. Built in 1933, it was modeled after King\'s College Chapel in Cambridge, England. Deering Library served as the library\'s main library until 1970 and now houses several distinctive collections. The library was named for Charles H. Deering, a Northwestern benefactor and a patron to the arts.';

const String MULScript =
    'Located on North Campus, the Seeley G. Mudd Library is designed with collaboration in mind. The space provides an array of digital assets and tools that are consistent with Mudd\'s tech-focused history. Private and communal areas allow for many study space options, and library experts are available to assist in a variety of fields, such as engineering, math and life, physical and computer sciences.';

const String MALScript =
    'The Boas Mathematics Library has a research collection in pure mathematics and statistics of approximately 34,000 volumes. The library serves primarily Northwestern\'s Mathematics Department and Statistics Department as well as the NU community. It is named in honor of the late professor Ralph P. Boas, distinguished mathematician and former executive editor of the Mathematical Reviews, the world\'s leading index to mathematical publications.';

const String SLScript =
    'The Joseph Schaffner Library is located on Northwestern University\'s Chicago Campus. Schaffner Library provides library and information services for the Kellogg School of Management, the School of Professional Studies, the Osher Lifelong Learning Institute and other Chicago-based members of the Northwestern community. Many services and programs are designed for part-time students.';

class PageLibraryMapList extends StatefulWidget {
  const PageLibraryMapList({Key? key}) : super(key: key);

  @override
  _PageLibraryMapListState createState() => _PageLibraryMapListState();
}

class _PageLibraryMapListState extends State<PageLibraryMapList> {
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
          'Library Directions',
          style: TextStyle(
            color: NUColors.Purple80,
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            libraryTitle(context, 'University Library'),
            libraryImage(context, 'assets/images/UL.jpeg'),
            libraryDescription(ULScript),
            levelMap(context, 'Lower Level >', () {
              context.pushRoute(PageWebView(
                  title: 'University Library',
                  url: 'https://www.library.northwestern.edu/visit/maps/university-library-lower-level/index.html',
                  description: 'Lower Level',
                  jscode: jscodeLibraryMap));
            }),
            levelMap(context, 'Level 1 >', () {
              context.pushRoute(PageWebView(
                  title: 'University Library',
                  url: 'https://www.library.northwestern.edu/visit/maps/university-library-level-1/index.html',
                  description: 'Level 1',
                  jscode: jscodeLibraryMap));
            }),
            levelMap(context, 'Level 2 >', () {
              context.pushRoute(PageWebView(
                  title: 'University Library',
                  url: 'https://www.library.northwestern.edu/visit/maps/university-library-level-2/index.html',
                  description: 'Level 2',
                  jscode: jscodeLibraryMap));
            }),
            levelMap(context, 'Level 3 >', () {
              context.pushRoute(PageWebView(
                  title: 'University Library',
                  url: 'https://www.library.northwestern.edu/visit/maps/university-library-level-3/index.html',
                  description: 'Level 3',
                  jscode: jscodeLibraryMap));
            }),
            levelMap(context, 'Level 4 >', () {
              context.pushRoute(PageWebView(
                  title: 'University Library',
                  url: 'https://www.library.northwestern.edu/visit/maps/university-library-level-4/index.html',
                  description: 'Level 4',
                  jscode: jscodeLibraryMap));
            }),
            levelMap(context, 'Level 5 >', () {
              context.pushRoute(PageWebView(
                  title: 'University Library',
                  url: 'https://www.library.northwestern.edu/visit/maps/university-library-level-5/index.html',
                  description: 'Level 5',
                  jscode: jscodeLibraryMap));
            }),
            libraryTitle(context, 'Deering Library'),
            libraryImage(context, 'assets/images/DL.jpeg'),
            libraryDescription(DLScript),
            levelMap(context, 'Level 1 >', () {
              context.pushRoute(PageWebView(
                  title: 'Deering Library',
                  url: 'https://www.library.northwestern.edu/visit/maps/deering-library-level-1/index.html',
                  description: 'Level 1',
                  jscode: jscodeLibraryMap));
            }),
            levelMap(context, 'Level 2 >', () {
              context.pushRoute(PageWebView(
                  title: 'Deering Library',
                  url: 'https://www.library.northwestern.edu/visit/maps/deering-library-level-2/index.html',
                  description: 'Level 2',
                  jscode: jscodeLibraryMap));
            }),
            levelMap(context, 'Level 3 >', () {
              context.pushRoute(PageWebView(
                  title: 'Deering Library',
                  url: 'https://www.library.northwestern.edu/visit/maps/deering-library-level-3/index.html',
                  description: 'Level 3',
                  jscode: jscodeLibraryMap));
            }),
            libraryTitle(context, 'Mudd Library'),
            libraryImage(context, 'assets/images/MUL.jpeg'),
            libraryDescription(MULScript),
            levelMap(context, 'Level 2 >', () {
              context.pushRoute(PageWebView(
                  title: 'Mudd Library',
                  url: 'https://www.library.northwestern.edu/visit/maps/mudd-library/index.html',
                  description: 'Level 2',
                  jscode: jscodeLibraryMap));
            }),
            libraryTitle(context, 'Math Library'),
            libraryImage(context, 'assets/images/MAL.jpeg'),
            libraryDescription(MALScript),
            levelMap(context, 'Level 1 >', () {
              context.pushRoute(PageWebView(
                  title: 'Math Library',
                  url: 'https://www.library.northwestern.edu/visit/maps/math-library/index.html',
                  description: 'Level 1',
                  jscode: jscodeLibraryMap));
            }),
            libraryTitle(context, 'Schaffner Library'),
            libraryImage(context, 'assets/images/SL.jpeg'),
            libraryDescription(SLScript),
            levelMap(context, 'Level 2 >', () {
              context.pushRoute(PageWebView(
                  title: 'Schaffner Library',
                  url: 'https://www.library.northwestern.edu/visit/maps/schaffner-library/index.html',
                  description: 'Wieboldt Hall Level 2',
                  jscode: jscodeLibraryMap));
            }),
          ],
        ),
      ),
    );
  }

  Widget libraryImage(BuildContext context, String path) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO, vertical: 15.sp),
      height: MediaQuery.of(context).size.width * (1 - 2 * MARGIN_RATIO) * 0.4,
      child: Container(
        height: MediaQuery.of(context).size.width * (1 - 2 * MARGIN_RATIO) * 0.4,
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
      margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO, vertical: 15.sp),
      child: Text(description),
    );
  }

  Container libraryTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO, vertical: 30.sp),
      child: Text(
        title,
        style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }

  Widget levelMap(BuildContext context, String level, dynamic route) {
    return InkWell(
      onTap: route,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO, vertical: 15.sp),
        child: Text(
          level,
          style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.w600, color: NUColors.NUPurple),
        ),
      ),
    );
  }
}
