import 'package:flutter/material.dart';

import '../../loading/loading_widget.dart';

class CustomLoadingWithHeight extends StatelessWidget {
  const CustomLoadingWithHeight({super.key, this.height});
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        SizedBox(
          height: height,
        ),
        const LoadingWidget()
      ]),
    );
  }
}
