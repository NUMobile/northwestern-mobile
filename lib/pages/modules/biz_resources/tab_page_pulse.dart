import 'package:auto_route/auto_route.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';
import 'package:nu_mobile/pages/components/emoji_text.dart';
import 'package:nu_mobile/router/router.gr.dart';
import 'package:nu_mobile/store/pulse_logic.dart';
import 'package:nu_mobile/store/sign_logic.dart';
import 'package:nu_mobile/utils/colors.dart';
import 'package:nu_mobile/utils/date.dart';
import 'package:thindek_ui/thindek_ui.dart';

class TabPagePulse extends StatefulWidget {
  final ScrollController controller;

  const TabPagePulse({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _TabPagePulseState createState() => _TabPagePulseState();
}

class _TabPagePulseState extends State<TabPagePulse> {
  final EasyRefreshController refreshController = EasyRefreshController();

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
        scrollController: widget.controller,
        enableControlFinishRefresh: true,
        controller: refreshController,
        firstRefresh: false,
        header: BallPulseHeader(color: NUColors.NUPurple),
        onRefresh: () async {
          await PulseLogic.to.fetchPulses();
          refreshController.finishRefresh();
        },
        child: Obx(() {
          return ListView.separated(
            separatorBuilder: (BuildContext context, int index) => Divider(
              height: 15.sp,
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: PulseLogic.to.pulseList.length,
            itemBuilder: (BuildContext context, int index) {
              return pulseCard(index, context, PulseLogic.to.pulseList);
            },
          );
        })
        // : Center(child: Text('Loading...'))
        );
  }
}

Future<bool> onLikeButtonTapped(bool isLiked, String pulseId) async {
  /// send your request here
  if (isLiked) {
    PulseLogic.to.removeLike(SignLogic.to.userId.value, pulseId);
  } else {
    PulseLogic.to.addLike(SignLogic.to.userId.value, pulseId);
  }
  // final bool success= await sendRequest();

  /// if failed, you can do nothing
  // return success? !isLiked:isLiked;

  return !isLiked;
}

Widget pulseCard(int index, BuildContext context, dynamic pulseList) {
  return pulseList[index]['blocked'] == false
      ? Container(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO,
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 10.sp,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.sp),
                        child: (() {
                          if (pulseList[index]['category'] == 'vibe') {
                            return Row(
                              children: [
                                Icon(
                                  CommunityMaterialIcons.heart_circle,
                                  size: 35.sp,
                                  color: Colors.pink,
                                ),
                                Text(
                                  'Vibe',
                                  style: GoogleFonts.readexPro(
                                    fontSize: 25.sp,
                                    color: Colors.pink,
                                  ),
                                ),
                              ],
                            );
                          } else if (pulseList[index]['category'] == 'info') {
                            return Row(
                              children: [
                                Icon(
                                  CommunityMaterialIcons.book,
                                  size: 35.sp,
                                  color: Colors.purple,
                                ),
                                Text(
                                  'Valuable Info',
                                  style: GoogleFonts.readexPro(
                                    fontSize: 25.sp,
                                    color: Colors.purple,
                                  ),
                                ),
                              ],
                            );
                          } else if (pulseList[index]['category'] ==
                              'emotion') {
                            return Row(
                              children: [
                                Icon(
                                  CommunityMaterialIcons.emoticon_neutral,
                                  size: 35.sp,
                                  color: Colors.blue,
                                ),
                                Text(
                                  'Emotion',
                                  style: GoogleFonts.readexPro(
                                    fontSize: 25.sp,
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            );
                          } else if (pulseList[index]['category'] == 'roast') {
                            return Row(
                              children: [
                                Icon(
                                  CommunityMaterialIcons.emoticon_angry,
                                  size: 35.sp,
                                  color: Colors.red,
                                ),
                                Text(
                                  'Roast',
                                  style: GoogleFonts.readexPro(
                                    fontSize: 25.sp,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            );
                          }
                          // your code here
                        }())),
                    // isliked
                    //     ? GestureDetector(
                    //   onTap:(){
                    //     PulseLogic.to.addLike(SignLogic.to.userId.value, pulseList[index].id.toString());
                    //   } ,
                    //       child: Row(
                    //           children: [
                    //             Icon(
                    //               CommunityMaterialIcons.arrow_up_bold,
                    //               size: 35.sp,
                    //               color: Colors.red,
                    //             ),
                    //             Text(
                    //               pulseList[index]['likes'].length,
                    //               style: GoogleFonts.readexPro(
                    //                 fontSize: 25.sp,
                    //                 color: Colors.red,
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //     )
                    //     : GestureDetector(
                    //   onTap: ,
                    //       child: Row(
                    //           children: [
                    //             Icon(
                    //               CommunityMaterialIcons.arrow_up_bold,
                    //               size: 35.sp,
                    //               color: Colors.grey,
                    //             ),
                    //             Text(
                    //               pulseList[index]['likes'].length == 1
                    //                   ? 'like'
                    //                   : pulseList[index]['likes']
                    //                       .length
                    //                       .toString(),
                    //               style: GoogleFonts.readexPro(
                    //                 fontSize: 25.sp,
                    //                 color: Colors.grey,
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //     )
                  ],
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.symmetric(
                        horizontal: 10.sp, vertical: 10.sp),
                    child: EmojiText(
                      text: pulseList[index]['content'].toString(),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            context.pushRoute(PageReport(
                                pulseId: pulseList[index].id.toString()));
                            print(pulseList[index].id.toString());
                          },
                          constraints: BoxConstraints(),
                          icon: Icon(
                            Icons.report_problem_rounded,
                            size: 35.sp,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          width: 10.sp,
                        ),
                        Obx(() {
                          return LikeButton(
                            padding: EdgeInsets.zero,
                            likeCountPadding: EdgeInsets.zero,
                            isLiked: pulseList[index]['likes']
                                .contains(SignLogic.to.userId.value),
                            onTap: (bool isLiked) {
                              return onLikeButtonTapped(
                                  isLiked, pulseList[index].id.toString());
                            },
                            size: 45.sp,
                            circleColor: const CircleColor(
                                start: NUColors.Purple30,
                                end: NUColors.NUPurple),
                            bubblesColor: const BubblesColor(
                              dotPrimaryColor: NUColors.Purple30,
                              dotSecondaryColor: NUColors.NUPurple,
                            ),
                            likeBuilder: (bool isLiked) {
                              return Icon(
                                CommunityMaterialIcons.arrow_up_bold,
                                color: isLiked ? Colors.red : Colors.grey,
                                size: 45.sp,
                              );
                            },
                            likeCount: pulseList[index]['likes'].length,
                            countBuilder:
                                (int? count, bool isLiked, String text) {
                              var color = isLiked ? Colors.red : Colors.grey;
                              Widget result;
                              if (count == 0) {
                                result = Text(
                                  "like",
                                  style: TextStyle(color: color),
                                );
                              } else {
                                result = Text(
                                  text,
                                  style: TextStyle(color: color),
                                );
                              }
                              return result;
                            },
                          );
                        }),
                      ],
                    ),
                    Container(
                      child: Text(
                        AppDate.timeLineFormat(
                            pulseList[index]['time'].toDate()),
                        style:
                            TextStyle(fontSize: 22.sp, color: Colors.black38),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      : Container();
}
