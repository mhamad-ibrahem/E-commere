import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../../shared/widgets/handle_status/handling_data_request.dart';
import '../../provider/home_provider.dart';
import '../widgets/home_banner_widget.dart';
import '../widgets/home_new_product_widget.dart';
import '../widgets/home_sale_widget.dart';
import '../widgets/home_special_product_widget.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(homeProvider);
    final providerRead = ref.read(homeProvider.notifier);
    return HandlingDataRequest(
      statusRequest: provider.statusRequest,
      message: provider.errorMessage,
      retryFunction: () {
        providerRead.getSliders();
      },
      child: const SingleChildScrollView(
        child: Column(
          children: [
            HomeBannerWidget(),
            HomeSaleWidget(),
            HomeNewProductWidget(),
            HomeSpecialProductWidget(),
          ],
        ),
      ),
    );
  }
}
