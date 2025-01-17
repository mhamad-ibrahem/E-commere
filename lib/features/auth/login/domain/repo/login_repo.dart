

import '../../../../../core/config/classes/api_response.dart';
import '../../data/model/auth_login_model.dart';

abstract class LoginRepo {
  Future<ApiResponse> login({required AuthLoginModel model});
}
