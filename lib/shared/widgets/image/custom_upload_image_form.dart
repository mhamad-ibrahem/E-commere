import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/common/colors/app_colors.dart';
import '../../../core/common/size/app_size.dart';
import '../../../core/config/app_config.dart';
import 'custom_cached_net_image.dart';
import 'focus_on_image.dart';

class CustomUploadImageForm extends StatelessWidget {
  const CustomUploadImageForm(
      {super.key,
      required this.file,
      this.uploadImage,
      this.deleteImage,
      this.changeImage,
      this.image});
  final File? file;
  final String? image;
  final void Function()? uploadImage;
  final void Function()? deleteImage;
  final void Function()? changeImage;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       onTap: uploadImage,
      child: DottedBorder(
          color: Theme.of(context).primaryColor,
          borderType: BorderType.RRect,
          radius: const Radius.circular(6),
          dashPattern: const [6, 3],
          child: SizedBox(
            width: AppSize.screenWidth(context: context),
            height: file != null ? 100.h : null,
            child: file == null
                ? GestureDetector(
                    onTap: uploadImage,
                    child: image == null
                        ? Column(children: [
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              'Upload Image',
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.copyWith(fontSize: 12.sp),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            SizedBox(
                              height: 25.h,
                              width: 32.w,
                              child: Icon(
                                Icons.upload_file_outlined,
                                size: 24.w,
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                          ])
                        : Row(
                            children: [
                              Expanded(
                                flex: 3,
                                  child: Padding(
                                    padding:  EdgeInsets.symmetric(vertical: 5.h,horizontal: 10.w),
                                    child: CustomCachedNetImage(
                                        imageUrl:
                                            "${AppConfig.baseImageUrl}/$image"),
                                  )),
                              Expanded(
                                  child: Column(children: [
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(
                                  'Upload Image',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall
                                      ?.copyWith(fontSize: 12.sp),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                SizedBox(
                                  height: 25.h,
                                  width: 32.w,
                                  child: Icon(
                                    Icons.upload_file_outlined,
                                    size: 24.w,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                              ]))
                            ],
                          ))
                : Row(
                    children:
                     [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        height: 60.h,
                        width: 60.w,
                        child: Image.file(
                          File(
                            file!.path,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.h, vertical: 10.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                                onTap: changeImage,
                                child: Text(
                                  "Replace Image",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall
                                      ?.copyWith(
                                          color: AppColors().green,
                                          fontSize: 12.sp),
                                )),
                            SizedBox(
                              height: 5.h,
                            ),
                            GestureDetector(
                                onTap: deleteImage,
                                child: Text(
                                  "Delete Image",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall!
                                      .copyWith(
                                          color: AppColors().red,
                                          fontSize: 12.sp),
                                )),
                            SizedBox(
                              height: 5.h,
                            ),
                            GestureDetector(
                                onTap: () {
                                  focusOnImage(
                                      image: file!.path, isFileImage: true);
                                },
                                child: Text(
                                  "View Full Image",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall
                                      ?.copyWith(fontSize: 12.sp),
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
          )),
    );
  }
}
