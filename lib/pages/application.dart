import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nu_mobile/pages/views/view_discover.dart';
import 'package:nu_mobile/store/sign_logic.dart';
import 'package:nu_mobile/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../store/constants.dart';
import 'views/view_home.dart';
import 'views/view_me.dart';
import 'views/view_resources.dart';

class ApplicationPage extends StatefulWidget {
  ApplicationPage({Key? key}) : super(key: key);

  @override
  _ApplicationPageState createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage>
    with SingleTickerProviderStateMixin {
  static const String IS_FRESHLY_INSTALLED_PREFERENCE_KEY =
      "is_freshly_installed";
  late ScrollController _footerScrollController;

  Future<bool> isFreshInstalled() async {
    var pref = await SharedPreferences.getInstance();
    bool? isFreshlyInstalled =
        pref.getBool(IS_FRESHLY_INSTALLED_PREFERENCE_KEY);
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
    BottomNavigationBarItem(
      icon: GestureDetector(
        onDoubleTap: () {
          print('double tap detected');
          // _footerScrollController.animateTo(0.0,
          //     duration: Duration(milliseconds: 500), curve: Curves.decelerate);
        },
        child: Icon(
          Icons.home_rounded,
          color: Colors.black26,
          size: 70.sp,
        ),
      ),
      // activeIcon: Icon(
      //   Icons.home_rounded,
      //   color: NUColors.Purple90,
      //   size: 70.sp,
      // ),
      activeIcon: Container(
        height: 70.sp,
        width: 70.sp,
        child: ClipOval(
          child: Image.asset(
            'assets/images/nplus_432.png',
          ),
        ),
      ),
      label: 'Home',
      backgroundColor: Colors.transparent,
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.flag,
        color: Colors.black26,
        size: 70.sp,
      ),
      activeIcon: Icon(
        Icons.flag,
        color: NUColors.Purple90,
        size: 70.sp,
      ),
      label: 'Discover',
      backgroundColor: Colors.transparent,
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.apps_rounded,
        color: Colors.black26,
        size: 70.sp,
      ),
      activeIcon: Icon(
        Icons.apps_rounded,
        color: NUColors.Purple90,
        size: 70.sp,
      ),
      label: 'Discover',
      backgroundColor: Colors.transparent,
    ),
    BottomNavigationBarItem(
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

  // void _jumpToTop() {
  //   _footerScrollController.animateTo(0.0,
  //       duration: Duration(milliseconds: 500), curve: Curves.decelerate);
  //   // _scrollController.jumpTo(1);
  // }

  @override
  void initState() {
    super.initState();
    SignLogic.to.getCurrentUserId();
    auth.authStateChanges().listen((User? user) {
      if (user == null) {
        print('Guard: User is currently signed out!');
      } else {
        SignLogic.to.getUserInfo(SignLogic.to.userId.value);
        print('Guard: User is signed in!');
      }
    });
    // isFreshInstalled().then((value) {
    //   if (value) {
    //     context.pushRoute(IntroductionPage());
    //   }
    // });
    // _footerScrollController= new ScrollController();
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
        ViewResources(),
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
        splashColor: Colors.transparent, //??????????????????????????????
        highlightColor: Colors.transparent, //??????????????????????????????
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
    return Scaffold(
      body: _buildPageView(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}
