import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nu_mobile/pages/views/biz_news/tab_page_news.dart';
import 'package:nu_mobile/utils/colors.dart';
import 'package:thindek_ui/thindek_ui.dart';

class ViewDiscover extends StatefulWidget {
  const ViewDiscover({Key? key}) : super(key: key);

  @override
  _ViewDiscoverState createState() => _ViewDiscoverState();
}

class _ViewDiscoverState extends State<ViewDiscover> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: MediaQuery.of(context).size.width * 0.05,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'News',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 60.sp, color: NUColors.NUPurple),
        ),
        actions: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO),
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
      body: TabPageNews(),
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
          height: MediaQuery.of(context).size.height * 0.9, // 占屏幕比例
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
                                  margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
                                  child: Text(
                                    "Subscribed to Multiple News Feed",
                                    style: TextStyle(
                                        fontSize: 40.sp, fontWeight: FontWeight.bold, color: NUColors.NUPurple),
                                  ),
                                ),
                                DocTitle(text: 'News Source：'),
                                DocSection(
                                    text:
                                        'Kellogg Insight, Office for RESEARCH, The Daily Northwestern, Northwestern Pritzker School of Law News,  Feinberg School of Medicine\'s News Center    '),
                                DocSection(text: '尊重：不同意见很正常，但是保持对他人的理解和尊重是互动的底线。我可以不同意你的观点，但我捍卫你说话的权力。请推己及人。'),
                                DocSection(
                                    text:
                                        '启发：我们希望圆桌讨论的话题是高质量，不要求有教育意义，至少应当对发现这个世界的奇妙之处有所帮助。如果有对某位模联人的意见需要发泄，请移步他处，模时将对这样的内容进行清除。'),
                                DocSection(
                                    text: '开放：我们欢迎多元的声音，他山之石，不同的经历和经验的碰撞会有更奇妙的反应。开放的学习态度也是必须。在模时，没有萌新和大佬，我们欢迎平等的对话。'),
                                DocTitle(text: '圆桌如何运行？'),
                                DocSection(text: '1. 你可以主持一个圆桌，发表感兴趣的议题。我们建议你可以先抛砖引玉，再邀请其他人来参与讨论互动。'),
                                DocSection(text: '2. 寻找你感兴趣的圆桌议题加入，发表你的看法。'),
                                DocTitle(text: '社区规范'),
                                DocSection(
                                  text: '1. 请你尊重国家相关法律法规，对讨论内容的底线进行评估。',
                                ),
                                DocSection(text: '2. 对人身攻击，没有理由的揣测，模时将予以删除'),
                                DocSection(text: '模时圆桌需要每一位的用心运营，和我们一同构建真诚的沟通和有价值的连接。'),
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
                          style: TextStyle(fontSize: bodyF.sp),
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
