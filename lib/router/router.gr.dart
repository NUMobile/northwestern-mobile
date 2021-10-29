// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../pages/application.dart' as _i3;
import '../pages/introduction.dart' as _i4;
import '../pages/views/_cli_settings/page_about.dart' as _i6;
import '../pages/views/_cli_settings/page_settings.dart' as _i5;
import '../pages/views/_cli_web/page_web_browse.dart' as _i8;
import '../pages/views/_cli_web/page_web_pdf.dart' as _i9;
import '../pages/views/_cli_web/page_web_view.dart' as _i7;
import '../pages/views/biz_account/page_apps.dart' as _i10;
import '../pages/views/biz_account/page_concern.dart' as _i11;
import '../pages/views/biz_dining/page_dining.dart' as _i12;
import '../pages/views/biz_health/page_breathe.dart' as _i21;
import '../pages/views/biz_health/page_health.dart' as _i13;
import '../pages/views/biz_library/page_library.dart' as _i14;
import '../pages/views/biz_library/page_library_map_list.dart' as _i15;
import '../pages/views/biz_map/page_map.dart' as _i16;
import '../pages/views/biz_map/page_map_pdf.dart' as _i17;
import '../pages/views/biz_map/page_map_tech.dart' as _i18;
import '../pages/views/biz_parking/page_parking.dart' as _i19;
import '../pages/views/biz_recreation/page_recreation.dart' as _i20;
import '../pages/views/biz_shuttles/page_shuttles.dart' as _i22;
import '../pages/views/biz_shuttles/page_shuttles_cl.dart' as _i23;
import '../pages/views/biz_shuttles/page_shuttles_el.dart' as _i24;
import '../pages/views/biz_shuttles/page_shuttles_ic.dart' as _i25;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    ApplicationPage.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<ApplicationPageArgs>(
              orElse: () => const ApplicationPageArgs());
          return _i3.ApplicationPage(key: args.key);
        }),
    IntroductionPage.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i4.IntroductionPage();
        },
        fullscreenDialog: true),
    PageSettings.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i5.PageSettings();
        }),
    PageAbout.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i6.PageAbout();
        }),
    PageWebView.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<PageWebViewArgs>();
          return _i7.PageWebView(
              url: args.url,
              title: args.title,
              description: args.description,
              jscode: args.jscode);
        }),
    PageWebBrowse.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<PageWebBrowseArgs>();
          return _i8.PageWebBrowse(url: args.url, jscode: args.jscode);
        },
        fullscreenDialog: true),
    PageWebPdf.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<PageWebPdfArgs>();
          return _i9.PageWebPdf(title: args.title, url: args.url);
        }),
    PageApps.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i10.PageApps();
        }),
    PageConcern.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i11.PageConcern();
        }),
    PageDining.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i12.PageDining();
        }),
    PageHealth.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i13.PageHealth();
        }),
    PageLibrary.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i14.PageLibrary();
        }),
    PageLibraryMapList.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i15.PageLibraryMapList();
        }),
    PageMap.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i16.PageMap();
        }),
    PageMapPdf.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<PageMapPdfArgs>();
          return _i17.PageMapPdf(title: args.title, path: args.path);
        }),
    PageMapTech.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i18.PageMapTech();
        }),
    PageParking.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i19.PageParking();
        }),
    PageRecreation.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i20.PageRecreation();
        }),
    PageBreathe.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i21.PageBreathe();
        }),
    PageShuttles.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i22.PageShuttles();
        }),
    PageShuttlesCL.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i23.PageShuttlesCL();
        }),
    PageShuttlesEL.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i24.PageShuttlesEL();
        }),
    PageShuttlesIC.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i25.PageShuttlesIC();
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(ApplicationPage.name, path: '/'),
        _i1.RouteConfig(IntroductionPage.name, path: '/introduction-page'),
        _i1.RouteConfig(PageSettings.name, path: '/page-settings'),
        _i1.RouteConfig(PageAbout.name, path: '/page-about'),
        _i1.RouteConfig(PageWebView.name, path: '/page-web-view'),
        _i1.RouteConfig(PageWebBrowse.name, path: '/page-web-browse'),
        _i1.RouteConfig(PageWebPdf.name, path: '/page-web-pdf'),
        _i1.RouteConfig(PageApps.name, path: '/page-apps'),
        _i1.RouteConfig(PageConcern.name, path: '/page-concern'),
        _i1.RouteConfig(PageDining.name, path: '/page-dining'),
        _i1.RouteConfig(PageHealth.name, path: '/page-health'),
        _i1.RouteConfig(PageLibrary.name, path: '/page-library'),
        _i1.RouteConfig(PageLibraryMapList.name,
            path: '/page-library-map-list'),
        _i1.RouteConfig(PageMap.name, path: '/page-map'),
        _i1.RouteConfig(PageMapPdf.name, path: '/page-map-pdf'),
        _i1.RouteConfig(PageMapTech.name, path: '/page-map-tech'),
        _i1.RouteConfig(PageParking.name, path: '/page-parking'),
        _i1.RouteConfig(PageRecreation.name, path: '/page-recreation'),
        _i1.RouteConfig(PageBreathe.name, path: '/page-breathe'),
        _i1.RouteConfig(PageShuttles.name, path: '/page-shuttles'),
        _i1.RouteConfig(PageShuttlesCL.name, path: '/page-shuttles-cL'),
        _i1.RouteConfig(PageShuttlesEL.name, path: '/page-shuttles-eL'),
        _i1.RouteConfig(PageShuttlesIC.name, path: '/page-shuttles-iC')
      ];
}

