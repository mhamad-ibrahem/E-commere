// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/services.dart';
// import '../../../shared/models/image_upload_model.dart';



// class ImageHelper {
//   static Future<ImageUploadModel> getImageData(
//       {required File uploadedImage}) async {
//     ImageUploadModel imageModel = ImageUploadModel(
//       data: await getLicenseData64(uploadedImage: uploadedImage),
//       extension: ".${uploadedImage.path.split('/').last.split('.')[1]}",
//       fileName: uploadedImage.path.split('/').last.split('.')[0],
//     );
//     return imageModel;
//   }

//   static Future<String> getLicenseData64({required File uploadedImage}) async {
//     String? licenseData64;
//     Uint8List bytes = await uploadedImage.readAsBytes();
//     licenseData64 = base64Encode(bytes);
//     return licenseData64;
//   }
// }
