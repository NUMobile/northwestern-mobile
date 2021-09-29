import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nu_mobile/utils/colors.dart';
import 'package:thindek_ui/thindek_ui.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PageWebView extends StatefulWidget {
  final String url;
  final String title;
  final String? description;
  final String? jscode;
  PageWebView({required this.url, required this.title, this.description, this.jscode});
  @override
  _PageWebViewState createState() => _PageWebViewState();
}

class _PageWebViewState extends State<PageWebView> {
  final Completer<WebViewController> _controller = Completer<WebViewController>();

  late WebViewController _webViewController;
  double lineProgress = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        titleSpacing: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: NUColors.Purple80,
        ),
        title: widget.description != null
            ? Column(
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      color: NUColors.Purple80,
                    ),
                  ),
                  Text(
                    widget.description!,
                    style: TextStyle(color: NUColors.Purple80, fontSize: 25.sp),
                  )
                ],
              )
            : Text(
                widget.title,
                style: TextStyle(
                  color: NUColors.Purple80,
                ),
              ),
        bottom: PreferredSize(
          child: _progressBar(lineProgress, context),
          preferredSize: Size.fromHeight(3.0),
        ),
        // This drop down menu demonstrates that Flutter widgets can be shown over the web view.
        actions: [
          // NavigationControls(_controller.future),
          // SampleMenu(_controller.future),
          Container(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO),
            child: GestureDetector(
              onTap: () {
                _webViewController.reload();
              },
              child: Icon(
                Icons.replay,
                color: NUColors.NUPurple,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: Builder(builder: (BuildContext context) {
        return WebView(
          initialUrl: widget.url,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
            _webViewController = webViewController;
          },
          onProgress: (int progress) {
            double doubleProgress = progress / 100;
            setState(() {
              lineProgress = doubleProgress;
            });
            print("WebView is loading (progress : $progress%)");
          },
          navigationDelegate: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              print('blocking navigation to $request}');
              return NavigationDecision.prevent;
            }
            print('allowing navigation to $request');
            return NavigationDecision.navigate;
          },
          onPageStarted: (String url) {
            print('Page started loading: $url');
          },
          onPageFinished: (String url) {
            print('Page finished loading: $url');
            if (widget.jscode != null) {
              _webViewController.evaluateJavascript(widget.jscode!);
            }
          },
          gestureNavigationEnabled: true,
        );
      }),
    );
  }

  _progressBar(double progress, BuildContext context) {
    return LinearProgressIndicator(
      backgroundColor: Colors.white70.withOpacity(0),
      value: progress == 1.0 ? 0 : progress,
      valueColor: new AlwaysStoppedAnimation<Color>(
        NUColors.Purple80,
      ),
    );
  }
}
