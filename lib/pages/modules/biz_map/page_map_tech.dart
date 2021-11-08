import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nu_mobile/utils/colors.dart';

class PageMapTech extends StatefulWidget {
  @override
  _PageMapTechState createState() => _PageMapTechState();
}

class _PageMapTechState extends State<PageMapTech> {
  bool _isLoading = true;
  String _sign = 'First Floor';
  late PDFDocument document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    document = await PDFDocument.fromAsset('assets/PDF/tech/floor1.pdf');

    setState(() => _isLoading = false);
  }

  changePDF(value) async {
    setState(() => _isLoading = true);
    if (value == 'B') {
      document = await PDFDocument.fromAsset('assets/PDF/tech/floorB.pdf');
    }
    // else if (value == 2) {
    //   document = await PDFDocument.fromURL(
    //     "http://conorlastowka.com/book/CitationNeededBook-Sample.pdf",
    //     /* cacheManager: CacheManager(
    //       Config(
    //         "customCacheKey",
    //         stalePeriod: const Duration(days: 2),
    //         maxNrOfCacheObjects: 10,
    //       ),
    //     ), */
    //   );
    // }
    else if (value == 'G') {
      document = await PDFDocument.fromAsset('assets/PDF/tech/floorG.pdf');
    } else if (value == 1) {
      document = await PDFDocument.fromAsset('assets/PDF/tech/floor1.pdf');
    } else if (value == 2) {
      document = await PDFDocument.fromAsset('assets/PDF/tech/floor2.pdf');
    } else if (value == 3) {
      document = await PDFDocument.fromAsset('assets/PDF/tech/floor3.pdf');
    } else if (value == 4) {
      document = await PDFDocument.fromAsset('assets/PDF/tech/floor4.pdf');
    } else {
      document = await PDFDocument.fromAsset('assets/PDF/tech/floor1.pdf');
    }
    setState(() => _isLoading = false);
  }

  void _closeDrawer() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: Column(
          children: <Widget>[
            SizedBox(height: 36),
            ListTile(
              title: Text(
                'Tech Room Finder',
                style: TextStyle(color: NUColors.NUPurple, fontWeight: FontWeight.bold, fontSize: 45.sp),
              ),
            ),
            ListTile(
              title: Text('Basement'),
              onTap: () {
                changePDF('B');
                setState(() => _sign = 'Basement');
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text('Ground Floor'),
              onTap: () {
                changePDF('G');
                setState(() => _sign = 'Ground Floor');
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text('First Floor'),
              onTap: () {
                changePDF(1);
                setState(() => _sign = 'First Floor');
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text('Second Floor'),
              onTap: () {
                changePDF(2);
                setState(() => _sign = 'Second Floor');
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text('Third Floor'),
              onTap: () {
                changePDF(3);
                setState(() => _sign = 'Third Floor');
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text('Fourth Floor'),
              onTap: () {
                changePDF(4);
                setState(() => _sign = 'Fourth Floor');
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: NUColors.Purple80,
        ),
        title: Text(
          _sign,
          style: TextStyle(
            color: NUColors.NUPurple,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.close,
            size: 60.sp,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : PDFViewer(
                document: document,
                zoomSteps: 2,
                //uncomment below line to preload all pages
                lazyLoad: false,
                // uncomment below line to scroll vertically
                scrollDirection: Axis.vertical,

                //uncomment below code to replace bottom navigation with your own
                // navigationBuilder: (context, page, totalPages, jumpToPage, animateToPage) {
                //   return ButtonBar(
                //     alignment: MainAxisAlignment.spaceEvenly,
                //     children: <Widget>[
                //       IconButton(
                //         icon: Icon(Icons.first_page),
                //         onPressed: () {
                //           jumpToPage(page: 0);
                //         },
                //       ),
                //       IconButton(
                //         icon: Icon(Icons.arrow_back),
                //         onPressed: () {
                //           animateToPage(page: page! - 2);
                //         },
                //       ),
                //       IconButton(
                //         icon: Icon(Icons.arrow_forward),
                //         onPressed: () {
                //           animateToPage(page: page);
                //         },
                //       ),
                //       IconButton(
                //         icon: Icon(Icons.last_page),
                //         onPressed: () {
                //           jumpToPage(page: totalPages! - 1);
                //         },
                //       ),
                //     ],
                //   );
                // },
              ),
      ),
    );
  }
}
