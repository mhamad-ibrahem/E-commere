import 'package:riverpod_e_commerce/core/config/classes/api_response.dart';

import '../../../../core/services/supa_base/supa_base_service.dart';
import '../../domain/repo/home_repo.dart';
import 'sub_repo/get_sales_products_repo_impl.dart';
import 'sub_repo/get_sliders_repo_impl.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future<ApiResponse> getSliders() {
    final GetSlidersRepoImpl getSlidersRepoImpl =
        GetSlidersRepoImpl(supaBaseService: SupaBaseService());
    return getSlidersRepoImpl.getData();
  }

  @override
  Future<ApiResponse> getSalesProduct() {
    final GetSalesProductsRepoImpl getSalesProductsRepoImpl =
        GetSalesProductsRepoImpl(supaBaseService: SupaBaseService());
    return getSalesProductsRepoImpl.getData();
  }
}
