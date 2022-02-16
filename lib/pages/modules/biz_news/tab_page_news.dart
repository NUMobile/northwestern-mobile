import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nu_mobile/pages/modules/biz_news/widget_news.dart';
import 'package:nu_mobile/store/news_logic.dart';
import 'package:nu_mobile/utils/colors.dart';

class TabPageNews extends StatefulWidget {
  final ScrollController controller;

  const TabPageNews({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _TabPageNewsState createState() => _TabPageNewsState();
}

class _TabPageNewsState extends State<TabPageNews>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final EasyRefreshController _controller = EasyRefreshController();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return EasyRefresh(
        scrollController: widget.controller,
        enableControlFinishRefresh: true,
        controller: _controller,
        header: BallPulseHeader(color: NUColors.NUPurple),
        onRefresh: () async {
          await NewsLogic.to.fetchMultipleNews();
          _controller.finishRefresh();
        },
        child: Obx(() {
          return NewsLogic.to.rssItemListMultiple.isNotEmpty
              ? ListView.separated(
                  separatorBuilder: (BuildContext context, int index) =>
                      Container(
                    height: 15.sp,
                  ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: NewsLogic.to.rssItemListMultiple.length,
                  itemBuilder: (BuildContext context, int index) {
                    return nuNewsCard(
                        index, context, NewsLogic.to.rssItemListMultiple);
                  },
                )
              : Center(child: Text('Loading...'));
        }));
  }
}
