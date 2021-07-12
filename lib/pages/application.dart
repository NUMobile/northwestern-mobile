import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nu_mobile/pages/view_discover.dart';
import 'package:nu_mobile/store/model_news.dart';
import 'package:nu_mobile/utils/colors.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'view_activity.dart';
import 'view_home.dart';
import 'view_me.dart';

class ApplicationPage extends StatefulWidget {
  ApplicationPage({Key? key}) : super(key: key);

  @override
  _ApplicationPageState createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> with SingleTickerProviderStateMixin {
  static const String IS_FRESHLY_INSTALLED_PREFERENCE_KEY = "is_freshly_installed";

  Future<bool> isFreshInstalled() async {
    var pref = await SharedPreferences.getInstance();
    bool? isFreshlyInstalled = pref.getBool(IS_FRESHLY_INSTALLED_PREFERENCE_KEY);
    if (isFreshlyInstalled == null) {
//null means if fresh installed and flag wasn't stored before
//so we save false into pref incase this flag is needed again or else where after fresh installation
      return await pref.setBool(IS_FRESHLY_INSTALLED_PREFERENCE_KEY, false);
    } else {
      return isFreshlyInstalled;
    }
  }

  int _page = 0;
  late PageController _pageController;

  final List<BottomNavigationBarItem> _bottomTabs = <BottomNavigationBarItem>[
    new BottomNavigationBarItem(
      icon: Icon(
        Icons.home_rounded,
        color: Colors.black26,
        size: 70.sp,
      ),
      activeIcon: Icon(
        Icons.home_rounded,
        color: NUColors.Purple90,
        size: 70.sp,
      ),
      // activeIcon: Container(
      //   height: 70.sp,
      //   width: 70.sp,
      //   child: Image.asset(
      //     'assets/images/msh.png',
      //   ),
      // ),
      label: 'Home',
      backgroundColor: Colors.transparent,
    ),
    new BottomNavigationBarItem(
      icon: Icon(
        CommunityMaterialIcons.compass,
        color: Colors.black26,
        size: 70.sp,
      ),
      activeIcon: Icon(
        CommunityMaterialIcons.compass,
        color: NUColors.Purple90,
        size: 70.sp,
      ),
      label: 'Discover',
      backgroundColor: Colors.transparent,
    ),
    new BottomNavigationBarItem(
      icon: Icon(
        Icons.notifications,
        color: Colors.black26,
        size: 70.sp,
      ),
      activeIcon: Icon(
        Icons.notifications,
        color: NUColors.Purple90,
        size: 70.sp,
      ),
      label: 'Discover',
      backgroundColor: Colors.transparent,
    ),
    new BottomNavigationBarItem(
      icon: Icon(
        Icons.person_rounded,
        color: Colors.black26,
        size: 70.sp,
      ),
      activeIcon: Icon(
        Icons.person_rounded,
        color: NUColors.Purple90,
        size: 70.sp,
      ),
      label: 'Me',
      backgroundColor: Colors.transparent,
    ),
  ];

  void _handleNavBarTap(int index) {
    _pageController.jumpToPage(index);
    // _pageController.animateToPage(index, duration: const Duration(milliseconds: 200), curve: Curves.ease);
  }

  void _handlePageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  @override
  void initState() {
    super.initState();
    // isFreshInstalled().then((value) {
    //   if (value) {
    //     context.pushRoute(IntroductionPage());
    //   }
    // });
    _pageController = new PageController(initialPage: this._page);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildPageView() {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        ViewHome(),
        ViewDiscover(),
        ViewActivity(),
        ViewMe(),
      ],
      controller: _pageController,
      onPageChanged: _handlePageChanged,
    );
  }

  Widget _buildBottomNavigationBar() {
    return Theme(
      data: ThemeData(
        brightness: Brightness.light,
        splashColor: Colors.transparent, //去掉导航栏水波纹效果
        highlightColor: Colors.transparent, //去掉导航栏水波纹效果
      ),
      child: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 5,
          items: _bottomTabs,
          currentIndex: _page,
          type: BottomNavigationBarType.fixed,
          onTap: _handleNavBarTap,
          showSelectedLabels: false,
          selectedFontSize: 0.sp,
          unselectedFontSize: 0.sp,
          showUnselectedLabels: false,
          selectedItemColor: NUColors.NUPurple,
          unselectedItemColor: Colors.black38),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NewsModel>(
          create: (context) => NewsModel()..fetchNews(),
        ),
      ],
      child: Scaffold(
        body: _buildPageView(),
        bottomNavigationBar: _buildBottomNavigationBar(),
      ),
    );
  }
}