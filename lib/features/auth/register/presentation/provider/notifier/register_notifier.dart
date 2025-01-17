import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_e_commerce/core/config/classes/api_response.dart';
import 'package:riverpod_e_commerce/core/config/classes/status_request.dart';
import 'package:riverpod_e_commerce/core/routes/app_router.dart';
import 'package:riverpod_e_commerce/shared/widgets/loading/loading_dialog.dart';
import 'package:riverpod_e_commerce/shared/widgets/toast/cherry_toast.dart';
import '../../../data/model/auth_register_model.dart';
import '../../../domain/use_case/register_use_case.dart';
import '../state/register_state.dart';

class RegisterNotifier extends StateNotifier<RegisterState> {
  RegisterNotifier(this.registerUseCase) : super(const RegisterState());
  //MARK: VARIABLES
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final RegisterUseCase registerUseCase;
  changeObscure() {
    state = state.copyWith(obscureForm: !state.obscureForm);
  }

  register(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      showLoadingDialog(context: context);
      ApiResponse response = await registerUseCase
          .execute(AuthRegisterModel(email: email.text, password: password.text));
      if (context.mounted) {
        AppRouter.back(context: context);
      }
      if (response.statusRequest == StatusRequest.success) {
        AppCherryToast.showSuccessToast(message: "Register successfully");
      }
    }
  }
//MARK: DISPOSE
  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }
}
