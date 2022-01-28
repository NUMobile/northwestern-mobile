import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nu_mobile/pages/modules/biz_news/tab_page_news.dart';
import 'package:nu_mobile/utils/colors.dart';
import 'package:thindek_ui/thindek_ui.dart';

class ViewDiscover extends StatefulWidget {
  // final ScrollController scrollController;
  const ViewDiscover({Key? key}) : super(key: key);

  @override
  _ViewDiscoverState createState() => _ViewDiscoverState();
}

class _ViewDiscoverState extends State<ViewDiscover>
    with AutomaticKeepAliveClientMixin {
  final ScrollController scrollController = ScrollController();
  bool showToTop = false;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

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
        centerTitle: false,
        titleSpacing: MediaQuery.of(context).size.width * 0.05,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'News',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 60.sp,
              color: NUColors.NUPurple),
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
                                    "Subscribed to Multiple News Feed",
                                    style: TextStyle(
                                        fontSize: 40.sp,
                                        fontWeight: FontWeight.bold,
                                        color: NUColors.NUPurple),
                                  ),
                                ),
                                DocTitle(text: 'News Source：'),
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

              /// 底部关闭按钮，解释说明类BottomSheet启用
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

class DocTitle extends StatelessWidget {
  final String text;
  const DocTitle({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.sp),
      child: Text(
        text,
        style: TextStyle(fontSize: 36.sp, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class DocSection extends StatelessWidget {
  final String text;
  const DocSection({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.sp),
      child: Text(text),
    );
  }
}
