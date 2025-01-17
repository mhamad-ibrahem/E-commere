




import '../log_helper/log_helper.dart';

class LocalizationHelper {
  static String translate({required String enText, required String arText}) {
    if ('en' == 'ar') {
      return arText;
    } else {
      return enText;
    }
  }

  static bool isEnglishLanguage() {
    if ('en' == 'ar') {
      LogHelper.logYellow('english language');
      return false;
    } else {
      LogHelper.logYellow('arabic language');
      return true;
    }
  }
}
