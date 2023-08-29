import 'package:flutter/material.dart';

class AdditionalInforItem extends StatelessWidget {
  final String infoLabel;
  final String infoValue;
  final IconData icon;

  const AdditionalInforItem({
    super.key,
    required this.infoLabel,
    required this.infoValue,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 8,
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: 32,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            infoLabel,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            infoValue,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
