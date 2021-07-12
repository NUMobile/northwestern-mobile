import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/io_client.dart';
import 'package:webfeed/webfeed.dart';

class NewsModel with ChangeNotifier {
  List<RssItem>? _rssItemList;
  get rssItemList => _rssItemList;

  Future<void> fetchNews() async {
    final client =
        IOClient(HttpClient()..badCertificateCallback = ((X509Certificate cert, String host, int port) => true));

    // RSS feed
    var response = await client.get(Uri.parse('https://news.northwestern.edu/feeds/allStories'));
    var rssFeed = RssFeed.parse(response.body);
    List<RssItem>? rssItemList = rssFeed.items;
    client.close();
    this._rssItemList = rssItemList!;
    notifyListeners();
  }
}
