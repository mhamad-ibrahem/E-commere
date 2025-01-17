import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../services/app_services.dart';

class AppConfig {
  static Map<String, String> header = {
    'Content-Type': 'application/json',
  };
  static Map<String, String> authorizedHeaders = {
    'Content-Type': 'application/json',
    'Authorization': "Bearer ${AppServices.localUserData?.token}",
  };
  static String baseUrl = dotenv.env["BASE_URL"] ?? "";
  static String baseImageUrl = '${baseUrl.replaceAll('/api', '')}/storage';

  static const String version = "v1";
  static String baseUrlWithVersion = "$baseUrl/$version";
  static String googleMapsKey = dotenv.env["GOOGLE_MAPS_KEY"] ?? "";
  static const String placeHolderImage =
      "https://uaeja.online/logo/logo-01.png";
  static String projectUrl = dotenv.env["PROJECT_URL"] ?? "";
  static String apiKey = dotenv.env["API_KEY"] ?? "";
  static Future<void> initialEnvData() async {
    await dotenv.load(fileName: ".env");
  }
}
