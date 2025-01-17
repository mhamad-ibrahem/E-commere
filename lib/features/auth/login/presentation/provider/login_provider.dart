import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/repo/login_repo_impl.dart';
import '../../domain/use_case/login_use_case.dart';
import 'notifier/login_notifier.dart';
import 'state/login_state.dart';

final loginProvider = StateNotifierProvider<LoginNotifier, LoginState>((ref) {
  return LoginNotifier(ref.watch(loginUseCaseProvider));
});

//useCase
final loginUseCaseProvider = Provider(
  (ref) => LoginUseCase(repo: ref.watch(loginRepoProvider)),
);
//repo
final loginRepoProvider = Provider(
  (ref) => LoginRepoImpl(),
);
