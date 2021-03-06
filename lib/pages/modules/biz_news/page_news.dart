import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nu_mobile/pages/modules/biz_news/tab_page_news.dart';
import 'package:nu_mobile/store/news_logic.dart';
import 'package:nu_mobile/utils/colors.dart';
import 'package:thindek_ui/thindek_ui.dart';

import '../../components/doc.dart';

class PageNews extends StatefulWidget {
  // final ScrollController scrollController;
  const PageNews({Key? key}) : super(key: key);

  @override
  _PageNewsState createState() => _PageNewsState();
}

class _PageNewsState extends State<PageNews>
    with AutomaticKeepAliveClientMixin {
  final ScrollController scrollController = ScrollController();
  bool showToTop = false;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    NewsLogic.to.fetchMultipleNews();

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
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        centerTitle: true,
        iconTheme: IconThemeData(color: NUColors.Purple90),
        title: Text(
          'News',
          style: TextStyle(color: NUColors.Purple90),
        ),
        actions: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO),
            child: GestureDetector(
              onTap: () => displayBottomSheet(context),
              child: Icon(
                Icons.help,
                color: NUColors.NUPurple,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: TabPageNews(controller: scrollController),
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
      isScrollControlled: true, // ????????????
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.w), // ??????
      ),
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.5, // ???????????????
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// ???????????????????????????????????????????????????????????????BottomSheet
              // Row(
              //   children: [
              //     IconButton(
              //       icon: Icon(Icons.close),
              //       onPressed: () => Navigator.pop(context), // ??????BottomSheet,
              //     ),
              //   ],
              // ),

              /// ??????????????????
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
                                    "Subscribed to Multiple News Feed",
                                    style: TextStyle(
                                        fontSize: 40.sp,
                                        fontWeight: FontWeight.bold,
                                        color: NUColors.NUPurple),
                                  ),
                                ),
                                DocTitle(text: 'News Source???'),
                                DocSection(
                                    text:
                                        'Kellogg Insight, School of Communication, Office for RESEARCH, The Daily Northwestern, Northwestern Pritzker School of Law News,  Feinberg School of Medicine\'s News Center    '),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),

              /// ????????????????????????????????????BottomSheet??????
              Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.1,
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
