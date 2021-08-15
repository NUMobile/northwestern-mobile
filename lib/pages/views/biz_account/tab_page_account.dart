import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nu_mobile/router/router.gr.dart';
import 'package:nu_mobile/utils/colors.dart';
import 'package:path_provider/path_provider.dart';
import 'package:thindek_ui/thindek_ui.dart';

class TabPageAccount extends StatefulWidget {
  @override
  _TabPageAccountState createState() => _TabPageAccountState();
}

class _TabPageAccountState extends State<TabPageAccount> {
  final EasyRefreshController _controller = EasyRefreshController();

  /// 获取缓存
  Future<double> loadApplicationCache() async {
    /// 获取文件夹
    Directory directory = await getApplicationDocumentsDirectory();

    /// 获取缓存大小
    double value = await getTotalSizeOfFilesInDir(directory);
    return value;
  }

  /// 循环计算文件的大小（递归）
  Future<double> getTotalSizeOfFilesInDir(final FileSystemEntity file) async {
    if (file is File) {
      int length = await file.length();
      return double.parse(length.toString());
    }
    if (file is Directory) {
      final List<FileSystemEntity> children = file.listSync();
      double total = 0;
      if (children != null)
        for (final FileSystemEntity child in children) total += await getTotalSizeOfFilesInDir(child);
      return total;
    }
    return 0;
  }

  /// 缓存大小格式转换
  String formatSize(double value) {
    if (null == value) {
      return '0';
    }
    List<String> unitArr = List.empty(growable: true)..add('B')..add('K')..add('M')..add('G');
    int index = 0;
    while (value > 1024) {
      index++;
      value = value / 1024;
    }
    String size = value.toStringAsFixed(2);
    return size + unitArr[index];
  }

  /// 删除缓存
  void clearApplicationCache() async {
    Directory directory = await getApplicationDocumentsDirectory();
    //删除缓存目录
    await deleteDirectory(directory);
  }

