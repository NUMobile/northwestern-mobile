import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:nu_mobile/utils/colors.dart';

class PageWebView extends StatefulWidget {
  final String url;
  final String title;
  PageWebView({
    required this.url,
    required this.title,
  });
  @override
  _PageWebViewState createState() => _PageWebViewState();
}

class _PageWebViewState extends State<PageWebView> {
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
        elevation: 0,
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        centerTitle: true,
        iconTheme: IconThemeData(color: NUColors.Purple80,),
        title: Text(
          widget.title,
          style: TextStyle(color: NUColors.Purple80,),
        ),
        bottom: PreferredSize(
          child: _progressBar(lineProgress, context),
          preferredSize: Size.fromHeight(3.0),
        ),
      ),
      url: widget.url,
    );
  }

  _progressBar(double progress, BuildContext context) {
    return LinearProgressIndicator(
      backgroundColor: Colors.white70.withOpacity(0),
      value: progress == 1.0 ? 0 : progress,
      valueColor: new AlwaysStoppedAnimation<Color>(NUColors.Purple80,),
    );
  }
}
