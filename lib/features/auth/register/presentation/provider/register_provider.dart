import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../data/repo/register_repo_impl.dart';
import '../../domain/use_case/register_use_case.dart';
import 'notifier/register_notifier.dart';
import 'state/register_state.dart';

final registerProvider =
    StateNotifierProvider<RegisterNotifier, RegisterState>((ref) {
  return RegisterNotifier(ref.watch(registerUseCaseProvider));
});

//useCase
final registerUseCaseProvider = Provider(
  (ref) => RegisterUseCase(repo: ref.watch(registerRepoProvider)),
);
//repo
final registerRepoProvider = Provider(
  (ref) => RegisterRepoImpl(),
);
