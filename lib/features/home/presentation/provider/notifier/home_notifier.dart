
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_e_commerce/core/config/classes/api_response.dart';
import 'package:riverpod_e_commerce/core/config/classes/status_request.dart';
import '../../../domain/use_case/get_sliders_use_case.dart';
import '../state/home_sliders_state.dart';

class HomeNotifier extends StateNotifier<HomeSlidersState> {
  HomeNotifier(this.getSlidersUseCase) : super(const HomeSlidersState());
  //MARK: VARIABLES
  final GetSlidersUseCase getSlidersUseCase;

  getSliders() async {
    state = state.copyWith(statusRequest: StatusRequest.loading);
    ApiResponse response = await getSlidersUseCase.execute();
    state = state.copyWith(
      statusRequest: response.statusRequest,
      errorMessage: response.errorMessage,
    );
    if (response.statusRequest == StatusRequest.success) {
      state = state.copyWith(sliders: response.responseData);
    }
  }
}
