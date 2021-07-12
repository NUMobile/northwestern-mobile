import 'package:auto_route/annotations.dart';
import 'package:nu_mobile/pages/views/basic_web/page_web_browse.dart';
import 'package:nu_mobile/pages/views/basic_web/page_web_pdf.dart';
import 'package:nu_mobile/pages/views/basic_web/page_web_view.dart';

import '../pages/application.dart';
import '../pages/introduction.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    // initial route is named "/"
    AutoRoute(page: ApplicationPage, name: "ApplicationPage", initial: true),
    AutoRoute(page: IntroductionPage, name: "IntroductionPage", fullscreenDialog: true),

    // basic_web
    AutoRoute(page: PageWebView, name: "PageWebView"),
    AutoRoute(page: PageWebBrowse, name: "PageWebBrowse", fullscreenDialog: true),
    AutoRoute(page: PageWebPdf, name: "PageWebPdf"),
  ],
)
class $AppRouter {}
