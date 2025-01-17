import 'package:equatable/equatable.dart';

import '../../../../core/config/classes/status_request.dart';

class SplashStateModel extends Equatable {
  final StatusRequest statusRequest;

  const SplashStateModel({this.statusRequest = StatusRequest.none});

  SplashStateModel copyWith({
    StatusRequest? statusRequest,
  }) {
    return SplashStateModel(statusRequest: statusRequest ?? this.statusRequest);
  }

  @override
  List<Object?> get props => [statusRequest];
}
