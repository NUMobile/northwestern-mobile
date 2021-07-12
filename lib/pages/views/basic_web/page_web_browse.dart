import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:nu_mobile/utils/colors.dart';

class PageWebBrowse extends StatefulWidget {
  final String url;

  PageWebBrowse({
    required this.url,
  });

  @override
  _PageWebBrowseState createState() => _PageWebBrowseState();
}

class _PageWebBrowseState extends State<PageWebBrowse> {
  FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();

  double lineProgress = 0.0;

  @override
  void initState() {
    super.initState();

    flutterWebviewPlugin.onProgressChanged.listen((progress) {
      print(progress);
      setState(() {
        lineProgress = progress;
      });
    });
  }

  @override
  void dispose() {
    flutterWebviewPlugin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        backgroundColor: NUColors.Purple120,
        brightness: Brightness.dark,
        toolbarHeight: 0,
      ),
      url: widget.url,
      bottomNavigationBar: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height * 0.12,
        child: Column(
          children: [
            _progressBar(lineProgress, context),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: NUColors.Purple80,
                  ),
                  onPressed: () {
                    flutterWebviewPlugin.goBack();
                  },
                ),
                IconButton(
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: NUColors.Purple80,
                  ),
                  onPressed: () {
                    flutterWebviewPlugin.goForward();
                  },
                ),
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
    return LinearProgressIndicator(
      backgroundColor: Colors.white70.withOpacity(0),
      value: progress == 1.0 ? 0 : progress,
      valueColor: new AlwaysStoppedAnimation<Color>(
        NUColors.Purple80,
      ),
    );
  }
}
