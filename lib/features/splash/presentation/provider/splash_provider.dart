import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_e_commerce/main.dart';
import '../../data/model/splash_state_model.dart';
import '../../data/repo/splash_repo_impl.dart';
import '../../domain/use_case/get_local_user_data_use_case.dart';
import 'notifier/splash_notifier.dart';

final splashProvider =
    StateNotifierProvider<SplashNotifier, SplashStateModel>((ref) {
  final useCase = ref.watch(getUserLocalDataUseCaseProvider);
  // return SplashNotifier(repository)..initialServices();
  return SplashNotifier(getUserLocalDataUseCase: useCase)..initialServices(navigatorKey.currentContext!);
});
//useCase
final getUserLocalDataUseCaseProvider = Provider(
  (ref) => GetUserLocalDataUseCase(ref.watch(splashRepositoryProvider)),
);
//repo
final splashRepositoryProvider = Provider(
  (ref) => SplashRepoImpl(),
);
