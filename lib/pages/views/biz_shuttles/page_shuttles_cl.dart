import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nu_mobile/router/router.gr.dart';
import 'package:nu_mobile/utils/colors.dart';
import 'package:thindek_ui/thindek_ui.dart';
import 'package:webviewx/webviewx.dart';

const String jscodeParking =
    "document.getElementsByTagName('header')[0].style.display = 'none';" +
        "document.getElementsByTagName('h1')[0].style.display = 'none';" +
        "document.getElementsByTagName('footer')[0].style.display = 'none';" +
        "document.getElementById('breadcrumbs').style.display = 'none';";

class PageShuttlesCL extends StatefulWidget {
  const PageShuttlesCL({Key? key}) : super(key: key);

  @override
  _PageShuttlesCLState createState() => _PageShuttlesCLState();
}

class _PageShuttlesCLState extends State<PageShuttlesCL> {
  late WebViewXController webviewController;

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
          'CL: Campus Loop',
          style: TextStyle(
            color: NUColors.Purple80,
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WebViewX(
              initialContent:
                  'https://northwestern.transloc.com/m/route/8005022',
              initialSourceType: SourceType.url,
              onWebViewCreated: (controller) => webviewController = controller,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO,
                  vertical: 30.sp),
              child: Text(
                'Schedule',
                style: TextStyle(
                    fontSize: 40.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.schedule,
                color: NUColors.Purple90,
                size: 30,
              ),
              onTap: () {
                context.pushRoute(PageWebView(
                  title: 'Approximate Time Past Each Hour',
                  url:
                      'https://www.northwestern.edu/transportation-parking/shuttles/routes/schedules/campus-loop.html',
                ));
              },
              title: Text(
                'Approximate Time Past Each Hour',
                style: TextStyle(
                  fontSize: 35.sp,
                  color: NUColors.NUPurple,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 30.sp,
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
