import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:nu_mobile/router/router.gr.dart';
import 'package:nu_mobile/utils/cache.dart';
import 'package:nu_mobile/utils/colors.dart';
import 'package:thindek_ui/thindek_ui.dart';

class PageSettings extends StatefulWidget {
  @override
  _PageSettingsState createState() => _PageSettingsState();
}

class _PageSettingsState extends State<PageSettings> {
  String cacheStr = '';

  loadCache() async {
    double value = await CacheManager.loadApplicationCache();
    String str = CacheManager.formatSize(value);
    setState(() => cacheStr = str);
  }

  @override
  void initState() {
    super.initState();
    loadCache();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        centerTitle: true,
        iconTheme: IconThemeData(color: NUColors.Purple90),
        title: Text(
          'Settings',
          style: TextStyle(color: NUColors.Purple90),
        ),
      ),
      body: ListView(children: [
        // Container(
        //   // padding: EdgeInsets.fromLTRB(
        //   //     8.w, 4.h, 8.w, 4.h),
        //   child: Card(
        //     elevation: 0,
        //     child: Column(
        //       children: [
        //         ListTile(
        //           title: Text('账号设置'),
        //           trailing: Icon(
        //             Icons.arrow_forward_ios,
        //             size: 30.sp,
        //           ),
        //         ),
        //         ListTile(
        //           title: Text('我的收藏'),
        //           trailing: Icon(
        //             Icons.arrow_forward_ios,
        //             size: 30.sp,
        //           ),
        //         ),
        //         ListTile(
        //           title: Text('帮助中心'),
        //           trailing: Icon(
        //             Icons.arrow_forward_ios,
        //             size: 30.sp,
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        // ),
        Container(
          // padding: EdgeInsets.fromLTRB(
          //     8.w, 4.h, 8.w, 4.h),
          child: Card(
            elevation: 0,
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    context.pushRoute(
                      PageAbout(),
                    );
                  },
                  title: Text('About'),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 30.sp,
                  ),
                ),
                // ListTile(
                //   onTap: () {
                //     // context.pushRoute(
                //     //   PageWebView(
                //     //     title: '用户协议',
                //     //     url: "https://www.munshare.com/agreement",
                //     //   ),
                //     // );
                //   },
                //   title: Text('用户协议'),
                //   trailing: Icon(
                //     Icons.arrow_forward_ios,
                //     size: 30.sp,
                //   ),
                // ),
                // ListTile(
                //   onTap: () {
                //     // context.pushRoute(
                //     //   PageWebView(
                //     //     title: '隐私政策',
                //     //     url: "https://www.munshare.com/privacy",
                //     //   ),
                //     // );
                //   },
                //   title: Text('隐私政策'),
                //   trailing: Icon(
                //     Icons.arrow_forward_ios,
                //     size: 30.sp,
                //   ),
                // ),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO),
                    child: Divider()),
                ListTile(
                  onTap: () async {
                    double value = await CacheManager.loadApplicationCache();
                    String str = CacheManager.formatSize(value);
                    print('get app cache: ' + str);
                    CacheManager.clearApplicationCache();
                    loadCache();
                    SmartDialog.showToast(str + ' cleared');
                  },
                  title: Text('Clear Cache'),
                  trailing: Text(cacheStr),
                ),
              ],
            ),
          ),
        ),
        // Consumer<AccountModel>(builder: (context, model, child) {
        //   bool isLogged = Global.currentUserId != '';
        //   return isLogged
        //       ? Container(
        //           child: Card(
        //             elevation: 0,
        //             child: Column(
        //               children: [
        //                 ListTile(
        //                   title: Column(
        //                     children: [
        //                       GestureDetector(
        //                         onTap: () async {
        //                           await model.userLogout();
        //                           context.popRoute();
        //                         },
        //                         child: Container(
        //                           child: Text(
        //                             '退出登录',
        //                             style: TextStyle(color: Colors.red, fontSize: bodyF.sp),
        //                           ),
        //                         ),
        //                       ),
        //                     ],
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         )
        //       : Container();
        // }),
      ]),
    );
  }
}
