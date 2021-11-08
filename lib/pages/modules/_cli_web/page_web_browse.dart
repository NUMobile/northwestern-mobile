import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nu_mobile/utils/colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PageWebBrowse extends StatefulWidget {
  final String url;
  final String? jscode;

  PageWebBrowse({required this.url, this.jscode});

  @override
  _PageWebBrowseState createState() => _PageWebBrowseState();
}

class _PageWebBrowseState extends State<PageWebBrowse> {
  final Completer<WebViewController> _controller = Completer<WebViewController>();

  late WebViewController _webViewController;
  double lineProgress = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: NUColors.Purple120,
        brightness: Brightness.dark,
        toolbarHeight: 0,
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
      bottomNavigationBar: Container(
        color: Colors.white,
        height: kBottomNavigationBarHeight + MediaQuery.of(context).padding.bottom,
        child: Column(
          children: [
            _progressBar(lineProgress, context),
            Divider(
              height: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NavigationControls(_controller.future),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    alignment: Alignment.topCenter,
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: Center(
                      child: Text(
                        'Close',
                        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 35.sp),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Container(
            //   alignment: Alignment.topCenter,
            //   height: MediaQuery.of(context).size.height * 0.05,
            // ),
          ],
        ),
      ),
    );
  }

  _progressBar(double progress, BuildContext context) {
    return progress != 1.0
        ? LinearProgressIndicator(
            backgroundColor: Colors.white70.withOpacity(0),
            value: progress == 1.0 ? 0 : progress,
            valueColor: new AlwaysStoppedAnimation<Color>(
              NUColors.Purple80,
            ),
          )
        : Container();
  }
}

class NavigationControls extends StatelessWidget {
  const NavigationControls(this._webViewControllerFuture) : assert(_webViewControllerFuture != null);

  final Future<WebViewController> _webViewControllerFuture;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WebViewController>(
      future: _webViewControllerFuture,
      builder: (BuildContext context, AsyncSnapshot<WebViewController> snapshot) {
        final bool webViewReady = snapshot.connectionState == ConnectionState.done;
        final WebViewController controller = snapshot.data!;
        return Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: !webViewReady
                  ? null
                  : () async {
                      if (await controller.canGoBack()) {
                        await controller.goBack();
                      } else {
                        // ignore: deprecated_member_use
                        Scaffold.of(context).showSnackBar(
                          const SnackBar(content: Text("No back history item")),
                        );
                        return;
                      }
                    },
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: !webViewReady
                  ? null
                  : () async {
                      if (await controller.canGoForward()) {
                        await controller.goForward();
                      } else {
                        // ignore: deprecated_member_use
                        Scaffold.of(context).showSnackBar(
                          const SnackBar(content: Text("No forward history item")),
                        );
                        return;
                      }
                    },
            ),
            IconButton(
              icon: const Icon(Icons.replay),
              onPressed: !webViewReady
                  ? null
                  : () {
                      controller.reload();
                    },
            ),
          ],
        );
      },
    );
  }
}
