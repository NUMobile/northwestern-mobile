// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i24;
import 'package:flutter/material.dart' as _i25;

import '../pages/application.dart' as _i1;
import '../pages/introduction.dart' as _i2;
import '../pages/modules/_cli_settings/page_about.dart' as _i4;
import '../pages/modules/_cli_settings/page_settings.dart' as _i3;
import '../pages/modules/_cli_web/page_web_browse.dart' as _i6;
import '../pages/modules/_cli_web/page_web_pdf.dart' as _i7;
import '../pages/modules/_cli_web/page_web_view.dart' as _i5;
import '../pages/modules/biz_account/page_apps.dart' as _i8;
import '../pages/modules/biz_account/page_concern.dart' as _i9;
import '../pages/modules/biz_dining/page_dining.dart' as _i10;
import '../pages/modules/biz_health/page_breathe.dart' as _i12;
import '../pages/modules/biz_health/page_health.dart' as _i11;
import '../pages/modules/biz_library/page_library.dart' as _i13;
import '../pages/modules/biz_library/page_library_map_list.dart' as _i14;
import '../pages/modules/biz_map/page_map.dart' as _i15;
import '../pages/modules/biz_map/page_map_pdf.dart' as _i16;
import '../pages/modules/biz_map/page_map_tech.dart' as _i17;
import '../pages/modules/biz_parking/page_parking.dart' as _i18;
import '../pages/modules/biz_recreation/page_recreation.dart' as _i19;
import '../pages/modules/biz_shuttles/page_shuttles.dart' as _i20;
import '../pages/modules/biz_shuttles/page_shuttles_cl.dart' as _i21;
import '../pages/modules/biz_shuttles/page_shuttles_el.dart' as _i22;
import '../pages/modules/biz_shuttles/page_shuttles_ic.dart' as _i23;

class AppRouter extends _i24.RootStackRouter {
  AppRouter([_i25.GlobalKey<_i25.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i24.PageFactory> pagesMap = {
    ApplicationPage.name: (routeData) {
      final args = routeData.argsAs<ApplicationPageArgs>(
          orElse: () => const ApplicationPageArgs());
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.ApplicationPage(key: args.key));
    },
    IntroductionPage.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.IntroductionPage(),
          fullscreenDialog: true);
    },
    PageSettings.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.PageSettings());
    },
    PageAbout.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.PageAbout());
    },
    PageWebView.name: (routeData) {
      final args = routeData.argsAs<PageWebViewArgs>();
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i5.PageWebView(
              url: args.url,
              title: args.title,
              description: args.description,
              jscode: args.jscode));
    },
    PageWebBrowse.name: (routeData) {
      final args = routeData.argsAs<PageWebBrowseArgs>();
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i6.PageWebBrowse(url: args.url, jscode: args.jscode),
          fullscreenDialog: true);
    },
    PageWebPdf.name: (routeData) {
      final args = routeData.argsAs<PageWebPdfArgs>();
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i7.PageWebPdf(title: args.title, url: args.url));
    },
    PageApps.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.PageApps());
    },
    PageConcern.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: _i9.PageConcern());
    },
    PageDining.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.PageDining());
    },
    PageHealth.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.PageHealth());
    },
    PageBreathe.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.PageBreathe());
    },
    PageLibrary.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.PageLibrary());
    },
    PageLibraryMapList.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i14.PageLibraryMapList());
    },
    PageMap.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i15.PageMap());
    },
    PageMapPdf.name: (routeData) {
      final args = routeData.argsAs<PageMapPdfArgs>();
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i16.PageMapPdf(title: args.title, path: args.path));
    },
    PageMapTech.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: _i17.PageMapTech());
    },
    PageParking.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i18.PageParking());
    },
    PageRecreation.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i19.PageRecreation());
    },
    PageShuttles.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i20.PageShuttles());
    },
    PageShuttlesCL.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i21.PageShuttlesCL());
    },
    PageShuttlesEL.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i22.PageShuttlesEL());
    },
    PageShuttlesIC.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i23.PageShuttlesIC());
    }
  };

  @override
  List<_i24.RouteConfig> get routes => [
        _i24.RouteConfig(ApplicationPage.name, path: '/'),
        _i24.RouteConfig(IntroductionPage.name, path: '/introduction-page'),
        _i24.RouteConfig(PageSettings.name, path: '/page-settings'),
        _i24.RouteConfig(PageAbout.name, path: '/page-about'),
        _i24.RouteConfig(PageWebView.name, path: '/page-web-view'),
        _i24.RouteConfig(PageWebBrowse.name, path: '/page-web-browse'),
        _i24.RouteConfig(PageWebPdf.name, path: '/page-web-pdf'),
        _i24.RouteConfig(PageApps.name, path: '/page-apps'),
        _i24.RouteConfig(PageConcern.name, path: '/page-concern'),
        _i24.RouteConfig(PageDining.name, path: '/page-dining'),
        _i24.RouteConfig(PageHealth.name, path: '/page-health'),
        _i24.RouteConfig(PageBreathe.name, path: '/page-breathe'),
        _i24.RouteConfig(PageLibrary.name, path: '/page-library'),
        _i24.RouteConfig(PageLibraryMapList.name,
            path: '/page-library-map-list'),
        _i24.RouteConfig(PageMap.name, path: '/page-map'),
        _i24.RouteConfig(PageMapPdf.name, path: '/page-map-pdf'),
        _i24.RouteConfig(PageMapTech.name, path: '/page-map-tech'),
        _i24.RouteConfig(PageParking.name, path: '/page-parking'),
        _i24.RouteConfig(PageRecreation.name, path: '/page-recreation'),
        _i24.RouteConfig(PageShuttles.name, path: '/page-shuttles'),
        _i24.RouteConfig(PageShuttlesCL.name, path: '/page-shuttles-cL'),
        _i24.RouteConfig(PageShuttlesEL.name, path: '/page-shuttles-eL'),
        _i24.RouteConfig(PageShuttlesIC.name, path: '/page-shuttles-iC')
      ];
}