  /// 递归方式删除目录
  Future<Null> deleteDirectory(FileSystemEntity file) async {
    if (file is Directory) {
      final List<FileSystemEntity> children = file.listSync();
      for (final FileSystemEntity child in children) {
        await deleteDirectory(child);
      }
    }
    await file.delete();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      children: [
        // Container(
        //   padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO),
        //   margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO),
        //   decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10))),
        //   child: Container(
        //     child: Stack(
        //       children: [
        //         Column(
        //           children: [
        //             SizedBox(
        //               height: 15.sp,
        //             ),
        //             Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //               children: [
        //                 Row(
        //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //                   children: [
        //                     Container(
        //                       width: 35.sp * 4,
        //                     ),
        //                     Container(
        //                       child: Column(
        //                         children: [
        //                           GestureDetector(
        //                             onTap: () {
        //                               // isLogged ? context.pushRoute(PageHomepageMe()) : context.pushRoute(PageLogin());
        //                             },
        //                             child: Row(
        //                               children: [
        //                                 Icon(
        //                                   Icons.person,
        //                                   size: 30.sp,
        //                                   color: Colors.black54,
        //                                 ),
        //                                 Text(
        //                                   'Mobile ID (Coming Soon)',
        //                                   textAlign: TextAlign.left,
        //                                   style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30.sp),
        //                                 ),
        //                               ],
        //                             ),
        //                           ),
        //                         ],
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //               ],
        //             ),
        //             SizedBox(
        //               height: 30.sp * 2,
        //             ),
        //           ],
        //         ),
        //         FractionalTranslation(
        //           translation: Offset(0, -0.2),
        //           child: Container(
        //             child: GestureDetector(
        //                 onTap: () {
        //                   // isLogged ? context.pushRoute(PageHomepageMe()) : context.pushRoute(PageLogin());
        //                 },
        //                 child: CircleAvatar(
        //                   backgroundColor: NUColors.Purple80,
        //                   backgroundImage: AssetImage('assets/images/logo_n.png'),
        //                   maxRadius: 45.sp,
        //                 )),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO, vertical: 15.sp),
          height: MediaQuery.of(context).size.width * (1 - 2 * MARGIN_RATIO) * 0.4,
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.width * (1 - 2 * MARGIN_RATIO) * 0.4,
                decoration: BoxDecoration(
                  borderRadius: TDKRadii.r10,
                  color: Colors.white,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/images/purple-polygons.png',
                    ),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.width * (1 - 2 * MARGIN_RATIO) * 0.4,
                decoration: BoxDecoration(
                  borderRadius: TDKRadii.r10,
                  color: Color(0xbc4e2a84),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15.sp * 2,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Column(
            children: [
              menuList(
                'My Wildcard',
                () {
                  // context.pushRoute(
                  //   PageQrcodeUser(
                  //     avatar: model.meInfo['avatar'],
                  //     userName: model.meInfo['name_zh'],
                  //     userId: model.meInfo.objectId,
                  //   ),
                  // );
                },
                Icons.qr_code,
              ),
              menuList(
                'Academic Calendar',
                () {
                  context.pushRoute(
                    PageWebBrowse(url: "https://planitpurple.northwestern.edu/calendar/academic_calendar/"),
                  );
                },
                CommunityMaterialIcons.calendar_clock,
              ),
              menuList(
                'Printing',
                () {
                  context.pushRoute(
                    PageWebBrowse(url: "https://nuprint.northwestern.edu/mr"),
                  );
                },
                Icons.print_rounded,
              ),
              menuList(
                'Recreation Membership',
                () {
                  context.pushRoute(
                    PageWebBrowse(url: "https://recreation.northwestern.edu/"),
                  );
                },
                Icons.sports_handball,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15.sp * 2,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Column(
            children: [
              menuList(
                'Shuttle Tracker(TransLoc)',
                () {
                  context.pushRoute(
                    PageWebBrowse(url: "https://northwestern.transloc.com"),
                  );
                },
                Icons.bus_alert,
              ),
              menuList(
                'Social Media',
                () {
                  context.pushRoute(
                    PageWebBrowse(
                        url: "https://www.northwestern.edu/transportation-parking/shuttles/routes/intercampus.html"),
                  );
                },
                CupertinoIcons.chart_bar_circle_fill,
              ),
              menuList(
                'Share a Concern',
                () {
                  // context.pushRoute(
                  //   PageWebBrowse(url: "https://tutorial.munshare.com/"),
                  // );
                },
                CupertinoIcons.hand_raised_fill,
              ),
              menuList(
                'Lost and Found',
                () {
                  // context.pushRoute(
                  //   PageWebBrowse(url: "https://tutorial.munshare.com/"),
                  // );
                },
                Icons.find_replace_rounded,
              ),
              menuList(
                'RespectNU: Report an Incident',
                () {
                  // context.pushRoute(
                  //   PageWebBrowse(url: "https://tutorial.munshare.com/"),
                  // );
                },
                CupertinoIcons.hand_raised_fill,
              ),
              menuList(
                'Get Cache',
                () async {
                  double value = await loadApplicationCache();
                  String str = formatSize(value);
                  print('获取app缓存: ' + str);
                },
                Icons.settings,
              ),
              menuList(
                'Clear Cache',
                () {
                  clearApplicationCache();
                  print('删除缓存');
                },
                Icons.settings,
              ),
            ],
          ),
        ),
      ],
    ));
  }
}

ListTile menuList(
  String title,
  dynamic route,
  IconData icon,
) {
  return ListTile(
    leading: Icon(
      icon,
      color: NUColors.Purple90,
      size: 30,
    ),
    onTap: route,
    title: Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.w500,
      ),
    ),
    trailing: Icon(
      Icons.arrow_forward_ios,
      size: 30.sp,
    ),
  );
}
