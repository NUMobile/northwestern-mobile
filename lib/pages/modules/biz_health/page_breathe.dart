import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nu_mobile/router/router.gr.dart';
import 'package:nu_mobile/utils/colors.dart';
import 'package:thindek_ui/thindek_ui.dart';

class PageBreathe extends StatefulWidget {
  const PageBreathe({Key? key}) : super(key: key);

  @override
  _PageBreatheState createState() => _PageBreatheState();
}

class _PageBreatheState extends State<PageBreathe> {
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
          'Breathe',
          style: TextStyle(
            color: NUColors.Purple80,
          ),
        ),
      ),
      body: ListView(children: [
        Container(
          child: Card(
            elevation: 0,
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    context.pushRoute(
                      PageWebBrowse(
                          url:
                              "https://www.northwestern.edu/breathe/what-is-stress/index.html"),
                    );
                  },
                  title: Text('General Stress Management'),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 30.sp,
                  ),
                ),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO),
                    child: Divider()),
                ListTile(
                  onTap: () {
                    context.pushRoute(
                      PageWebBrowse(
                          url:
                              "https://www.northwestern.edu/breathe/test-anxiety/index.html"),
                    );
                  },
                  title: Text('Decrease Test Anxiety'),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 30.sp,
                  ),
                ),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO),
                    child: Divider()),
                ListTile(
                  onTap: () {
                    context.pushRoute(
                      PageWebBrowse(
                          url:
                              "https://www.northwestern.edu/breathe/overwhelmed/index.html"),
                    );
                  },
                  title: Text('Reduce Feeling Overwhelmed'),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 30.sp,
                  ),
                ),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO),
                    child: Divider()),
                ListTile(
                  onTap: () {
                    context.pushRoute(
                      PageWebBrowse(
                          url:
                              "https://www.northwestern.edu/breathe/sleep/index.html"),
                    );
                  },
                  title: Text('Help You Fall Asleep'),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 30.sp,
                  ),
                ),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO),
                    child: Divider()),
                ListTile(
                  onTap: () {
                    context.pushRoute(
                      PageWebBrowse(
                          url:
                              "https://www.northwestern.edu/breathe/graduate-and-professional-students/index.html"),
                    );
                  },
                  title: Text('For Graduate & Professional Students'),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 30.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
