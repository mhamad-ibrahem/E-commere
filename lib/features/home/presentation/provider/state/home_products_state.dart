import 'package:equatable/equatable.dart';
import 'package:riverpod_e_commerce/core/config/classes/status_request.dart';
import 'package:riverpod_e_commerce/features/home/data/model/home_products_model.dart';

class HomeProductsState extends Equatable {
  final StatusRequest statusRequest;
  final String errorMessage;
  final List<HomeProductsModel> products;

  const HomeProductsState(
      {this.statusRequest = StatusRequest.none,
      this.errorMessage = '',
      this.products = const []});

  HomeProductsState copyWith(
          {StatusRequest? statusRequest,
          String? errorMessage,
          List<HomeProductsModel>? products}) =>
      HomeProductsState(
          statusRequest: statusRequest ?? this.statusRequest,
          errorMessage: errorMessage ?? this.errorMessage,
          products: products ?? this.products);
  @override
  List<Object?> get props => [products, statusRequest, errorMessage];
}
