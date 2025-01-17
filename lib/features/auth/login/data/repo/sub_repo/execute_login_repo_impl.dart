import 'package:riverpod_e_commerce/core/services/supa_base/supa_base_service.dart';

import '../../../../../../core/config/classes/api_response.dart';
import '../../../../../../core/config/classes/status_request.dart';
import '../../../../../../core/helper/log_helper/log_helper.dart';
import '../../../../../../shared/widgets/toast/cherry_toast.dart';
import '../../model/auth_login_model.dart';

class ExecuteLoginRepoImpl {
  final SupaBaseService supaBaseService;

  ExecuteLoginRepoImpl({required this.supaBaseService});
  Future<ApiResponse> login(AuthLoginModel loginModel) async {
    try {
      ApiResponse response = await supaBaseService.login(loginModel);
      LogHelper.logMagenta(
          "RESPONSE ERROR MESSAGE IS ${response.errorMessage} RESPONSE STATUS IS ${response.statusRequest}");
      // data loaded
      if (response.statusRequest == StatusRequest.success) {
        return ApiResponse(
            responseData: response.responseData,
            statusRequest: StatusRequest.success);
      }
      //error state
      else {
        AppCherryToast.showErrorToast(message: response.errorMessage ?? '');
        return ApiResponse(
            responseData: null,
            statusCode: response.statusCode,
            errorMessage: response.errorMessage,
            statusRequest: response.statusRequest);
      }
    } catch (e) {
      LogHelper.logError("catch error $e");
      AppCherryToast.showErrorToast(message: "Un know error");
      return ApiResponse(
          responseData: null,
          statusCode: 400,
          errorMessage: "Un know error",
          statusRequest: StatusRequest.failure);
    }
  }
}
