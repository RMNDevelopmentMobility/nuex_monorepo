import 'package:feeds_module/src/feeds/presenter/feeds/controller/feeds_controller.dart';
import 'package:feeds_module/src/feeds/presenter/feeds/pages/feeds_error_page.dart';
import 'package:feeds_module/src/feeds/presenter/feeds/pages/feeds_loading_page.dart';
import 'package:feeds_module/src/feeds/presenter/feeds/pages/feeds_page.dart';
import 'package:flutter/material.dart';

class FeedsContainer extends StatelessWidget {
  const FeedsContainer({Key? key, required this.controller}) : super(key: key);
  final IFeedsController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        if (controller.isLoading) {
          return const FeedsLoadingPage();
        }

        if (controller.hasError) {
          return FeedsErrorPage(
            error: controller.error,
            //onRefresh: controller.fetchList,
          );
        }

        return FeedsPage(
          list: controller.list,
          //onRefresh: () => controller.fetchList(isError: true),
        );
      },
    );
  }
}
