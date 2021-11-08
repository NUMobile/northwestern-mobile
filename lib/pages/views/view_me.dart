import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nu_mobile/pages/modules/biz_account/tab_page_account.dart';
import 'package:nu_mobile/router/router.gr.dart';
import 'package:nu_mobile/utils/colors.dart';
import 'package:thindek_ui/thindek_ui.dart';

class ViewMe extends StatefulWidget {
  const ViewMe({Key? key}) : super(key: key);

  @override
  _ViewMeState createState() => _ViewMeState();
}

class _ViewMeState extends State<ViewMe> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        centerTitle: false,
        titleSpacing: 0,
        backgroundColor: NUColors.NUPurple,
        elevation: 0,
        title: Container(
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO),
          child: Container(
            height: 100.sp,
            child: CupertinoTextField(
              focusNode: _searchFocus,
              controller: _searchController,
              decoration: BoxDecoration(
                color: CupertinoDynamicColor.withBrightness(
                  color: CupertinoColors.white,
                  darkColor: CupertinoColors.black,
                ),
                borderRadius: BorderRadius.all(Radius.circular(50.sp)),
              ),
              cursorColor: NUColors.NUPurple,
              cursorWidth: 3,
              prefix: Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.sp),
                  child: Icon(
                    Icons.search,
                    size: 50.sp,
                    color: NUColors.NUPurple,
                  )),
              placeholder: 'Search in Northwestern',
              onSubmitted: (searchText) {
                searchText.trim() != ''
                    ? context.pushRoute(
                        PageWebBrowse(
                            url: Uri.encodeFull(
                                "https://search.northwestern.edu/#gsc.tab=0&gsc.q=" +
                                    searchText +
                                    "&gsc.sort="),
                            jscode: jscodeSearch),
                      )
                    : _searchFocus.unfocus();
                _searchController.clear();
              },
            ),
          ),
        ),
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
      ),
      body: GestureDetector(
          onVerticalDragCancel: () {
            _searchFocus.unfocus();
          },
          onTap: () {
            _searchFocus.unfocus();
          },
          child: TabPageAccount()),
    );
  }
}