/// generated route for
/// [_i1.ApplicationPage]
class ApplicationPage extends _i24.PageRouteInfo<ApplicationPageArgs> {
  ApplicationPage({_i25.Key? key})
      : super(ApplicationPage.name,
            path: '/', args: ApplicationPageArgs(key: key));

  static const String name = 'ApplicationPage';
}

class ApplicationPageArgs {
  const ApplicationPageArgs({this.key});

  final _i25.Key? key;

  @override
  String toString() {
    return 'ApplicationPageArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.IntroductionPage]
class IntroductionPage extends _i24.PageRouteInfo<void> {
  const IntroductionPage()
      : super(IntroductionPage.name, path: '/introduction-page');

  static const String name = 'IntroductionPage';
}

/// generated route for
/// [_i3.PageSettings]
class PageSettings extends _i24.PageRouteInfo<void> {
  const PageSettings() : super(PageSettings.name, path: '/page-settings');

  static const String name = 'PageSettings';
}

/// generated route for
/// [_i4.PageAbout]
class PageAbout extends _i24.PageRouteInfo<void> {
  const PageAbout() : super(PageAbout.name, path: '/page-about');

  static const String name = 'PageAbout';
}

/// generated route for
/// [_i5.PageWebView]
class PageWebView extends _i24.PageRouteInfo<PageWebViewArgs> {
  PageWebView(
      {required String url,
      required String title,
      String? description,
      String? jscode})
      : super(PageWebView.name,
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

  @override
  String toString() {
    return 'PageWebViewArgs{url: $url, title: $title, description: $description, jscode: $jscode}';
  }
}

/// generated route for
/// [_i6.PageWebBrowse]
class PageWebBrowse extends _i24.PageRouteInfo<PageWebBrowseArgs> {
  PageWebBrowse({required String url, String? jscode})
      : super(PageWebBrowse.name,
            path: '/page-web-browse',
            args: PageWebBrowseArgs(url: url, jscode: jscode));

  static const String name = 'PageWebBrowse';
}

class PageWebBrowseArgs {
  const PageWebBrowseArgs({required this.url, this.jscode});

  final String url;

  final String? jscode;

  @override
  String toString() {
    return 'PageWebBrowseArgs{url: $url, jscode: $jscode}';
  }
}

/// generated route for
/// [_i7.PageWebPdf]
class PageWebPdf extends _i24.PageRouteInfo<PageWebPdfArgs> {
  PageWebPdf({required String title, required String url})
      : super(PageWebPdf.name,
            path: '/page-web-pdf',
            args: PageWebPdfArgs(title: title, url: url));

  static const String name = 'PageWebPdf';
}

class PageWebPdfArgs {
  const PageWebPdfArgs({required this.title, required this.url});

  final String title;

  final String url;

  @override
  String toString() {
    return 'PageWebPdfArgs{title: $title, url: $url}';
  }
}

/// generated route for
/// [_i8.PageApps]
class PageApps extends _i24.PageRouteInfo<void> {
  const PageApps() : super(PageApps.name, path: '/page-apps');

  static const String name = 'PageApps';
}

/// generated route for
/// [_i9.PageConcern]
class PageConcern extends _i24.PageRouteInfo<void> {
  const PageConcern() : super(PageConcern.name, path: '/page-concern');

  static const String name = 'PageConcern';
}

/// generated route for
/// [_i10.PageDining]
class PageDining extends _i24.PageRouteInfo<void> {
  const PageDining() : super(PageDining.name, path: '/page-dining');

  static const String name = 'PageDining';
}

/// generated route for
/// [_i11.PageHealth]
class PageHealth extends _i24.PageRouteInfo<void> {
  const PageHealth() : super(PageHealth.name, path: '/page-health');

  static const String name = 'PageHealth';
}

/// generated route for
/// [_i12.PageBreathe]
class PageBreathe extends _i24.PageRouteInfo<void> {
  const PageBreathe() : super(PageBreathe.name, path: '/page-breathe');

  static const String name = 'PageBreathe';
}

/// generated route for
/// [_i13.PageLibrary]
class PageLibrary extends _i24.PageRouteInfo<void> {
  const PageLibrary() : super(PageLibrary.name, path: '/page-library');

  static const String name = 'PageLibrary';
}

/// generated route for
/// [_i14.PageLibraryMapList]
class PageLibraryMapList extends _i24.PageRouteInfo<void> {
  const PageLibraryMapList()
      : super(PageLibraryMapList.name, path: '/page-library-map-list');

  static const String name = 'PageLibraryMapList';
}

/// generated route for
/// [_i15.PageMap]
class PageMap extends _i24.PageRouteInfo<void> {
  const PageMap() : super(PageMap.name, path: '/page-map');

  static const String name = 'PageMap';
}

/// generated route for
/// [_i16.PageMapPdf]
class PageMapPdf extends _i24.PageRouteInfo<PageMapPdfArgs> {
  PageMapPdf({required String title, required String path})
      : super(PageMapPdf.name,
            path: '/page-map-pdf',
            args: PageMapPdfArgs(title: title, path: path));

  static const String name = 'PageMapPdf';
}

class PageMapPdfArgs {
  const PageMapPdfArgs({required this.title, required this.path});

  final String title;

  final String path;

  @override
  String toString() {
    return 'PageMapPdfArgs{title: $title, path: $path}';
  }
}

/// generated route for
/// [_i17.PageMapTech]
class PageMapTech extends _i24.PageRouteInfo<void> {
  const PageMapTech() : super(PageMapTech.name, path: '/page-map-tech');

  static const String name = 'PageMapTech';
}

/// generated route for
/// [_i18.PageParking]
class PageParking extends _i24.PageRouteInfo<void> {
  const PageParking() : super(PageParking.name, path: '/page-parking');

  static const String name = 'PageParking';
}

/// generated route for
/// [_i19.PageRecreation]
class PageRecreation extends _i24.PageRouteInfo<void> {
  const PageRecreation() : super(PageRecreation.name, path: '/page-recreation');

  static const String name = 'PageRecreation';
}

/// generated route for
/// [_i20.PageShuttles]
class PageShuttles extends _i24.PageRouteInfo<void> {
  const PageShuttles() : super(PageShuttles.name, path: '/page-shuttles');

  static const String name = 'PageShuttles';
}

/// generated route for
/// [_i21.PageShuttlesCL]
class PageShuttlesCL extends _i24.PageRouteInfo<void> {
  const PageShuttlesCL()
      : super(PageShuttlesCL.name, path: '/page-shuttles-cL');

  static const String name = 'PageShuttlesCL';
}

/// generated route for
/// [_i22.PageShuttlesEL]
class PageShuttlesEL extends _i24.PageRouteInfo<void> {
  const PageShuttlesEL()
      : super(PageShuttlesEL.name, path: '/page-shuttles-eL');

  static const String name = 'PageShuttlesEL';
}

/// generated route for
/// [_i23.PageShuttlesIC]
class PageShuttlesIC extends _i24.PageRouteInfo<void> {
  const PageShuttlesIC()
      : super(PageShuttlesIC.name, path: '/page-shuttles-iC');

  static const String name = 'PageShuttlesIC';
}
