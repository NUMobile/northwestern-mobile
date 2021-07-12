import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nu_mobile/router/router.gr.dart';
import 'package:nu_mobile/store/model_news.dart';
import 'package:nu_mobile/utils/colors.dart';
import 'package:nu_mobile/utils/date.dart';
import 'package:provider/provider.dart';
import 'package:thindek_ui/thindek_ui.dart';
import 'package:webfeed/domain/rss_item.dart';

class TabPageNews extends StatefulWidget {
  @override
  _TabPageNewsState createState() => _TabPageNewsState();
}

class _TabPageNewsState extends State<TabPageNews> {
  final EasyRefreshController _controller = EasyRefreshController();

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsModel>(builder: (context, model, child) {
      return EasyRefresh(
        enableControlFinishRefresh: true,
        controller: _controller,
        header: BallPulseHeader(color: NUColors.NUPurple),
        onRefresh: () async {
          await model.fetchNews();
          _controller.finishRefresh();
        },
        child: model.rssItemList != null
            ? ListView.separated(
                separatorBuilder: (BuildContext context, int index) => Divider(),
                itemCount: model.rssItemList.length,
                itemBuilder: (BuildContext context, int index) {
                  return nuNewsCard(index, context, model.rssItemList);
                },
              )
            : Center(child: Text('Loading...')),
      );
    });
  }
}

Widget nuNewsCard(int index, BuildContext context, List<RssItem> rssItemList) {
  return InkWell(
    onTap: () {
      context.pushRoute(
        PageWebBrowse(url: rssItemList[index].guid.toString()),
      );
    },
    child: Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO, vertical: 15.sp),
      child: rssItemList[index].enclosure != null
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.65,
                        child: Text(
                          rssItemList[index].title.toString(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: bodyF.sp, color: NUColors.Purple90),
                        ),
                      ),
                      rssItemList[index].description.toString() != ''
                          ? Container(
                              width: MediaQuery.of(context).size.width * 0.65,
                              margin: EdgeInsets.only(
                                top: 10.sp,
                              ),
                              child: Text(
                                rssItemList[index].description.toString(),
                                maxLines: 2,
                                style:
                                    TextStyle(fontWeight: FontWeight.w600, fontSize: 23.sp, color: NUColors.Purple50),
                              ),
                            )
                          : Container(),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.65,
                        margin: EdgeInsets.only(
                          top: 10.sp,
                        ),
                        child: Text(
                          AppDate.timeLineFormat(rssItemList[index].pubDate!).toString(),
                          style: TextStyle(fontSize: 22.sp, color: Colors.black38),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    child: TDKImage(
                        url: rssItemList[index].enclosure!.url,
                        width: MediaQuery.of(context).size.width * 0.27,
                        height: MediaQuery.of(context).size.width * 0.18,
                        radius: TDKRadii.r0)),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * (1 - 2 * MARGIN_RATIO),
                        alignment: Alignment.topLeft,
                        child: Text(
                          rssItemList[index].title.toString(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: bodyF.sp, color: NUColors.Purple90),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * (1 - 2 * MARGIN_RATIO),
                        alignment: Alignment.bottomLeft,
                        margin: EdgeInsets.only(
                          top: 10.sp,
                        ),
                        child: Text(
                          rssItemList[index].description.toString(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23.sp, color: NUColors.Purple50),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.65,
                        margin: EdgeInsets.only(
                          top: 10.sp,
                        ),
                        child: Text(
                          AppDate.timeLineFormat(rssItemList[index].pubDate!).toString(),
                          style: TextStyle(fontSize: 22.sp, color: Colors.black38),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    ),
  );
}
