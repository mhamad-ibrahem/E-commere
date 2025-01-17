import 'package:riverpod_e_commerce/core/helper/log_helper/log_helper.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../config/app_config.dart';
import 'sub_service/supa_base_crud.dart';
import 'sub_service/supa_base_service_auth.dart';

class SupaBaseService with SupaBaseServiceAuth, SupaBaseCrud {
  static Future<void> init() async {
    await Supabase.initialize(
      url: AppConfig.projectUrl,
      anonKey: AppConfig.apiKey,
    );
    LogHelper.logSuccess("initial supabase");
  }
}
