import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nu_mobile/router/router.gr.dart';
import 'package:nu_mobile/utils/colors.dart';

void main() async {
  setCustomErrorPage();
  configLoading();
  runApp(MyApp());
}

void configLoading() {
  EasyLoading.instance..userInteractions = false;
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

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(828, 1792),
        builder: () => MaterialApp.router(
              builder: EasyLoading.init(),
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primaryIconTheme: IconThemeData(
                  color: NUColors.Purple80,
                ),
                primaryColor: NUColors.NUPurple,
                accentColor: NUColors.NUPurple,
              ),
              routeInformationParser: _appRouter.defaultRouteParser(),
              routerDelegate: _appRouter.delegate(),
            ));
  }
}
