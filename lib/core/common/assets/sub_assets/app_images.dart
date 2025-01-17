mixin AppImages {
  String get imageRout => 'assets/images';
  //main
  String get banner => '$imageRout/main.png';
  String get productImage => '$imageRout/photo.png';
  String get favoriteProductImage => '$imageRout/favorite_product.png';
  //login
  String get authBackground => '$imageRout/auth_background.png';
  //orders
  String get successShipping => '$imageRout/image.png';
  String get finishShipping => '$imageRout/bags.png';
  String get paymentCard => '$imageRout/pay_card.jpg';
  String get visaCardImage => '$imageRout/visa2.png';
  //api errors
  String get error400 => '$imageRout/400 Error Bad Request-bro.svg';
  String get error401 => '$imageRout/401 Error Unauthorized-rafiki.svg';
  String get error403 => '$imageRout/403 Error Forbidden-pana.svg';
  String get error404 =>
      '$imageRout/404 Error Page not Found with people connecting a plug-pana.svg';
  String get error500 => '$imageRout/500 Internal Server Error-amico.svg';
  String get errorTimeout => '$imageRout/504 Error Gateway Timeout-amico.svg';
  String get errorNoInternet => '$imageRout/No connection-bro.svg';
  String get noData => '$imageRout/No data-amico.svg';
}
