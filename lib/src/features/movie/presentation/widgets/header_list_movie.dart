import 'package:flutter/material.dart';
import 'package:movie/src/core/theme/app_pallete.dart';

class HeaderListMovie extends StatelessWidget {
  final String title;
  const HeaderListMovie({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18),
          ),
          const Row(
            children: [
              Text(
                "Semua",
                style: TextStyle(color: AppPallete.primary),
              ),
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: AppPallete.primary,
                size: 14,
              )
            ],
          ),
        ],
      ),
    );
  }
}
