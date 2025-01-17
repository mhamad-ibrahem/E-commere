import 'package:url_launcher/url_launcher.dart';

import '../log_helper/log_helper.dart';
import 'url_luncher_method_type.dart';



class UrlLuncher {
  static Future<void> launchURL(
      {required String url, required UrlLuncherMethodType method}) async {
    final Uri uri = Uri(scheme: selectedMethod(method: method), path: url);
    if (await canLaunchUrl(uri)) {
      launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      LogHelper.logError("cant lunch url $uri");
    }
  }

  static Future<void> launchHttpLinks({
    required String url,
    bool isWebSite =true
  }) async {
    final Uri uri = Uri.parse(url);
    // if (await canLaunchUrl(uri)) {
      launchUrl(uri, mode:isWebSite? LaunchMode.externalApplication:LaunchMode.inAppWebView);
    // } else {
    //   LogHelper.logError("cant lunch url $uri");
    // }
  }

  static String selectedMethod({required UrlLuncherMethodType method}) {
    String selectedMethod = '';
    switch (method) {
      case UrlLuncherMethodType.email:
        selectedMethod = 'mailto';
        return selectedMethod;
      case UrlLuncherMethodType.phoneCall:
        selectedMethod = 'tel';
        return selectedMethod;
      case UrlLuncherMethodType.sms:
        selectedMethod = 'sms';
        return selectedMethod;
      case UrlLuncherMethodType.https:
        selectedMethod = 'https';
        return selectedMethod;
      default:
        selectedMethod = 'https';
        return selectedMethod;
    }
  }
}
