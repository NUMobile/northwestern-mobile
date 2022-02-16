import 'dart:io';

import 'package:get/get.dart';
import 'package:http/io_client.dart';
import 'package:webfeed/webfeed.dart';

class NewsLogic extends GetxController {
  static NewsLogic get to => Get.find();

  @override
  void onInit() {
    super.onInit();
    fetchNewsNow();
    print(rssItemListNow.toString());
  }

  final rssItemListNow = List.filled(0, RssItem()).obs;

  final rssItemListMultiple = List.filled(0, RssItem()).obs;

  Future<void> fetchNewsNow() async {
    final client = IOClient(HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true));

    // RSS feed
    var response = await client.get(Uri.parse(NUNow));
    var rssFeed = RssFeed.parse(response.body);
    List<RssItem>? rssItemList = rssFeed.items;
    client.close();
    // await remoteConfig.fetchAndActivate();
    // print('covidFilter:' + remoteConfig.getBool('covidFilter').toString());
    // if (remoteConfig.getBool('covidFilter')) {
    List<RssItem>? rssFilteredList = rssItemList
        ?.where((item) =>
            !item.title!.contains(
              RegExp('.*(COVID|SARS|covid|sars|omicron).*'),
            ) &
            !item.description!.contains(
              RegExp('.*(COVID|SARS|covid|sars|omicron).*'),
            ))
        .toList();
    rssItemList = rssFilteredList;
    // }

    rssItemListNow.value = rssItemList!;

    update();
  }

  Future<void> fetchMultipleNews() async {
    final client = IOClient(HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true));

    // Communication News feed
    var responseCommunication = await client.get(Uri.parse(CommunicationNews));
    var rssFeedCommunication = RssFeed.parse(responseCommunication.body);
    List<RssItem>? rssItemListCommunication = rssFeedCommunication.items;

    // McCormick News feed
    var responseMcCormick = await client.get(Uri.parse(EngineeringNews));
    var rssFeedMcCormick = RssFeed.parse(responseMcCormick.body);
    List<RssItem>? rssItemListMcCormick = rssFeedMcCormick.items;

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
    List<RssItem> rssItemListInsight = rssFeedInsight.items!;

    rssItemListInsight
      ..addAll(rssItemListFeinberg!)
      ..addAll(rssItemListPritzker!)
      ..addAll(rssItemListDaily!)
      ..addAll(rssItemListResearch!)
      ..addAll(rssItemListCommunication!)
      // ..addAll(rssItemListMcCormick!!)
      ..sort((a, b) => b.pubDate!.compareTo(a.pubDate!));

    client.close();
    rssItemListMultiple.value = rssItemListInsight;
    update();
  }
}

const String NUNow = 'https://news.northwestern.edu/feeds/allStories';
const String KSMInsight = 'https://insight.kellogg.northwestern.edu/feed/rss';
const String MedicineNews = 'https://news.feinberg.northwestern.edu/feed/';
const String LawNews = 'https://news.law.northwestern.edu/feed/';
const String DailyNews = 'https://dailynorthwestern.com/feed/rss/';
const String ResearchNews = 'https://www.research.northwestern.edu/feed/';
const String EngineeringNews = 'https://mccormick.northwestern.edu/rss/mcc.xml';
const String CommunicationNews = 'https://communication.northwestern.edu/feed/';
