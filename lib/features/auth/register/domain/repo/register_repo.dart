

import '../../../../../core/config/classes/api_response.dart';
import '../../data/model/auth_register_model.dart';

abstract class RegisterRepo {
  Future<ApiResponse> register({required AuthRegisterModel model});
}
