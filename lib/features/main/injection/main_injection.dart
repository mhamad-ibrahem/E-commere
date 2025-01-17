import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../presentation/provider/main_notifier.dart';
import '../presentation/provider/state/main_state.dart';

final mainProvider = StateNotifierProvider<MainNotifier, MainState>((ref) {
  return MainNotifier();
});
