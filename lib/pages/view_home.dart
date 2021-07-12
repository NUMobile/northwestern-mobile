import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/io_client.dart';
import 'package:nu_mobile/pages/views/biz_news/tab_page_news.dart';
import 'package:webfeed/webfeed.dart';

class ViewHome extends StatefulWidget {
  const ViewHome({Key? key}) : super(key: key);

  @override
  _ViewHomeState createState() => _ViewHomeState();
}

class _ViewHomeState extends State<ViewHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: false,
          titleSpacing: MediaQuery.of(context).size.width * 0.05,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Container(
            height: MediaQuery.of(context).size.width * 0.07,
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                alignment: AlignmentDirectional.centerStart,
                fit: BoxFit.contain,
                image: AssetImage(
                  'assets/images/nulogo.png',
                ),
              ),
            ),
          )),
      body: TabPageNews(),
      floatingActionButton: GestureDetector(
        onTap: () => feed(),
        child: Icon(Icons.add),
      ),
    );
  }
}

void feed() async {
  final client =
      IOClient(HttpClient()..badCertificateCallback = ((X509Certificate cert, String host, int port) => true));

  // RSS feed
  var response = await client.get(Uri.parse('https://news.northwestern.edu/feeds/allStories'));
  var rssFeed = RssFeed.parse(response.body);
  RssItem item = rssFeed.items!.first;
  // item.title
  // item.description
  // item.link
  // item.categories
  // item.guid
  // item.pubDate
  // item.author
  // item.comments
  // item.source
  // item.media
  // item.enclosure
  // item.dc
  print(rssFeed.title);
  print(item.enclosure!.url);

  // Atom feed
  // response = await client.get(Uri.parse('https://www.theverge.com/rss/index.xml'));
  // var feed = AtomFeed.parse(response.body);
  // print(feed);

  client.close();
}
