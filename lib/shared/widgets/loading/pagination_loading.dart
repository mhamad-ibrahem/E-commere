import 'package:flutter/material.dart';

import 'loading_widget.dart';

class PaginationLoading extends StatelessWidget {
  const PaginationLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 25,
      width: 25,
      child: const LoadingWidget(),
    );
  }
}
