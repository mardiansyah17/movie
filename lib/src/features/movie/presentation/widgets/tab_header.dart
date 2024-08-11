import 'package:flutter/material.dart';

class TabHeader extends StatelessWidget {
  const TabHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Sedang tayang",
          style: TextStyle(fontSize: 18),
        ),
        Text("Semua"),
      ],
    );
  }
}
