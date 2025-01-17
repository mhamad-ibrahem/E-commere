import 'package:equatable/equatable.dart';
import 'package:riverpod_e_commerce/core/config/classes/status_request.dart';
import 'package:riverpod_e_commerce/features/home/data/model/home_slider_model.dart';

class HomeSlidersState extends Equatable {
  final StatusRequest statusRequest;
  final String errorMessage;
  final List<HomeSliderModel> sliders;

  const HomeSlidersState(
      {this.statusRequest = StatusRequest.none,
      this.errorMessage = '',
      this.sliders = const []});

  HomeSlidersState copyWith(
          {StatusRequest? statusRequest,
          String? errorMessage,
          List<HomeSliderModel>? sliders}) =>
      HomeSlidersState(
          statusRequest: statusRequest ?? this.statusRequest,
          errorMessage: errorMessage ?? this.errorMessage,
          sliders: sliders ?? this.sliders);
  @override
  List<Object?> get props => [sliders, statusRequest, errorMessage];
}
