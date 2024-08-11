import 'package:flutter/material.dart';

class MovieDetailActorItem extends StatelessWidget {
  const MovieDetailActorItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(8),
      width: 200,
      child: Container(
        padding: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 45, 53, 62),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF000000).withOpacity(0.1),
                offset: const Offset(0, 2),
                blurRadius: 6,
                spreadRadius: 2,
              ),
            ]),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/dr_strange.png',
                height: 180,
              ),
            ),
            const SizedBox(height: 10),
            const Text("data")
          ],
        ),
      ),
    );
  }
}
