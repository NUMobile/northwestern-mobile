import 'package:auto_route/annotations.dart';
import 'package:nu_mobile/pages/views/_cli_web/page_web_browse.dart';
import 'package:nu_mobile/pages/views/_cli_web/page_web_pdf.dart';
import 'package:nu_mobile/pages/views/_cli_web/page_web_view.dart';
import 'package:nu_mobile/pages/views/biz_account/page_apps.dart';
import 'package:nu_mobile/pages/views/biz_library/page_library.dart';
import 'package:nu_mobile/pages/views/biz_library/page_library_map_list.dart';
import 'package:nu_mobile/pages/views/biz_map/page_map.dart';
import 'package:nu_mobile/pages/views/biz_map/page_map_pdf.dart';
import 'package:nu_mobile/pages/views/biz_map/page_map_tech.dart';
import 'package:nu_mobile/pages/views/biz_parking/page_parking.dart';
import 'package:nu_mobile/pages/views/biz_shuttles/page_shuttles.dart';

import '../pages/application.dart';
import '../pages/introduction.dart';
import '../pages/views/_cli_settings/page_settings.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    // initial route is named "/"
    AutoRoute(page: ApplicationPage, name: "ApplicationPage", initial: true),
    AutoRoute(page: IntroductionPage, name: "IntroductionPage", fullscreenDialog: true),

    //_cli_settings
    AutoRoute(page: PageSettings, name: "PageSettings"),

    // _cli_web
    AutoRoute(page: PageWebView, name: "PageWebView"),
    AutoRoute(page: PageWebBrowse, name: "PageWebBrowse", fullscreenDialog: true),
    AutoRoute(page: PageWebPdf, name: "PageWebPdf"),

    //biz_account
    AutoRoute(page: PageApps, name: "PageApps"),

    //biz_library
    AutoRoute(page: PageLibrary, name: "PageLibrary"),
    AutoRoute(page: PageLibraryMapList, name: "PageLibraryMapList"),

    //biz_map
    AutoRoute(page: PageMap, name: "PageMap"),
    AutoRoute(page: PageMapPdf, name: "PageMapPdf"),
    AutoRoute(page: PageMapTech, name: "PageMapTech"),

    //biz_shuttles
    AutoRoute(page: PageShuttles, name: "PageShuttles"),

    //biz_parking
    AutoRoute(page: PageParking, name: "PageParking"),
  ],
)
class $AppRouter {}
