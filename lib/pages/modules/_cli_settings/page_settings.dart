import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:nu_mobile/router/router.gr.dart';
import 'package:nu_mobile/utils/cache.dart';
import 'package:nu_mobile/utils/colors.dart';
import 'package:thindek_ui/thindek_ui.dart';

import '../../../store/sign_logic.dart';

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
      body:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
                    margin: EdgeInsets.symmetric(
                        horizontal:
                            MediaQuery.of(context).size.width * MARGIN_RATIO),
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
                Container(
                    margin: EdgeInsets.symmetric(
                        horizontal:
                            MediaQuery.of(context).size.width * MARGIN_RATIO),
                    child: Divider()),
                Obx(() {
                  return SignLogic.to.isSigned.value
                      ? ListTile(
                          onTap: () async {
                            await SignLogic.to.signOut();
                            bool isSigned = SignLogic.to.isSigned.value;
                            print(isSigned.toString());
                          },
                          title: Text(
                            'Log out',
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          ),
                        )
                      : Container();
                }),
              ],
            ),
          ),
        ),
        Obx(() {
          return SignLogic.to.isSigned.value
              ? ListTile(
                  onTap: () async {
                    SmartDialog.show(
                      // here
                      backDismiss: false,
                      clickBgDismissTemp: false,
                      isLoadingTemp: false,
                      widget: Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width * 0.7,
                        padding: EdgeInsets.all(20.sp),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        alignment: Alignment.topCenter,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // title
                            Text(
                              'Delete your NU+ account?',
                              style: TextStyle(
                                  fontSize: 30.sp, fontWeight: FontWeight.bold),
                            ),
                            // button (only method of close the dialog)
                            Wrap(
                              spacing: 20.sp,
                              children: [
                                CupertinoButton(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.sp, vertical: 10.sp),
                                    color: Colors.white,
                                    child: Text(
                                      'Delete',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    onPressed: () async {
                                      await SignLogic.to.deleteUser();
                                      await SignLogic.to.signOut();
                                      SmartDialog.dismiss();
                                    }),
                                CupertinoButton(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.sp, vertical: 10.sp),
                                    color: NUColors.NUPurple,
                                    child: Text(
                                      'Cancel',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {
                                      SmartDialog.dismiss();
                                    }),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  title: Column(
                    children: [
                      Text(
                        'Delete Account and Log out',
                        style: TextStyle(color: Colors.grey, fontSize: 25.sp),
                      ),
                    ],
                  ),
                )
              : Container();
        }),

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
