import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:nu_mobile/pages/views/biz_news/widget_news.dart';
import 'package:nu_mobile/store/model_news.dart';
import 'package:nu_mobile/utils/colors.dart';
import 'package:provider/provider.dart';

class TabPageNewsInsight extends StatefulWidget {
  @override
  _TabPageNewsInsightState createState() => _TabPageNewsInsightState();
}

class _TabPageNewsInsightState extends State<TabPageNewsInsight> {
  final EasyRefreshController _controller = EasyRefreshController();

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsModel>(builder: (context, model, child) {
      return model.rssItemListInsight != null
          ? EasyRefresh(
              enableControlFinishRefresh: true,
              controller: _controller,
              header: BallPulseHeader(color: NUColors.NUPurple),
              onRefresh: () async {
                await model.fetchNewsInsight(KSMInsight);
                _controller.finishRefresh();
              },
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) => Container(),
                itemCount: model.rssItemListInsight.length,
                itemBuilder: (BuildContext context, int index) {
                  return nuNewsCard(index, context, model.rssItemListInsight);
                },
              ))
          : Center(child: Text('Loading...'));
    });
  }
}
