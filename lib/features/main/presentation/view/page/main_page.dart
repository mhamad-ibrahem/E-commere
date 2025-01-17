import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../injection/main_injection.dart';
import '../widget/main_nav_bar.dart';

class MainPage extends HookConsumerWidget {
  const MainPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(mainProvider.notifier);
    return Scaffold(
        bottomNavigationBar: const MainNavBar(),
        body: AnimatedScale(
          scale: provider.currentSize,
          duration: const Duration(milliseconds: 400),
          child: provider.mainPages[provider.mainNavBarIndex],
        ));
  }
}
