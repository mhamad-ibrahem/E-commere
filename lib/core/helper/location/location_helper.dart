import 'dart:developer';

import '../log_helper/log_helper.dart';

class LocationHelper {
  static String getLong(String location) {
    LogHelper.logCyan("LOCATION IS $location");
    String long = '';
    location = location.split('LNG:').last;
    long = location;
    log("long $long");
    return long;
  }

  static String getLat(String location) {
    LogHelper.logCyan("LOCATION IS $location");
    String lat = '';
    location = location.split('LAT:').last.split(',LNG:').first;
    lat = location;
    log("lat $lat");
    return lat;
  }

  static String getLatitudeFromUrl(String url) {
    String latiTude = url
        .split("!")
        .firstWhere((element) => element.contains("3d")
            // orElse: () => "55.296249"
            )
        .replaceAll("3d", "");
    LogHelper.logSuccess("latiTude.............. $latiTude");
    return latiTude; 
  }

  static String getLongitudeFromUrl(String url) {
    String longiTude = url
        .split("!")
        .firstWhere((element) => element.contains("2d"),
            // orElse: () => "55.296249"
            )
        .replaceAll("2d", "");
    LogHelper.logSuccess("longiTude.............. $longiTude");
    return longiTude; 
  }
}
