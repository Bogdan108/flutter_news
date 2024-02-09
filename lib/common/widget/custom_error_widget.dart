import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget(this.exception, {super.key});

  final String exception;

  @override
  Widget build(BuildContext context) => Text(
        exception,
        style: const TextStyle(color: Colors.white, fontSize: 25),
      );
}
