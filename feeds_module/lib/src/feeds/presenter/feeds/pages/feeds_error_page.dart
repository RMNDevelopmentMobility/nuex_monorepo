import 'package:flutter/material.dart';

class FeedsErrorPage extends StatelessWidget {
  const FeedsErrorPage({Key? key, required this.error}) : super(key: key);
  final String error;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(error),
      ),
    );
  }
}
