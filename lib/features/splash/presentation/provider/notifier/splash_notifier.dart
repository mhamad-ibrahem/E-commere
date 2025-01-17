import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_e_commerce/core/config/app_config.dart';
import '../../../../../core/config/classes/status_request.dart';
import '../../../../../core/helper/log_helper/log_helper.dart';

import '../../../../../core/routes/app_router.dart';
import '../../../../../core/routes/constant/app_routes.dart';
import '../../../../../core/services/app_services.dart';
import '../../../../../core/services/supa_base/supa_base_service.dart';
import '../../../data/model/splash_state_model.dart';
import '../../../domain/use_case/get_local_user_data_use_case.dart';

class SplashNotifier extends StateNotifier<SplashStateModel> {
  //MARK: use case
  final GetUserLocalDataUseCase getUserLocalDataUseCase;

  SplashNotifier({required this.getUserLocalDataUseCase})
      : super(const SplashStateModel());

  initialServices(BuildContext context) async {
    state = state.copyWith(statusRequest: StatusRequest.loading);
    Future.delayed(const Duration(seconds: 3), () async {
      try {
        AppServices.localUserData = await getUserLocalDataUseCase.execute();
        await AppConfig.initialEnvData();
        await SupaBaseService.init();
        state = state.copyWith(statusRequest: StatusRequest.success);
        LogHelper.logSuccess("token is :  ${AppServices.localUserData?.token}");
        LogHelper.logMagenta("user id is ${AppServices.localUserData?.id}");
        if (context.mounted) {
          AppRouter.navigateOffAllNamed(
              context: context, routeName: AppRoutes().mainRoute);
        }
      } catch (exception) {
        LogHelper.logError(exception.toString());
        state = state.copyWith(statusRequest: StatusRequest.loading);
      }
    });
  }
}
