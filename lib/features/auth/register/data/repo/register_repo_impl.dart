
import '../../../../../core/config/classes/api_response.dart';
import '../../../../../core/services/supa_base/supa_base_service.dart';
import '../../domain/repo/register_repo.dart';
import '../model/auth_register_model.dart';
import 'sub_repo/execute_register_repo_impl.dart';

class RegisterRepoImpl implements RegisterRepo {
  @override
  Future<ApiResponse> register({required AuthRegisterModel model}) {
    final ExecuteRegisterRepoImpl executeRegisterRepoImpl =
        ExecuteRegisterRepoImpl(supaBaseService: SupaBaseService());
    return executeRegisterRepoImpl.register(model);
  }
}
