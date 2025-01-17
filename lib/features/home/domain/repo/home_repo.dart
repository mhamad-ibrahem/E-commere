import '../../../../../core/config/classes/api_response.dart';

abstract class HomeRepo {
  Future<ApiResponse> getSliders();
  Future<ApiResponse> getSalesProduct();
}
