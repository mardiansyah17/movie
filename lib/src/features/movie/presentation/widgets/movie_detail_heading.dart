import 'package:flutter/material.dart';
import 'package:movie/src/core/theme/app_pallete.dart';

class MovieDetailHeading extends StatelessWidget {
  final String text;
  const MovieDetailHeading({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(bottom: 20),
      child: Text(
        text,
        style: const TextStyle(fontSize: 18, color: AppPallete.primary),
      ),
    );
  }
}
