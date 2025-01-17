import '../../shared/data/model/local_user_data_model.dart';
import 'sub_service/local_storage/get_storage.dart';
import 'sub_service/local_storage/secure_storage.dart';

class AppServices {
  // static LocalizationController? localizationController;
  static String fcmToken = '';
  static String token = '';
  static LocalUserData? localUserData;
  static late SecureStorageService secureStorageService;
  Future<AppServices> init() async {
    await LocalStorageService.init();
    secureStorageService = SecureStorageService();
    await secureStorageService.initialStorage();

    return this;
  }
}
initialServices() async {
  await AppServices().init();
}
