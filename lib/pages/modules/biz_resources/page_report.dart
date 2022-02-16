import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:nu_mobile/utils/colors.dart';
import 'package:thindek_ui/thindek_ui.dart';

import '../../../store/pulse_logic.dart';
import '../../../store/sign_logic.dart';

class PageReport extends StatefulWidget {
  final String pulseId;
  const PageReport({Key? key, required this.pulseId}) : super(key: key);

  @override
  _PageReportState createState() => _PageReportState();
}

class _PageReportState extends State<PageReport> {
  final TextEditingController _descriptionController = TextEditingController();

  final FocusNode _descriptionFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        leading: IconButton(
          iconSize: 60.sp,
          icon: Icon(
            CommunityMaterialIcons.close_circle,
            color: NUColors.NUPurple,
          ),
          onPressed: () => Navigator.pop(context), // 关闭BottomSheet,
        ),
        title: Text(
          "Report this pulse".tr,
          textAlign: TextAlign.start,
          style: TextStyle(
            color: TDKColors.primaryText,
            fontWeight: FontWeight.bold,
            fontSize: 50.sp,
          ),
        ),
        actions: [
          IconButton(
            iconSize: 60.sp,
            icon: Icon(
              Icons.check_circle,
              color: NUColors.NUPurple,
            ),
            onPressed: () {
              if (_descriptionController.value.text.isEmpty) {
                SmartDialog.showToast('Nothing to say?');
              } else {
                Timestamp stamp = Timestamp.now();
                PulseLogic.to.addReport(_descriptionController.value.text,
                    stamp, SignLogic.to.userId.value);
                context.popRoute();
              }
            },
          ),
        ],
      ),
      body: Container(
          color: Colors.white,
          child: Column(children: [
            editDescription(context, _descriptionController..text,
                _descriptionFocus, 'Describe the problem',
                placeholder: 'Write something',
                maxLines: 10,
                keyboardType: TextInputType.multiline),
          ])),
    );
  }
}

Widget editDescription(BuildContext context, TextEditingController controller,
    FocusNode focusNode, String prefix,
    {String placeholder = '',
    int maxLines = 7,
    int minLines = 3,
    TextInputType keyboardType = TextInputType.text}) {
  return Container(
    margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO),
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 15.sp),
          alignment: Alignment.centerLeft,
          child: Text(
            prefix,
            style: TextStyle(
                color: NUColors.NUPurple,
                fontSize: 40.sp,
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          child: CupertinoTextField(
            padding: EdgeInsets.zero,
            focusNode: focusNode,
            cursorColor: NUColors.NUPurple,
            textAlign: TextAlign.start,
            controller: controller,
            placeholder: placeholder,
            showCursor: true,
            placeholderStyle: TextStyle(color: Colors.grey, fontSize: 40.sp),
            cursorHeight: 50.sp,
            maxLines: maxLines,
            minLines: minLines,
            decoration: BoxDecoration(border: null),
            style: TextStyle(fontSize: 40.sp),
            autocorrect: false,
            // 关闭自动纠正
            obscureText: false,
            keyboardType: keyboardType,
          ),
        ),
      ],
    ),
  );
}
