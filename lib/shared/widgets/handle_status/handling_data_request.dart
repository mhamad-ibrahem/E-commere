import 'package:flutter/material.dart';
import '../../../core/config/classes/status_request.dart';
import '../loading/loading_widget.dart';
import 'sub_widget/custom_error_widget.dart';
import 'sub_widget/custom_error_with_hieght.dart';
import 'sub_widget/custom_loading_with_hieght.dart';

class HandlingDataRequest extends StatelessWidget {
  const HandlingDataRequest(
      {super.key,
      required this.statusRequest,
      required this.retryFunction,
      required this.child,
      this.height,
      required this.message});
  final StatusRequest statusRequest;
  final void Function() retryFunction;
  final Widget child;
  final double? height;
  final String message;
  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? const Center(child: LoadingWidget())
        : (statusRequest == StatusRequest.success ||
                statusRequest == StatusRequest.none)
            ? child
            : statusRequest == StatusRequest.loadingPartOfPage
                ? CustomLoadingWithHeight(
                    height: height,
                  )
                : statusRequest == StatusRequest.errorPartOfPage
                    ? CustomErrorWithHeight(
                        message: message,
                        statusRequest: statusRequest,
                      )
                    : CustomErrorWidget(
                        statusRequest: statusRequest,
                        message: message,
                        onTap: retryFunction,
                      );
  }
}
