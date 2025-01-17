import '../../../../../core/config/classes/api_response.dart';
import '../../../../../core/useCases/params_use_case.dart';
import '../../data/model/auth_register_model.dart';
import '../repo/register_repo.dart';

class RegisterUseCase extends ParamUseCase<ApiResponse, AuthRegisterModel> {
  final RegisterRepo _repo;

  RegisterUseCase({required RegisterRepo repo}) : _repo = repo;

  @override
  Future<ApiResponse> execute(AuthRegisterModel params) {
    return _repo.register(model: params);
  }
}
