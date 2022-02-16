import 'package:auto_route/auto_route.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thindek_ui/thindek_ui.dart';

import '../../../router/router.gr.dart';
import '../../../store/sign_logic.dart';
import '../../../utils/colors.dart';

class PageSignUp extends StatefulWidget {
  const PageSignUp({Key? key}) : super(key: key);

  @override
  _PageSignUpState createState() => _PageSignUpState();
}

class _PageSignUpState extends State<PageSignUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  String? email;
  String? password;

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
//          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 100.h,
              ),
              child: Text(
                "Sign up to continue NU+",
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
                    maxLines: 1,
                    decoration: BoxDecoration(border: null),
                    style: TextStyle(
                        color: TDKColors.primaryText, fontSize: 30.sp),
                    autocorrect: false, // 关闭自动纠正
                    obscureText: true,
                  ),
                  Divider(),
                  // Spacer(),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                text: 'By clicking the button below, you agree with our',
                style: TextStyle(color: Colors.grey, fontSize: 25.sp),
                children: <TextSpan>[
                  TextSpan(
                      text: ' Terms ',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          context.pushRoute(
                            PageWebBrowse(
                              url: "https://github.com/NUMobile/legal",
                            ),
                          );
                        },
                      style: TextStyle(
                          color: NUColors.NUPurple,
                          fontWeight: FontWeight.bold)),
                  TextSpan(text: 'and'),
                  TextSpan(
                      text: ' Privacy Policy ',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          context.pushRoute(
                            PageWebBrowse(
                              url: "https://github.com/NUMobile/legal",
                            ),
                          );
                        },
                      style: TextStyle(
                          color: NUColors.NUPurple,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            _emailController.text.isNotEmpty &&
                    _passwordController.text.isNotEmpty
                ? Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.76,
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.03,
                    ),
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
                        'Join now',
                        style: TextStyle(
                          fontSize: 30.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () async {
                        await SignLogic.to.signUp(
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
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.03,
                    ),
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
                        'Join now',
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
                  context.pushRoute(PageSignIn());
                },
                child: Text(
                  'Already have an account?',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.w700,
                    fontSize: 25.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
