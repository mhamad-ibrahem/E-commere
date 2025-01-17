import '../../../../../core/config/classes/api_response.dart';
import '../../../../core/useCases/no_params_use_case.dart';
import '../repo/home_repo.dart';

class GetSlidersUseCase extends NoParamUseCase<ApiResponse> {
  final HomeRepo _repo;

  GetSlidersUseCase({required HomeRepo repo}) : _repo = repo;

  @override
  Future<ApiResponse> execute() {
    return _repo.getSliders();
  }
}
