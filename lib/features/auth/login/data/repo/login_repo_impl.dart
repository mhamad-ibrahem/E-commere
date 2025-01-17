import 'package:riverpod_e_commerce/core/config/classes/api_response.dart';
import 'package:riverpod_e_commerce/core/services/supa_base/supa_base_service.dart';
import 'package:riverpod_e_commerce/features/auth/login/data/model/auth_login_model.dart';
import 'package:riverpod_e_commerce/features/auth/login/domain/repo/login_repo.dart';

import 'sub_repo/execute_login_repo_impl.dart';

class LoginRepoImpl implements LoginRepo {
  @override
  Future<ApiResponse> login({required AuthLoginModel model}) {
    final ExecuteLoginRepoImpl executeLoginRepoImpl =
        ExecuteLoginRepoImpl(supaBaseService: SupaBaseService());
    return executeLoginRepoImpl.login(model);
  }
}
