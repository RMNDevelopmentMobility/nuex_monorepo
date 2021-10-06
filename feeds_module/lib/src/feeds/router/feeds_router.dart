import 'package:dependency_module/dependency_module.dart';
import 'package:feeds_module/src/feeds/domain/usecases/feeds_usecase.dart';
import 'package:feeds_module/src/feeds/presenter/feeds/controller/feeds_controller.dart';
import 'package:feeds_module/src/feeds/presenter/feeds/container/feeds_container.dart';
import 'package:flutter/material.dart';

class FeedsRouter extends StatelessWidget {
  const FeedsRouter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usecase = Modular.get<FeedsUsecase>();

    return FeedsContainer(
      controller: FeedsController(
        usecase: usecase,
      )..fetchList(),
    );
  }

  // Future<void> _showErrorDialog(String error, BuildContext context) async {
  //   await showDialog(
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: Text(error),
  //           actions: [
  //             TextButton(
  //                 onPressed: () {
  //                   Navigator.pop(context);
  //                 },
  //                 child: const Text('Ok'))
  //           ],
  //         );
  //       },
  //       context: context);
  // }
}
