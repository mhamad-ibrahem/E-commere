import '../../../../../core/config/classes/api_response.dart';
import '../../../../../core/useCases/params_use_case.dart';
import '../../data/model/auth_login_model.dart';
import '../repo/login_repo.dart';

class LoginUseCase extends ParamUseCase<ApiResponse, AuthLoginModel> {
  final LoginRepo _repo;

  LoginUseCase({required LoginRepo repo}) : _repo = repo;

  @override
  Future<ApiResponse> execute(AuthLoginModel params) {
    return _repo.login(model: params);
  }
}
