import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../helper/log_helper/log_helper.dart';


class SecureStorageService {
  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );
  late  FlutterSecureStorage storage;
initialStorage() {
    storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
    LogHelper.logCyan("initial secure Storage");
  }
  Future<void> setData({
    required String key,
    required String value,
  }) async {
    await storage.write(key: key, value: value);
  }
  Future<String> getData(String key) async {
    return await storage.read(key: key) ?? "";
  }
  Future<void> deleteData(String key) async {
    await storage.delete(key: key);
  }
  Future<void> clear() async {
    await storage.deleteAll();
  }
}
