import '../../config/classes/status_request.dart';

class ApiResponse {
  final dynamic responseData;
  final String? errorMessage;
  final StatusRequest statusRequest;
  final int? statusCode;
  final int finalPage;
  bool isThereAnError;
  ApiResponse({
    required this.responseData,
    this.errorMessage,
    required this.statusRequest,
    this.finalPage = 100,
    this.statusCode,
    this.isThereAnError = false,
  });
}
