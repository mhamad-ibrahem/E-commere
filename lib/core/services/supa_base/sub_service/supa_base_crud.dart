import 'package:riverpod_e_commerce/core/helper/log_helper/log_helper.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../config/classes/api_response.dart';
import '../../../config/classes/status_request.dart';
import '../../../helper/internet_functions/check_internet_connection.dart';
import '../model/request_query_model.dart';

mixin SupaBaseCrud {
  final supabase = Supabase.instance.client;

  /// This method is used to get data from supabase table.
  ///
  /// It takes a [RequestQueryModel] object as a parameter and returns
  /// an [ApiResponse] object. The [RequestQueryModel] object contains
  /// the table name and the filter that you want to apply to the data.
  ///
  /// If the request is successful, it returns an [ApiResponse] object
  /// with a [StatusRequest.success] status and the response data.
  ///
  /// If the request fails, it returns an [ApiResponse] object
  /// with a [StatusRequest.failure] status and the error message.
  ///
  /// If an exception occurs, it catches the exception and returns an [ApiResponse] object
  /// with a [StatusRequest.failure] status and the error message.
  ///
  /// If the user does not have internet connection, it will return an [ApiResponse] object
  /// with a [StatusRequest.offlineFailure] status and the error message.
  Future<ApiResponse> getDataWithFiltering(
      {required RequestQueryModel requestQueryModel}) async {
    LogHelper.logCyan("""
table name : ${requestQueryModel.tableName},
query : ${requestQueryModel.queryResponse} ,
limit : ${requestQueryModel.limit} ,
filter one  :${requestQueryModel.columnName} , ${requestQueryModel.valueColumnFilter}
""");
    if (await checkInternetConnection() == true) {
      try {
        final data = await getRequestByNumberOfFilter(
            requestQueryModel: requestQueryModel);
        return ApiResponse(
            responseData: data, statusRequest: StatusRequest.success);
      } catch (e) {
        return ApiResponse(
            responseData: null,
            statusRequest: StatusRequest.failure,
            errorMessage: e.toString());
      }
    } else {
      return ApiResponse(
          responseData: null,
          statusRequest: StatusRequest.offlineFailure,
          errorMessage: "No internet connection");
    }
  }

  dynamic getRequestByNumberOfFilter(
      {required RequestQueryModel requestQueryModel}) async {
    dynamic data;
    if (requestQueryModel.type == SupaBaseRequestType.noFiltering) {
      data = await supabase
          .from(requestQueryModel.tableName)
          .select(requestQueryModel.queryResponse ?? '*')
          .limit(requestQueryModel.limit);
    } else if (requestQueryModel.type == SupaBaseRequestType.filterOnce) {
      data = await supabase
          .from(requestQueryModel.tableName)
          .select(requestQueryModel.queryResponse ?? '*')
          .eq(requestQueryModel.columnName!,
              requestQueryModel.valueColumnFilter!)
          .limit(requestQueryModel.limit);
    } else if (requestQueryModel.type == SupaBaseRequestType.towFilter) {
      data = await supabase
          .from(requestQueryModel.tableName)
          .select(requestQueryModel.queryResponse ?? '*')
          .eq(requestQueryModel.columnName!,
              requestQueryModel.valueColumnFilter!)
          .neq(requestQueryModel.columnName2!,
              requestQueryModel.valueColumnFilter2!)
          .limit(requestQueryModel.limit);
    }
    LogHelper.logSuccess("data is $data");
    return data;
  }
//  Future<ApiResponse> postData ()async{
//   try{

//   }catch(e){
//  }
// }
}
