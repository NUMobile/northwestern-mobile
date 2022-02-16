import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nu_mobile/router/router.gr.dart';
import 'package:nu_mobile/store/sign_logic.dart';
import 'package:nu_mobile/utils/colors.dart';
import 'package:thindek_ui/thindek_ui.dart';

import '../components/doc.dart';
import '../modules/biz_resources/tab_page_pulse.dart';

class ViewResources extends StatefulWidget {
  const ViewResources({Key? key}) : super(key: key);

  @override
  _ViewResourcesState createState() => _ViewResourcesState();
}

class _ViewResourcesState extends State<ViewResources>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final ScrollController scrollController = ScrollController();

  bool showToTop = false;

  @override
  void initState() {
    super.initState();
    // NewsLogic.to.fetchMultipleNews();

    scrollController.addListener(() {
      if (scrollController.hasClients) {
        var shouldScrollTop = false;
        if (scrollController.offset >= (150) &&
            !scrollController.position.outOfRange) {
          shouldScrollTop = true;
        }
        setState(() {
          showToTop = shouldScrollTop;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  _jumpToTop() {
    scrollController.animateTo(0.0,
        duration: Duration(milliseconds: 500), curve: Curves.decelerate);
    // _scrollController.jumpTo(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: MediaQuery.of(context).size.width * 0.05,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Pulse',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 60.sp,
              color: NUColors.NUPurple),
        ),
        actions: [
          SignLogic.to.isSigned.value
              ? Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                              MediaQuery.of(context).size.width * MARGIN_RATIO),
                      child: GestureDetector(
                        onTap: () => displayBottomSheet(context),
                        child: Icon(
                          Icons.help,
                          color: NUColors.NUPurple,
                          size: 30,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                              MediaQuery.of(context).size.width * MARGIN_RATIO),
                      child: GestureDetector(
                        onTap: () => context.pushRoute(PageCreatePulse()),
                        child: Icon(
                          Icons.add_circle,
                          color: NUColors.NUPurple,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                )
              : Container(),
        ],
      ),
      body: Stack(
        children: [
          Container(
              color: Colors.white,
              child: TabPagePulse(
                controller: scrollController,
              )),
          SignLogic.to.isSigned.value
              ? Container()
              : Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xbc4e2a84), NUColors.NUPurple],
                      )),
                    ),
                    Center(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        margin: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width *
                                MARGIN_RATIO),
                        padding: EdgeInsets.all(20.sp),
                        decoration: BoxDecoration(
                          borderRadius: TDKRadii.r10,
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Pulse is for NU+ user only, please log in to continue',
                              style: TextStyle(color: NUColors.NUPurple),
                            ),
                            CupertinoButton(
                                color: NUColors.NUPurple,
                                child: Text(
                                  'Log in',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {
                                  context.pushRoute(PageSignIn());
                                })
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
        ],
      ),
      floatingActionButton: showToTop
          ? FloatingActionButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)),
              backgroundColor: NUColors.NUPurple,
              child: Icon(
                Icons.keyboard_arrow_up,
                size: 40,
              ),
              onPressed: () {
                _jumpToTop();
              },
            )
          : null,
    );
  }
}

void displayBottomSheet(BuildContext context) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true, // 全屏显示
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.w), // 圆角
      ),
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.5, // 占屏幕比例
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// 顶部栏：左上角关闭按钮，用于内容输入功能性BottomSheet
              // Row(
              //   children: [
              //     IconButton(
              //       icon: Icon(Icons.close),
              //       onPressed: () => Navigator.pop(context), // 关闭BottomSheet,
              //     ),
              //   ],
              // ),

              /// 中间滑动内容
              Container(
                child: Expanded(
                  child: Column(
                    children: [
                      Flexible(
                        child: SingleChildScrollView(
                          child: Container(
                            margin: EdgeInsets.all(25.w),
                            alignment: Alignment.topLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin:
                                      EdgeInsets.only(top: 10.h, bottom: 10.h),
                                  child: Text(
                                    "Post Anonymously",
                                    style: TextStyle(
                                        fontSize: 40.sp,
                                        fontWeight: FontWeight.bold,
                                        color: NUColors.NUPurple),
                                  ),
                                ),
                                DocTitle(
                                    text: 'What happens in NU+, stay in NU+'),
                                DocSection(
                                    text:
                                        'Your info will never be shared to anyone.'),
                                DocTitle(text: 'Be nice'),
                                DocSection(
                                    text:
                                        'Any inproperiate posts(pornographic content, Chatroulette-style experiences, objectification of real people (e.g. “hot-or-not” voting), making physical threats, or bullying) may be removed without notice. Once reported, the publisher will no longer be allowed to post anything.'),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),

              /// 底部关闭按钮，解释说明类BottomSheet启用
              Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.1,
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
                        child: Text(
                          'Close',
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 35.sp),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      });
}
