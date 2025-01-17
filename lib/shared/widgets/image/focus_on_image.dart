

focusOnImage({required String image ,bool isFileImage=false}) {
  // Get.dialog(Material(
  //   child: Stack(
  //     alignment: Alignment.topLeft,
  //     children: [
  //       PhotoView(
  //         imageProvider:!isFileImage? CachedNetworkImageProvider(image):FileImage(File(image))as ImageProvider,
  //         initialScale: PhotoViewComputedScale.contained,
  //         minScale: PhotoViewComputedScale.contained,
  //       ),
  //       Padding(
  //         padding: const EdgeInsets.all(12.0),
  //         child: Align(
  //           alignment:LocalizationHelper.isEnglishLanguage()? Alignment.topLeft:Alignment.topRight,
  //           child: IconButton(
  //               onPressed: () {
  //               },
  //               icon: Icon(
  //               Icons.arrow_back_ios_rounded,
  //                 color: AppColors().white,
  //                 size: 22.w,
  //               )),
  //         ),
  //       )
  //     ],
  //   ),
  // ));
}
