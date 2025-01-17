import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../../../core/common/colors/app_colors.dart';
import '../../../../../../core/helper/key_board_helper.dart';
import '../../../../../../core/helper/validation/validations_errors.dart';
import '../../../../../../widgets/fields/custom_text_form_field.dart';
import '../../provider/login_provider.dart';

class LoginFormWidget extends HookConsumerWidget {
  const LoginFormWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(loginProvider.notifier);
    final providerWatch = ref.watch(loginProvider);
    final providerRead = ref.read(loginProvider.notifier);
    return Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: provider.formKey,
        child: Column(
          children: [
            SizedBox(height: 25.h),
            CustomTextFormField(
              hint: 'Email',
              isWhiteInput: true,
              focusNode: provider.emailFocusNode,
              inputType: TextInputType.emailAddress,
              textEditingController: provider.email,
              icon: Icon(
                Icons.email,
                color: AppColors().white,
                size: 20.w,
              ),
              validator: (value) {
                return ValidationHelper.validate(
                    value: value!,
                    validationType: ValidationType.email,
                    minValue: 1,
                    maxValue: 100);
              },
              onFieldSubmitted: (p0) {
                KeyBoardHelper.focusOnTextField(
                    context: context, focusNode: provider.passwordFocusNode);
              },
            ),
            SizedBox(height: 25.h),
            CustomTextFormField(
              focusNode: provider.passwordFocusNode,
              obscure: providerWatch.obscureForm,
              textEditingController: provider.password,
              hint: 'Password',
              isWhiteInput: true,
              icon: Icon(Icons.lock, color: AppColors().white, size: 20.w),
              validator: (value) {
                return ValidationHelper.validate(
                    value: value!,
                    validationType: ValidationType.password,
                    minValue: 6,
                    maxValue: 100);
              },
              suffixIcon: IconButton(
                  onPressed: () {
                    providerRead.changeObscure();
                  },
                  icon: Icon(
                    providerWatch.obscureForm
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: AppColors().white,
                    size: 22.w,
                  )),
            ),
            SizedBox(height: 15.h),
          ],
        ));
  }
}