class ApplicationPage extends _i1.PageRouteInfo<ApplicationPageArgs> {
  ApplicationPage({_i2.Key? key})
      : super(name, path: '/', args: ApplicationPageArgs(key: key));

  static const String name = 'ApplicationPage';
}

class ApplicationPageArgs {
  const ApplicationPageArgs({this.key});

  final _i2.Key? key;
}

class IntroductionPage extends _i1.PageRouteInfo {
  const IntroductionPage() : super(name, path: '/introduction-page');

  static const String name = 'IntroductionPage';
}

class PageSettings extends _i1.PageRouteInfo {
  const PageSettings() : super(name, path: '/page-settings');

  static const String name = 'PageSettings';
}

class PageAbout extends _i1.PageRouteInfo {
  const PageAbout() : super(name, path: '/page-about');

  static const String name = 'PageAbout';
}

class PageWebView extends _i1.PageRouteInfo<PageWebViewArgs> {
  PageWebView(
      {required String url,
      required String title,
      String? description,
      String? jscode})
      : super(name,
            path: '/page-web-view',
            args: PageWebViewArgs(
                url: url,
                title: title,
                description: description,
                jscode: jscode));

  static const String name = 'PageWebView';
}

class PageWebViewArgs {
  const PageWebViewArgs(
      {required this.url, required this.title, this.description, this.jscode});

  final String url;

  final String title;

  final String? description;

  final String? jscode;
}

class PageWebBrowse extends _i1.PageRouteInfo<PageWebBrowseArgs> {
  PageWebBrowse({required String url, String? jscode})
      : super(name,
            path: '/page-web-browse',
            args: PageWebBrowseArgs(url: url, jscode: jscode));

  static const String name = 'PageWebBrowse';
}

class PageWebBrowseArgs {
  const PageWebBrowseArgs({required this.url, this.jscode});

  final String url;

  final String? jscode;
}

class PageWebPdf extends _i1.PageRouteInfo<PageWebPdfArgs> {
  PageWebPdf({required String title, required String url})
      : super(name,
            path: '/page-web-pdf',
            args: PageWebPdfArgs(title: title, url: url));

  static const String name = 'PageWebPdf';
}

class PageWebPdfArgs {
  const PageWebPdfArgs({required this.title, required this.url});

  final String title;

  final String url;
}

class PageApps extends _i1.PageRouteInfo {
  const PageApps() : super(name, path: '/page-apps');

  static const String name = 'PageApps';
}

class PageConcern extends _i1.PageRouteInfo {
  const PageConcern() : super(name, path: '/page-concern');

  static const String name = 'PageConcern';
}

class PageDining extends _i1.PageRouteInfo {
  const PageDining() : super(name, path: '/page-dining');

  static const String name = 'PageDining';
}

class PageHealth extends _i1.PageRouteInfo {
  const PageHealth() : super(name, path: '/page-health');

  static const String name = 'PageHealth';
}

class PageLibrary extends _i1.PageRouteInfo {
  const PageLibrary() : super(name, path: '/page-library');

  static const String name = 'PageLibrary';
}

class PageLibraryMapList extends _i1.PageRouteInfo {
  const PageLibraryMapList() : super(name, path: '/page-library-map-list');

  static const String name = 'PageLibraryMapList';
}

class PageMap extends _i1.PageRouteInfo {
  const PageMap() : super(name, path: '/page-map');

  static const String name = 'PageMap';
}

class PageMapPdf extends _i1.PageRouteInfo<PageMapPdfArgs> {
  PageMapPdf({required String title, required String path})
      : super(name,
            path: '/page-map-pdf',
            args: PageMapPdfArgs(title: title, path: path));

  static const String name = 'PageMapPdf';
}

class PageMapPdfArgs {
  const PageMapPdfArgs({required this.title, required this.path});

  final String title;

  final String path;
}

class PageMapTech extends _i1.PageRouteInfo {
  const PageMapTech() : super(name, path: '/page-map-tech');

  static const String name = 'PageMapTech';
}

class PageParking extends _i1.PageRouteInfo {
  const PageParking() : super(name, path: '/page-parking');

  static const String name = 'PageParking';
}

class PageRecreation extends _i1.PageRouteInfo {
  const PageRecreation() : super(name, path: '/page-recreation');

  static const String name = 'PageRecreation';
}

class PageBreathe extends _i1.PageRouteInfo {
  const PageBreathe() : super(name, path: '/page-breathe');

  static const String name = 'PageBreathe';
}

class PageShuttles extends _i1.PageRouteInfo {
  const PageShuttles() : super(name, path: '/page-shuttles');

  static const String name = 'PageShuttles';
}

class PageShuttlesCL extends _i1.PageRouteInfo {
  const PageShuttlesCL() : super(name, path: '/page-shuttles-cL');

  static const String name = 'PageShuttlesCL';
}

class PageShuttlesEL extends _i1.PageRouteInfo {
  const PageShuttlesEL() : super(name, path: '/page-shuttles-eL');

  static const String name = 'PageShuttlesEL';
}

class PageShuttlesIC extends _i1.PageRouteInfo {
  const PageShuttlesIC() : super(name, path: '/page-shuttles-iC');

  static const String name = 'PageShuttlesIC';
}
