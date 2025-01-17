import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../data/repo/home_repo_impl.dart';
import '../../domain/use_case/get_sales_products_use_case.dart';
import '../../domain/use_case/get_sliders_use_case.dart';
import 'notifier/get_sales_products_notifier.dart';
import 'notifier/home_notifier.dart';
import 'state/home_products_state.dart';
import 'state/home_sliders_state.dart';

//MARK: Providers
final homeProvider =
    StateNotifierProvider<HomeNotifier, HomeSlidersState>((ref) {
  return HomeNotifier(ref.watch(getSlidersUseCaseProvider))..getSliders();
});
final salesProductsProvider =
    StateNotifierProvider<GetSalesProductsNotifier, HomeProductsState>((ref) {
  return GetSalesProductsNotifier(ref.watch(getSalesProductsUseCaseProvider))
    ..getSalesProducts();
});

//MARK: useCase
final getSlidersUseCaseProvider = Provider(
  (ref) => GetSlidersUseCase(repo: ref.watch(homeRepoProvider)),
);
final getSalesProductsUseCaseProvider = Provider(
  (ref) => GetSalesProductsUseCase(repo: ref.watch(homeRepoProvider)),
);

//MARK: repo
final homeRepoProvider = Provider(
  (ref) => HomeRepoImpl(),
);
