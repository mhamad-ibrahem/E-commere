import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../../../core/common/colors/app_colors.dart';
import '../../../../../../core/helper/key_board_helper.dart';
import '../../../../../../core/helper/validation/validations_errors.dart';
import '../../../../../../widgets/fields/custom_text_form_field.dart';
import '../../provider/register_provider.dart';

class RegisterFormWidget extends HookConsumerWidget {
  const RegisterFormWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registerRead = ref.read(registerProvider.notifier);
    final registerWatch = ref.watch(registerProvider.notifier);
    final provider = ref.watch(registerProvider);
    return Form(
        key: registerWatch.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            SizedBox(height: 15.h),
            CustomTextFormField(
              isWhiteInput: true,
              textEditingController: registerWatch.name,
              hint: 'Name',
              onFieldSubmitted: (p0) {
                KeyBoardHelper.focusOnTextField(
                    context: context, focusNode: registerWatch.emailFocusNode);
              },
              icon: Icon(
                Icons.person,
                color: AppColors().white,
                size: 20.w,
              ),
              validator: (value) {
                return ValidationHelper.validate(
                    value: value!,
                    validationType: ValidationType.any,
                    minValue: 1,
                    maxValue: 100);
              },
            ),
            SizedBox(height: 15.h),
            CustomTextFormField(
              focusNode: registerWatch.emailFocusNode,
              isWhiteInput: true,
              textEditingController: registerWatch.email,
              inputType: TextInputType.emailAddress,
              hint: 'Email',
              onFieldSubmitted: (p0) {
                KeyBoardHelper.focusOnTextField(
                    context: context,
                    focusNode: registerWatch.passwordFocusNode);
              },
              icon: Icon(
                Icons.email,
                color: AppColors().white,
                size: 20.w,
              ),
              validator: (value) {
                return ValidationHelper.validate(
                    value: value!,
                    validationType: ValidationType.email,
                    minValue: 2,
                    maxValue: 100);
              },
            ),
            SizedBox(height: 15.h),
            CustomTextFormField(
                focusNode: registerWatch.passwordFocusNode,
                obscure: provider.obscureForm,
                textEditingController: registerWatch.password,
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
                    registerRead.changeObscure();
                  },
                  icon: Icon(
                    provider.obscureForm
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: AppColors().white,
                    size: 22.w,
                  ),
                )),
            SizedBox(height: 15.h),
          ],
        ));
  }
}
