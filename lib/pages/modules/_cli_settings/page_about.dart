import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nu_mobile/utils/colors.dart';

class PageAbout extends StatefulWidget {
  const PageAbout({Key? key}) : super(key: key);

  @override
  _PageAboutState createState() => _PageAboutState();
}

class _PageAboutState extends State<PageAbout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        centerTitle: true,
        iconTheme: IconThemeData(color: NUColors.Purple90),
        title: Text(
          'About',
          style: TextStyle(color: NUColors.Purple90),
        ),
      ),
      body: ListView(children: [
        Container(
          // padding: EdgeInsets.fromLTRB(
          //     8.w, 4.h, 8.w, 4.h),
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(20),
                      height: 200.sp,
                      width: 200.sp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'assets/images/nplus_e.png',
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'NU+',
                      style: TextStyle(color: Colors.grey, fontSize: 40.sp),
                    ),
                    Text(
                      '1.0.0(9) Beta0127',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      height: 50.sp,
                      width: 200.sp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/together.png',
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Made with ❤ in Evanston ',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      'by Kening Sun \'22 MPM',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
