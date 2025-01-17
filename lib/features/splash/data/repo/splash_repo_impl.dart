import 'dart:convert';

import '../../../../core/helper/log_helper/log_helper.dart';
import '../../../../core/services/app_services.dart';
import '../../../../core/services/sub_service/local_storage/local_storage_box/local_storage_box.dart';
import '../../../../shared/data/model/local_user_data_model.dart';
import '../../domain/repo/splash_repo.dart';


class SplashRepoImpl extends SplashRepo {
  @override
  Future<LocalUserData?> getLocalUserData() async {
    final localJson = await AppServices.secureStorageService
        .getData(LocalStorageBox.userModelKey);
    LogHelper.logCyan("localJson $localJson");
    if (localJson.isNotEmpty) {
      var decodeJsonData = json.decode(localJson);
      LocalUserData jsonData = LocalUserData.fromJson(decodeJsonData);
      return Future.value(jsonData);
    } else {
      return null;
    }
  }
}
