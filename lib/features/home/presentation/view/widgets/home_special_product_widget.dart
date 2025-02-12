import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/size/app_size.dart';
import '../../../../../shared/widgets/product_card/shared_product_card_widget.dart';
import 'custom/custom_home_sections_title_widget.dart';

class HomeSpecialProductWidget extends StatelessWidget {
  const HomeSpecialProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 30.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomHomeSectionsTitleWidget(
            title: 'Special',
            subtitle: 'Special products for you',
          ),
          SizedBox(
            height: 270.h,
            width: AppSize.screenWidth(context: context),
            child: ListView.separated(
              itemCount: 7,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => SharedProductCardWidget(),
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: 10.w,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
