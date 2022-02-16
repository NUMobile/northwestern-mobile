import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:nu_mobile/router/router.gr.dart';
import 'package:nu_mobile/store/news_logic.dart';
import 'package:nu_mobile/store/pulse_logic.dart';
import 'package:nu_mobile/store/sign_logic.dart';
import 'package:nu_mobile/utils/colors.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setCustomErrorPage();
  configLoading();
  if (Platform.isAndroid) {
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
  }
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      systemStatusBarContrastEnforced: false));
  runApp(MyApp());
}

void configLoading() {
  EasyLoading.instance.userInteractions = false;
}

void setCustomErrorPage() {
  ErrorWidget.builder = (FlutterErrorDetails flutterErrorDetails) {
    print('出现错误' + flutterErrorDetails.toString());
    return Center(
      child: CircularProgressIndicator(
        color: NUColors.Purple80,
      ),
    );
  };
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();

  final newsLogic = Get.put(NewsLogic());
  final pulseLogic = Get.put(PulseLogic());
  final signLogic = Get.put(SignLogic());
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(828, 1792),
        builder: () => GetMaterialApp.router(
              builder: EasyLoading.init(
                builder: FlutterSmartDialog.init(),
              ),
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primaryIconTheme: IconThemeData(
                  color: NUColors.Purple80,
                ),
                primaryColor: NUColors.NUPurple,
                colorScheme: ColorScheme.fromSwatch()
                    .copyWith(secondary: NUColors.NUPurple),
              ),
              routeInformationParser: _appRouter.defaultRouteParser(),
              routerDelegate: _appRouter.delegate(),
            ));
  }
}
