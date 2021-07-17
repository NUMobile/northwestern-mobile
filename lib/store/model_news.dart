import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/io_client.dart';
import 'package:webfeed/webfeed.dart';

class NewsModel with ChangeNotifier {
  List<RssItem>? _rssItemListNow;
  get rssItemListNow => _rssItemListNow;
  List<RssItem>? _rssItemListInsight;
  get rssItemListInsight => _rssItemListInsight;

  Future<void> fetchNewsNow(String url) async {
    final client =
        IOClient(HttpClient()..badCertificateCallback = ((X509Certificate cert, String host, int port) => true));

    // RSS feed
    var response = await client.get(Uri.parse(url));
    var rssFeed = RssFeed.parse(response.body);
    List<RssItem>? rssItemList = rssFeed.items;
    client.close();
    this._rssItemListNow = rssItemList!;
    notifyListeners();
  }

  Future<void> fetchNewsInsight(String url) async {
    final client =
        IOClient(HttpClient()..badCertificateCallback = ((X509Certificate cert, String host, int port) => true));

    // RSS feed
    var response = await client.get(Uri.parse(url));
    var rssFeed = RssFeed.parse(response.body);
    List<RssItem>? rssItemList = rssFeed.items;
    client.close();
    this._rssItemListInsight = rssItemList!;
    notifyListeners();
  }
}

const String NUNow = 'https://news.northwestern.edu/feeds/allStories';
const String KSMInsight = 'https://insight.kellogg.northwestern.edu/feed/rss';
