import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:nu_mobile/utils/colors.dart';

class PageLibraryHours extends StatefulWidget {
  final String title;
  final String url;

  PageLibraryHours({
    required this.title,
    required this.url,
  });

  @override
  _PageLibraryHoursState createState() => _PageLibraryHoursState();
}

class _PageLibraryHoursState extends State<PageLibraryHours> {
  FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();

  double lineProgress = 0.0;

  late StreamSubscription<String> _onUrlChanged;
  late StreamSubscription<WebViewStateChanged> _onStateChanged;
  String? token;
  final _history = [];

  @override
  void dispose() {
    // Every listener should be canceled, the same should be done with this stream.
    // _onUrlChanged.cancel();
    // _onStateChanged.cancel();
    flutterWebviewPlugin.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    flutterWebviewPlugin.onProgressChanged.listen((progress) {
      print(progress);
      setState(() {
        lineProgress = progress;
      });
    });
    // _onStateChanged = flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged state) {
    //   if (state.type == WebViewState.finishLoad) {
    //     print('start hide');
    //     flutterWebviewPlugin.evalJavascript("document.getElementById('bottom-bar').style.display = 'none';");
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
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
            color: NUColors.Purple80,
          ),
        ),
        actions: [
          // IconButton(
          //   icon: const Icon(
          //     Icons.add,
          //     color: NUColors.Purple80,
          //   ),
          //   onPressed: () {
          //     flutterWebviewPlugin.evalJavascript(""
          //             "document.getElementsByTagName('header')[0].style.display = 'none';" +
          //         "document.getElementById('breadcrumbs',).style.display = 'none';" +
          //         "document.getElementById('page',).style.margin = '0';" +
          //         "document.getElementById('tab-header',).style.display = 'none';" +
          //         "document.getElementsByTagName('footer')[0].style.display = 'none';" +
          //         "document.getElementsByTagName('p')[0].style.display = 'none';");
          //     // flutterWebviewPlugin.getCookies().then((m) {
          //     //   setState(() {
          //     //     var a =
          //     //         '{org.apache.tapestry.locale: en,  _ga: GA1.2.1260991913.1626429751,  _gid: GA1.2.1970571527.1626429751,  nmstat: c60115b3-015c-3418-1605-21eddf788763}';
          //     //     _history.add('cookies: $m');
          //     //     print(_history.join('\n'));
          //     //   });
          //     // });
          //   },
          // ),
        ],
        bottom: PreferredSize(
          child: _progressBar(lineProgress, context),
          preferredSize: Size.fromHeight(3.0),
        ),
      ),
      url: widget.url,
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
