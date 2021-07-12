import 'package:flutter/material.dart';
import 'package:nu_mobile/pages/views/biz_account/tab_page_account.dart';

class ViewMe extends StatefulWidget {
  const ViewMe({Key? key}) : super(key: key);

  @override
  _ViewMeState createState() => _ViewMeState();
}

class _ViewMeState extends State<ViewMe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        centerTitle: false,
        titleSpacing: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: MediaQuery.of(context).size.height * 0.06,
      ),
      body: TabPageAccount(),
    );
  }
}
