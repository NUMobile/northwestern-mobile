import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:nu_mobile/utils/colors.dart';

class PageWebPdf extends StatefulWidget {
  final String title;
  final String url;

  PageWebPdf({
    required this.title,
    required this.url,
  });

  @override
  _PageWebPdfState createState() => _PageWebPdfState();
}

class _PageWebPdfState extends State<PageWebPdf> {
  bool _isLoading = true;
  late PDFDocument document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    document = await PDFDocument.fromURL(
      "https://www.northwestern.edu/campus-life/visiting-campus/documents/EV_campusmap.pdf",
      /* cacheManager: CacheManager(
          Config(
            "customCacheKey",
            stalePeriod: const Duration(days: 2),
            maxNrOfCacheObjects: 10,
          ),
        ), */
    );

    setState(() => _isLoading = false);
  }

  changePDF(value) async {
    setState(() => _isLoading = true);
    if (value == 1) {
      document = await PDFDocument.fromAsset('assets/sample2.pdf');
    } else if (value == 2) {
      document = await PDFDocument.fromURL(
        "https://www.northwestern.edu/campus-life/visiting-campus/documents/EV_campusmap.pdf",
        /* cacheManager: CacheManager(
          Config(
            "customCacheKey",
            stalePeriod: const Duration(days: 2),
            maxNrOfCacheObjects: 10,
          ),
        ), */
      );
    } else {
      document = await PDFDocument.fromAsset('assets/sample.pdf');
    }
    setState(() => _isLoading = false);
  }

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
          widget.title,
          style: TextStyle(
            color: NUColors.NUPurple,
          ),
        ),
      ),
      body: Center(
        child: _isLoading
            ? Center(
                child: CircularProgressIndicator(
                color: NUColors.Purple80,
              ))
            : PDFViewer(
                document: document,
                zoomSteps: 1,
                //uncomment below line to preload all pages
                lazyLoad: true,
                // uncomment below line to scroll vertically
                scrollDirection: Axis.vertical,

                //uncomment below code to replace bottom navigation with your own
                /* navigationBuilder:
                      (context, page, totalPages, jumpToPage, animateToPage) {
                    return ButtonBar(
                      alignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.first_page),
                          onPressed: () {
                            jumpToPage()(page: 0);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {
                            animateToPage(page: page - 2);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_forward),
                          onPressed: () {
                            animateToPage(page: page);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.last_page),
                          onPressed: () {
                            jumpToPage(page: totalPages - 1);
                          },
                        ),
                      ],
                    );
                  }, */
              ),
      ),
    );
  }
}

// class PageWebPdf extends StatefulWidget {
//   final String title;
//   final String url;
//
//   PageWebPdf({
//     required this.title,
//     required this.url,
//   });
//   @override
//   _PageWebPdfState createState() => new _PageWebPdfState();
// }
//
// class _PageWebPdfState extends State<PageWebPdf> {
//   final flutterWebviewPlugin = new FlutterWebviewPlugin();
//
//   late StreamSubscription _onDestroy;
//   late StreamSubscription<String> _onUrlChanged;
//   late StreamSubscription<WebViewStateChanged> _onStateChanged;
//
//   String? token;
//
//   @override
//   void dispose() {
//     // Every listener should be canceled, the same should be done with this stream.
//     _onDestroy.cancel();
//     _onUrlChanged.cancel();
//     _onStateChanged.cancel();
//     flutterWebviewPlugin.dispose();
//     super.dispose();
//   }
//
//   @override
//   void initState() {
//     super.initState();
//
//     flutterWebviewPlugin.close();
//
//     // Add a listener to on destroy WebView, so you can make came actions.
//     _onDestroy = flutterWebviewPlugin.onDestroy.listen((_) {
//       print("destroy");
//     });
//
//     _onStateChanged = flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged state) {
//       print("onStateChanged: ${state.type} ${state.url}");
//     });
//
//     // Add a listener to on url changed
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     String loginUrl = "https://canvas.northwestern.edu/";
//
//     return new WebviewScaffold(
//         url: loginUrl,
//         appBar: new AppBar(
//           title: new Text("Login to someservise..."),
//         ));
//   }
// }
