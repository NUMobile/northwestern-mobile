import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:nu_mobile/store/sign_logic.dart';
import 'package:nu_mobile/utils/colors.dart';
import 'package:thindek_ui/thindek_ui.dart';

import '../../../store/pulse_logic.dart';

class PageCreatePulse extends StatefulWidget {
  const PageCreatePulse({Key? key}) : super(key: key);

  @override
  _PageCreatePulseState createState() => _PageCreatePulseState();
}

class _PageCreatePulseState extends State<PageCreatePulse> {
  final TextEditingController _contentController = TextEditingController();

  final FocusNode _contentFocus = FocusNode();

  // Initial Selected Value
  String dropdownvalue = 'emotion';

  // List of items in our dropdown menu
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
          child: Text("Vibe: Tell someone about my feelings secretly"),
          value: "vibe"),
      DropdownMenuItem(
          child: Text("Valuable Info: I have something useful to share"),
          value: "info"),
      DropdownMenuItem(
          child: Row(
            children: [
              Text("Roast: I feel like I have to say something"),
            ],
          ),
          value: "roast"),
      DropdownMenuItem(
          child: Row(
            children: [
              Text("Emotion: Just wanna express something"),
            ],
          ),
          value: "emotion"),
    ];
    return menuItems;
  }

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
          "Create a Pulse".tr,
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
              if (_contentController.value.text.isEmpty) {
                SmartDialog.showToast('Nothing to say?');
              } else {
                Timestamp stamp = Timestamp.now();
                PulseLogic.to.addPulse(
                    dropdownvalue,
                    _contentController.value.text,
                    stamp,
                    false,
                    SignLogic.to.userId.value);
                context.popRoute();
              }
            },
          ),
        ],
      ),
      body: Container(
          color: Colors.white,
          child: Column(children: [
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15.sp),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Category',
                      style: TextStyle(
                          color: NUColors.NUPurple,
                          fontSize: 40.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  DropdownButton(
                    // Initial Value
                    value: dropdownvalue,
                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of items
                    items: dropdownItems,
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                  ),
                ],
              ),
            ),
            editDescription(
                context, _contentController..text, _contentFocus, 'Write down',
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
    int maxLines = 8,
    int minLines = 7,
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
