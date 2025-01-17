
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/common/assets/app_assets.dart';
import '../../../../core/common/colors/app_colors.dart';
import '../../../../core/common/size/app_size.dart';
import '../../../../core/config/classes/status_request.dart';
import '../../../../widgets/buttons/custom_button.dart';
import '../../image/svg_image_widget.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key,
    this.onTap,
    required this.statusRequest,
    required this.message,
    this.iconsSize,
  });
  final void Function()? onTap;
  final StatusRequest statusRequest;
  final String message;
  final double? iconsSize;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: AppSize.screenWidth(context: context),
          ),
          SvgAssetImageWidget(
            image: isOfflineError(statusRequest)
                ? AppAssets().errorNoInternet
                : isTimeoutError(statusRequest)
                    ? AppAssets().errorTimeout
                    : isUnAuthorized(statusRequest)
                        ? AppAssets().error401
                        : isOfflineForbidden(statusRequest)
                            ? AppAssets().error403
                            : isInternalServerError(statusRequest)
                                ? AppAssets().error500
                                : isNotFound(statusRequest)
                                    ? AppAssets().error404
                                    : AppAssets().error400,
            height: 300.h,
            width: 300.w,
            fit: BoxFit.cover,
          ),
          Text(
            message,
            style: Theme.of(context).textTheme.displayMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10.h,
          ),
          CustomButton(
              buttonWidth: 150.w,
              buttonColor: AppColors().lRed,
              buttonBody: 'Retry',
              onTap: onTap),
        ],
      ),
    );
  }
}

bool isOfflineError(StatusRequest statusRequest) {
  bool value = (statusRequest == StatusRequest.offlineFailure);
  return value;
}

bool isTimeoutError(StatusRequest statusRequest) {
  bool value = (statusRequest == StatusRequest.timeOutFailure);
  return value;
}

bool isOfflineForbidden(StatusRequest statusRequest) {
  bool value = (statusRequest == StatusRequest.forbiddenFailure);
  return value;
}

bool isUnAuthorized(StatusRequest statusRequest) {
  bool value = (statusRequest == StatusRequest.authorizedFailure);
  return value;
}

bool isInternalServerError(StatusRequest statusRequest) {
  bool value = (statusRequest == StatusRequest.internalServerError);
  return value;
}

bool isNotFound(StatusRequest statusRequest) {
  bool value = (statusRequest == StatusRequest.serverOnRepair);
  return value;
}
