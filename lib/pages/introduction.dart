import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:nu_mobile/utils/colors.dart';

class IntroductionPage extends StatelessWidget {
  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset(
      'assets/images/$assetName',
      width: width,
      fit: BoxFit.fitWidth,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700, color: NUColors.NUPurple),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.all(5.0),
    );
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "欢迎来到模时",
          body: "中国模联人的同好社区，认识有趣模联人，分享有价值知识",
          image: _buildImage('connect.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "探索模联相关内容",
          body: "探索感兴趣的模联会议，入门模联知识",
          image: _buildImage('review.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "分享你的见解",
          body: "同模联人分享真知灼见，共建高信噪比模联社群 \n 请注意尊重其他模联人 \n 请贡献对模联社群有价值的内容",
          image: _buildImage('type_writer.png'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () {
        Navigator.pop(context);
        // context.pushRouteAndRemoveUntil(Routes.ApplicationPage, (route) => false);
        // When done button is press
      },
      next: const Icon(Icons.arrow_forward_ios),
      done: const Text("开始", style: TextStyle(fontWeight: FontWeight.w600, color: NUColors.NUPurple)),
      dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          activeColor: NUColors.NUPurple,
          color: Colors.black26,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0))),
    );
  }
}
