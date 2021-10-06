import 'package:flutter/material.dart';

class FeedsLoadingPage extends StatelessWidget {
  const FeedsLoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: CircularProgressIndicator(),
    ));
  }
}
