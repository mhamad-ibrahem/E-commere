import 'package:riverpod_e_commerce/core/helper/internet_functions/check_internet_connection.dart';
import 'package:riverpod_e_commerce/core/helper/log_helper/log_helper.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../features/auth/login/data/model/auth_login_model.dart';
import '../../../../features/auth/register/data/model/auth_register_model.dart';
import '../../../config/classes/api_response.dart';
import '../../../config/classes/status_request.dart';

mixin SupaBaseServiceAuth {
  final supabase = Supabase.instance.client;
  //MARK: SIGN UP
  /// Sign up with email and password
  ///
  /// Check if the user has internet connection, if true, then it will try to
  /// sign up with email and password, if failed, it will return failure response.
  /// If the user does not have internet connection, it will return offline failure response.
  ///
  /// Parameters:
  /// [model] : The model that contains the email and password.
  ///
  /// Returns:
  /// [ApiResponse] : It will return ApiResponse with [StatusRequest] of success
  /// if the sign up is successful, failure if the sign up is failed, and
  /// offline failure if the user does not have internet connection.
  Future<ApiResponse> sinUp(AuthRegisterModel model) async {
    if (await checkInternetConnection() == true) {
      try {
        AuthResponse data = await supabase.auth.signUp(
          email: model.email,
          password: model.password,
        );
        return ApiResponse(
            responseData: data, statusRequest: StatusRequest.success);
      } on AuthException catch (e) {
        LogHelper.logError("catch error $e");
        return ApiResponse(
            responseData: null,
            statusRequest: StatusRequest.failure,
            errorMessage: e.message.toString());
      }
    } else {
      return ApiResponse(
          responseData: null,
          statusRequest: StatusRequest.offlineFailure,
          errorMessage: "No internet connection");
    }
  }

  //MARK: SIGN IN
  Future<ApiResponse> login(AuthLoginModel model) async {
    if (await checkInternetConnection() == true) {
      try {
        AuthResponse data = await supabase.auth.signInWithPassword(
          email: model.email,
          password: model.password,
        );
        LogHelper.logSuccess("success");
        return ApiResponse(
            responseData: data, statusRequest: StatusRequest.success);
      } on AuthException catch (e) {
        LogHelper.logError("catch error $e");
        return ApiResponse(
            responseData: null,
            statusRequest: StatusRequest.failure,
            errorMessage:  e.message.toString());
      }
    } else {
      return ApiResponse(
          responseData: null,
          statusRequest: StatusRequest.offlineFailure,
          errorMessage: "No internet connection");
    }
  }

  //MARK: OTP SIGN IN
  /// Sign in with otp
  ///
  /// Check if the user has internet connection, if true, then it will try to
  /// sign in with otp, if failed, it will return failure response.
  /// If the user does not have internet connection, it will return offline failure response.
  ///
  /// Parameters:
  /// [email] : The email that you want to sign in with.
  ///
  /// Returns:
  /// [ApiResponse] : It will return ApiResponse with [StatusRequest] of success
  /// if the sign in is successful, failure if the sign in is failed, and
  /// offline failure if the user does not have internet connection.
  Future<ApiResponse> otpLogin(String email) async {
    if (await checkInternetConnection() == true) {
      try {
        await supabase.auth.signInWithOtp(email: email);
        return ApiResponse(
            responseData: null, statusRequest: StatusRequest.success);
      } on AuthException catch (e) {
        LogHelper.logError("catch error $e");
        return ApiResponse(
            responseData: null,
            statusRequest: StatusRequest.failure,
            errorMessage:  e.message.toString());
      }
    } else {
      return ApiResponse(
          responseData: null,
          statusRequest: StatusRequest.offlineFailure,
          errorMessage: "No internet connection");
    }
  }
}
