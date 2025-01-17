
import '../../../../../../core/config/classes/api_response.dart';
import '../../../../../../core/config/classes/status_request.dart';
import '../../../../../../core/helper/log_helper/log_helper.dart';
import '../../../../../../core/services/supa_base/supa_base_service.dart';
import '../../../../../../shared/widgets/toast/cherry_toast.dart';
import '../../model/auth_register_model.dart';

class ExecuteRegisterRepoImpl {
  final SupaBaseService supaBaseService;

  ExecuteRegisterRepoImpl({required this.supaBaseService});

  /// This method is used to register a user
  ///
  /// It takes an [AuthRegisterModel] object as a parameter
  /// and returns an [ApiResponse] object.
  ///
  /// If the request is successful, it returns an [ApiResponse] object
  /// with a [StatusRequest.success] status and the response data.
  ///
  /// If the request fails, it returns an [ApiResponse] object
  /// with a [StatusRequest.failure] status and the error message.
  ///
  /// If an exception occurs, it catches the exception and returns an [ApiResponse] object
  /// with a [StatusRequest.failure] status and the error message.
  Future<ApiResponse> register(AuthRegisterModel registerModel) async {
    try {
      ApiResponse response = await supaBaseService.sinUp(registerModel);
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
