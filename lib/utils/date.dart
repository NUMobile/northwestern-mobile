import 'package:intl/intl.dart';

class AppDate {
  /// string to datetime
  static DateTime parseStr(String formattedString) {
    return DateTime.parse(formattedString);
  }

  /// 获取ymd格式化时间
  static String? ymdFormat(DateTime dt) {
    if (dt == null) return null;
    final dtFormat = new DateFormat('yyyy-MM-dd');
    var str = dtFormat.format(dt);
    return str;
  }

  /// 返回周几
  static String weekdayFormat(DateTime dt) {
    switch (dt.weekday) {
      case 1:
        {
          return "星期一";
        }
        break;
      case 2:
        {
          return "星期二";
        }
        break;
      case 3:
        {
          return "星期三";
        }
        break;
      case 4:
        {
          return "星期四";
        }
        break;
      case 5:
        {
          return "星期五";
        }
        break;
      case 6:
        {
          return "星期六";
        }
        break;
      case 7:
        {
          return "星期日";
        }
        break;
      default:
        {
          return "无效";
        }
        break;
    }
    // if (dt.weekday == 1) return "星期一";
    // if (dt.weekday == 2) return "星期二";
    // if (dt.weekday == 3) return "星期三";
    // if (dt.weekday == 4) return "星期四";
    // if (dt.weekday == 5) return "星期五";
    // if (dt.weekday == 6) return "星期六";
    // if (dt.weekday == 7) return "星期日";
  }

  /// 格式化timeline时间
  static String timeLineFormat(DateTime dt) {
    var now = DateTime.now();
    var difference = now.difference(dt);

    if ((difference.inSeconds < 60) & (difference.inSeconds > 1)) {
      return "${difference.inSeconds} s ago";
    }

// 1天内
    if (difference.inHours < 1) {
      return "${difference.inMinutes} mins ago";
    }

    if ((difference.inHours < 24) & (difference.inHours > 1)) {
      return "${difference.inHours} hrs ago";
    }
// // 30天内
//     else if (difference.inDays < 30) {
//       return "${difference.inDays} 天前";
//     }
// MM-dd
    else if (difference.inDays < 365) {
      final dtFormat = DateFormat.MMMd('en_US');
      return dtFormat.format(dt);
    }
// yyyy-MM-dd
    else {
      final dtFormat = DateFormat.yMMMMd('en_US');
      var str = dtFormat.format(dt);
      return str;
    }
  }
}
