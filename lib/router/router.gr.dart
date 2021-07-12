// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../pages/application.dart' as _i3;
import '../pages/introduction.dart' as _i4;
import '../pages/views/basic_web/page_web_browse.dart' as _i6;
import '../pages/views/basic_web/page_web_pdf.dart' as _i7;
import '../pages/views/basic_web/page_web_view.dart' as _i5;

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
    PageWebView.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<PageWebViewArgs>();
          return _i5.PageWebView(url: args.url, title: args.title);
        }),
    PageWebBrowse.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<PageWebBrowseArgs>();
          return _i6.PageWebBrowse(url: args.url);
        },
        fullscreenDialog: true),
    PageWebPdf.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<PageWebPdfArgs>();
          return _i7.PageWebPdf(title: args.title, url: args.url);
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(ApplicationPage.name, path: '/'),
        _i1.RouteConfig(IntroductionPage.name, path: '/introduction-page'),
        _i1.RouteConfig(PageWebView.name, path: '/page-web-view'),
        _i1.RouteConfig(PageWebBrowse.name, path: '/page-web-browse'),
        _i1.RouteConfig(PageWebPdf.name, path: '/page-web-pdf')
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

class PageWebView extends _i1.PageRouteInfo<PageWebViewArgs> {
  PageWebView({required String url, required String title})
      : super(name,
            path: '/page-web-view',
            args: PageWebViewArgs(url: url, title: title));

  static const String name = 'PageWebView';
}

class PageWebViewArgs {
  const PageWebViewArgs({required this.url, required this.title});

  final String url;

  final String title;
}

class PageWebBrowse extends _i1.PageRouteInfo<PageWebBrowseArgs> {
  PageWebBrowse({required String url})
      : super(name,
            path: '/page-web-browse', args: PageWebBrowseArgs(url: url));

  static const String name = 'PageWebBrowse';
}

class PageWebBrowseArgs {
  const PageWebBrowseArgs({required this.url});

  final String url;
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
