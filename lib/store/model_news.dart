import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/io_client.dart';
import 'package:webfeed/webfeed.dart';

class NewsModel with ChangeNotifier {
  List<RssItem>? _rssItemListNow;
  get rssItemListNow => _rssItemListNow;
  List<RssItem>? _rssItemListMultiple;
  get rssItemListMultiple => _rssItemListMultiple;

  Future<void> fetchNewsNow() async {
    final client =
        IOClient(HttpClient()..badCertificateCallback = ((X509Certificate cert, String host, int port) => true));

    // RSS feed
    var response = await client.get(Uri.parse(NUNow));
    var rssFeed = RssFeed.parse(response.body);
    List<RssItem>? rssItemList = rssFeed.items;
    client.close();
    this._rssItemListNow = rssItemList!;
    notifyListeners();
  }

  Future<void> fetchMultipleNews() async {
    final client =
        IOClient(HttpClient()..badCertificateCallback = ((X509Certificate cert, String host, int port) => true));

    // Research News feed
    var responseResearch = await client.get(Uri.parse(ResearchNews));
    var rssFeedResearch = RssFeed.parse(responseResearch.body);
    List<RssItem>? rssItemListResearch = rssFeedResearch.items;

    // Daily Northwestern feed
    var responseDaily = await client.get(Uri.parse(DailyNews));
    var rssFeedDaily = RssFeed.parse(responseDaily.body);
    List<RssItem>? rssItemListDaily = rssFeedDaily.items;

    // Feinberg Medicine feed
    var responseFeinberg = await client.get(Uri.parse(MedicineNews));
    var rssFeedFeinberg = RssFeed.parse(responseFeinberg.body);
    List<RssItem>? rssItemListFeinberg = rssFeedFeinberg.items;

    // Pritzker Law feed
    var responsePritzker = await client.get(Uri.parse(LawNews));
    var rssFeedPritzker = RssFeed.parse(responsePritzker.body);
    List<RssItem>? rssItemListPritzker = rssFeedPritzker.items;

    // Kellogg Insight feed
    var responseInsight = await client.get(Uri.parse(KSMInsight));
    var rssFeedInsight = RssFeed.parse(responseInsight.body);
    List<RssItem>? rssItemListInsight = rssFeedInsight.items;

    rssItemListInsight!
      ..addAll(rssItemListFeinberg!)
      ..addAll(rssItemListPritzker!)
      ..addAll(rssItemListDaily!)
      ..addAll(rssItemListResearch!)
      ..sort((a, b) => b.pubDate!.compareTo(a.pubDate!));

    client.close();
    this._rssItemListMultiple = rssItemListInsight!;
    notifyListeners();
  }
}

const String NUNow = 'https://news.northwestern.edu/feeds/allStories';
const String KSMInsight = 'https://insight.kellogg.northwestern.edu/feed/rss';
const String MedicineNews = 'https://news.feinberg.northwestern.edu/feed/';
const String LawNews = 'https://news.law.northwestern.edu/feed/';
const String DailyNews = 'https://dailynorthwestern.com/feed/rss/';
const String ResearchNews = 'https://www.research.northwestern.edu/feed/';
