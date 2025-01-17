import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_e_commerce/core/config/classes/api_response.dart';
import 'package:riverpod_e_commerce/core/config/classes/status_request.dart';
import '../../../domain/use_case/get_sales_products_use_case.dart';
import '../state/home_products_state.dart';

class GetSalesProductsNotifier extends StateNotifier<HomeProductsState> {
  GetSalesProductsNotifier(this.getSalesProductsUseCase)
      : super(const HomeProductsState());
  //MARK: VARIABLES
  final GetSalesProductsUseCase getSalesProductsUseCase;

  getSalesProducts() async {
    state = state.copyWith(statusRequest: StatusRequest.loading);
    ApiResponse response = await getSalesProductsUseCase.execute();
    state = state.copyWith(
      statusRequest: response.statusRequest,
      errorMessage: response.errorMessage,
    );
    if (response.statusRequest == StatusRequest.success) {
      state = state.copyWith(products: response.responseData);
    }
  }
}
