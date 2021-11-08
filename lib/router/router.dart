import 'package:auto_route/annotations.dart';
import 'package:nu_mobile/pages/modules/_cli_settings/page_about.dart';
import 'package:nu_mobile/pages/modules/_cli_web/page_web_browse.dart';
import 'package:nu_mobile/pages/modules/_cli_web/page_web_pdf.dart';
import 'package:nu_mobile/pages/modules/_cli_web/page_web_view.dart';
import 'package:nu_mobile/pages/modules/biz_account/page_apps.dart';
import 'package:nu_mobile/pages/modules/biz_account/page_concern.dart';
import 'package:nu_mobile/pages/modules/biz_dining/page_dining.dart';
import 'package:nu_mobile/pages/modules/biz_health/page_breathe.dart';
import 'package:nu_mobile/pages/modules/biz_health/page_health.dart';
import 'package:nu_mobile/pages/modules/biz_library/page_library.dart';
import 'package:nu_mobile/pages/modules/biz_library/page_library_map_list.dart';
import 'package:nu_mobile/pages/modules/biz_map/page_map.dart';
import 'package:nu_mobile/pages/modules/biz_map/page_map_pdf.dart';
import 'package:nu_mobile/pages/modules/biz_map/page_map_tech.dart';
import 'package:nu_mobile/pages/modules/biz_parking/page_parking.dart';
import 'package:nu_mobile/pages/modules/biz_recreation/page_recreation.dart';
import 'package:nu_mobile/pages/modules/biz_shuttles/page_shuttles.dart';
import 'package:nu_mobile/pages/modules/biz_shuttles/page_shuttles_cl.dart';
import 'package:nu_mobile/pages/modules/biz_shuttles/page_shuttles_el.dart';
import 'package:nu_mobile/pages/modules/biz_shuttles/page_shuttles_ic.dart';

import '../pages/application.dart';
import '../pages/introduction.dart';
import '../pages/modules/_cli_settings/page_settings.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    // initial route is named "/"
    AutoRoute(page: ApplicationPage, name: "ApplicationPage", initial: true),
    AutoRoute(
        page: IntroductionPage,
        name: "IntroductionPage",
        fullscreenDialog: true),

    //_cli_settings
    AutoRoute(page: PageSettings, name: "PageSettings"),
    AutoRoute(page: PageAbout, name: "PageAbout"),

    // _cli_web
    AutoRoute(page: PageWebView, name: "PageWebView"),
    AutoRoute(
        page: PageWebBrowse, name: "PageWebBrowse", fullscreenDialog: true),
    AutoRoute(page: PageWebPdf, name: "PageWebPdf"),

    //biz_account
    AutoRoute(page: PageApps, name: "PageApps"),
    AutoRoute(page: PageConcern, name: "PageConcern"),

    //biz_dining
    AutoRoute(page: PageDining, name: "PageDining"),

    //biz_health
    AutoRoute(page: PageHealth, name: "PageHealth"),
    AutoRoute(page: PageBreathe, name: "PageBreathe"),

    //biz_library
    AutoRoute(page: PageLibrary, name: "PageLibrary"),
    AutoRoute(page: PageLibraryMapList, name: "PageLibraryMapList"),

    //biz_map
    AutoRoute(page: PageMap, name: "PageMap"),
    AutoRoute(page: PageMapPdf, name: "PageMapPdf"),
    AutoRoute(page: PageMapTech, name: "PageMapTech"),

    //biz_parking
    AutoRoute(page: PageParking, name: "PageParking"),
    //biz_recreation
    AutoRoute(page: PageRecreation, name: "PageRecreation"),

    //biz_shuttles
    AutoRoute(page: PageShuttles, name: "PageShuttles"),
    AutoRoute(page: PageShuttlesCL, name: "PageShuttlesCL"),
    AutoRoute(page: PageShuttlesEL, name: "PageShuttlesEL"),
    AutoRoute(page: PageShuttlesIC, name: "PageShuttlesIC"),
  ],
)
class $AppRouter {}
