import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nu_mobile/pages/modules/biz_news/widget_news.dart';
import 'package:nu_mobile/store/model_news.dart';
import 'package:nu_mobile/utils/colors.dart';
import 'package:provider/provider.dart';

class TabPageNews extends StatefulWidget {
  final ScrollController controller;

  TabPageNews({
    required this.controller,
  });

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
    return Consumer<NewsModel>(builder: (context, model, child) {
      return EasyRefresh(
          scrollController: widget.controller,
          enableControlFinishRefresh: true,
          controller: _controller,
          firstRefresh: true,
          header: BallPulseHeader(color: NUColors.NUPurple),
          onRefresh: () async {
            await model.fetchMultipleNews();
            _controller.finishRefresh();
          },
          child: model.rssItemListMultiple != null
              ? ListView.separated(
                  separatorBuilder: (BuildContext context, int index) =>
                      Container(
                    height: 15.sp,
                  ),
                  itemCount: model.rssItemListMultiple.length,
                  itemBuilder: (BuildContext context, int index) {
                    return nuNewsCard(
                        index, context, model.rssItemListMultiple);
                  },
                )
              : Center(child: Text('Loading...')));
    });
  }
}
