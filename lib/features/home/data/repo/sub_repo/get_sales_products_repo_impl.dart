import 'package:riverpod_e_commerce/core/services/supa_base/supa_base_service.dart';

import '../../../../../../core/config/classes/api_response.dart';
import '../../../../../../core/config/classes/status_request.dart';
import '../../../../../../core/helper/log_helper/log_helper.dart';
import '../../../../../../shared/widgets/toast/cherry_toast.dart';
import '../../../../../core/services/supa_base/model/request_query_model.dart';
import '../../model/home_products_model.dart';

class GetSalesProductsRepoImpl {
  final SupaBaseService supaBaseService;

  GetSalesProductsRepoImpl({required this.supaBaseService});
  Future<ApiResponse> getData() async {
    try {
      ApiResponse response = await supaBaseService.getDataWithFiltering(
          requestQueryModel: RequestQueryModel(
              tableName: "products",
              type: SupaBaseRequestType.filterOnce,
              columnName: 'is_sales',
              valueColumnFilter: true));
      LogHelper.logMagenta(
          "RESPONSE ERROR MESSAGE IS ${response.errorMessage} RESPONSE STATUS IS ${response.statusRequest}");
      // data loaded
      if (response.statusRequest == StatusRequest.success) {
        List<HomeProductsModel> data = [];
        List responseList = response.responseData;
        data = responseList.map((e) => HomeProductsModel.fromJson(e)).toList();
        return ApiResponse(
            responseData: data, statusRequest: StatusRequest.success);
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
