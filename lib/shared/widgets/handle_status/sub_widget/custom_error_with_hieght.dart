import 'package:flutter/material.dart';

import '../../../../core/config/classes/status_request.dart';
import 'custom_error_widget.dart';

class CustomErrorWithHeight extends StatelessWidget {
  const CustomErrorWithHeight({super.key, this.height, this.onTap, required this.statusRequest, required this.message, this.iconsSize});
  final double? height;
  final void Function()? onTap;
  final StatusRequest statusRequest;
  final String message;
  final double? iconsSize;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        SizedBox(
          height: height,
        ),
        CustomErrorWidget(
          statusRequest: statusRequest,
          iconsSize: iconsSize,
          message: message,
          onTap: onTap,
        )
      ]),
    );
  }
}
