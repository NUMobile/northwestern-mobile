import 'package:auto_route/auto_route.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nu_mobile/router/router.gr.dart';
import 'package:nu_mobile/utils/colors.dart';
import 'package:thindek_ui/thindek_ui.dart';

import '../../../store/sign_logic.dart';

class PageSignIn extends StatelessWidget {
  PageSignIn({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        leading: IconButton(
          iconSize: 60.sp,
          icon: Icon(
            CommunityMaterialIcons.close_circle,
            color: NUColors.NUPurple,
          ),
          onPressed: () => Navigator.pop(context), // 关闭BottomSheet,
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.12),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 100.h,
              ),
              child: Text(
                "Log in to NU+",
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: NUColors.NUPurple,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.bold,
                  fontSize: 50.sp,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Container(
              child: Column(
                children: [
                  CupertinoTextField(
                    padding: EdgeInsets.symmetric(vertical: 20.sp),
                    cursorHeight: 45.sp,
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.start,
                    cursorColor: NUColors.NUPurple,
                    placeholder: 'Enter your email',
                    placeholderStyle: TextStyle(
                        color: CupertinoColors.placeholderText,
                        fontSize: 30.sp),
                    maxLines: 1,
                    decoration: BoxDecoration(border: null),
                    style: TextStyle(
                        color: TDKColors.primaryText, fontSize: 30.sp),
                    autocorrect: false, // 关闭自动纠正
                    obscureText: false,
                  ),
                  Divider(),
                  CupertinoTextField(
                    padding: EdgeInsets.symmetric(vertical: 20.sp),
                    cursorHeight: 45.sp,
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    textAlign: TextAlign.start,
                    cursorColor: NUColors.NUPurple,
                    placeholder: 'Enter your password',
                    placeholderStyle: TextStyle(
                        color: CupertinoColors.placeholderText,
                        fontSize: 30.sp),
                    maxLines: 1,
                    decoration: BoxDecoration(border: null),
                    style: TextStyle(
                        color: TDKColors.primaryText, fontSize: 30.sp),
                    autocorrect: false, // 关闭自动纠正
                    obscureText: true,
                  ),
                  Divider(),
                ],
              ),
            ),
            _emailController.text.isNotEmpty &&
                    _passwordController.text.isNotEmpty
                ? Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.76,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: NUColors.NUPurple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.w),
                          ),
                        ),
                      ),
                      child: Text(
                        'Log in',
                        style: TextStyle(
                          fontSize: 30.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () async {
                        await SignLogic.to.signInWithEmailAndPassword(
                            _emailController.text, _passwordController.text);
                        bool isSigned = SignLogic.to.isSigned.value;
                        String userId = SignLogic.to.userId.value;
                        print(isSigned.toString());
                        print(userId);
                        if (isSigned) {
                          context.router.replaceAll([ApplicationPage()]);
                        }
                      },
                    ),
                  )
                : Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.76,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.black12,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.w),
                          ),
                        ),
                      ),
                      child: Text(
                        'Log in',
                        style: TextStyle(
                          fontSize: 30.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
            Container(
              width: MediaQuery.of(context).size.width * 0.76,
              margin: EdgeInsets.only(top: 20.h),
              child: CupertinoButton(
                onPressed: () {
                  Navigator.pop(context);
                  context.pushRoute(PageSignUp());
                },
                child: Text(
                  'Create a new account',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.w700,
                    fontSize: 25.sp,
                  ),
                ),
              ),
            ),
            Divider()
          ],
        ),
      ),
    );
  }
}
