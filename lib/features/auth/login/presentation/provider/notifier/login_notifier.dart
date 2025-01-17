import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_e_commerce/core/config/classes/api_response.dart';
import 'package:riverpod_e_commerce/core/config/classes/status_request.dart';
import 'package:riverpod_e_commerce/core/helper/log_helper/log_helper.dart';
import 'package:riverpod_e_commerce/core/routes/app_router.dart';
import 'package:riverpod_e_commerce/shared/widgets/loading/loading_dialog.dart';
import 'package:riverpod_e_commerce/shared/widgets/toast/cherry_toast.dart';
import '../../../../../../core/routes/constant/app_routes.dart';
import '../../../data/model/auth_login_model.dart';
import '../../../domain/use_case/login_use_case.dart';
import '../state/login_state.dart';

class LoginNotifier extends StateNotifier<LoginState> {
  LoginNotifier(this.loginUseCase) : super(const LoginState());
  //MARK: VARIABLES
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final LoginUseCase loginUseCase;
  changeObscure() {
    state = state.copyWith(obscureForm: !state.obscureForm);
  }

  login(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      showLoadingDialog(context: context);
      ApiResponse response = await loginUseCase
          .execute(AuthLoginModel(email: email.text, password: password.text));
      if (context.mounted) {
        AppRouter.back(context: context);
      }
      LogHelper.logCyan("StatusRequest IS ${response.statusRequest}");
      if (response.statusRequest == StatusRequest.success) {
        if (context.mounted) {
          AppRouter.navigateOffAllNamed(
              context: context, routeName: AppRoutes().mainRoute);
        }
        AppCherryToast.showSuccessToast(message: "Login successfully");
      }
    }
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }
}
