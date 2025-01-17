import 'dart:convert';

import '../../shared/data/model/local_user_data_model.dart';
import '../services/app_services.dart';
import '../services/sub_service/local_storage/local_storage_box/local_storage_box.dart';
import 'log_helper/log_helper.dart';

class UserLocalData {
  static setUserLocalData({LocalUserData? value}) async {
    if (value != null) {
      AppServices.secureStorageService.setData(
          key: LocalStorageBox.userModelKey,
          value: json.encode(value.toJson()));
      LogHelper.logCyan("token ........ ${value.token}");
    }
  }
}
