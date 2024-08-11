import 'package:flutter/material.dart';

class MovieDetailRow extends StatelessWidget {
  final String label;
  final String value;

  const MovieDetailRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Text(
              label,
              textAlign: TextAlign.left,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          const Text(
            ':  ',
            style: TextStyle(fontSize: 16),
          ),
          Expanded(
            flex: 4,
            child: Text(
              value,
              textAlign: TextAlign.left,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
