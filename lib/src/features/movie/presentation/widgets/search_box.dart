import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Cari film",
        hintStyle: const TextStyle(color: Color(0xff67686D)),
        contentPadding: const EdgeInsets.only(left: 10),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(16)),
        fillColor: const Color(0xff3A3F47),
        filled: true,
      ),
    );
  }
}
