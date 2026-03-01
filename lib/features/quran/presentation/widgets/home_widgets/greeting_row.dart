import 'package:flutter/material.dart';
import '../../../../../core/constants/app_colors.dart';


class GreetingRow extends StatelessWidget {
  const GreetingRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "As-Salamu Alaykum",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              "May peace be upon you",
              style: TextStyle(
                color: AppColors.emerald100,
                fontSize: 13,
              ),
            ),
          ],
        ),

        Container(
          width: 48,
          height: 48,
          decoration: const BoxDecoration(
            color: AppColors.emerald500,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: const Text("👤", style: TextStyle(fontSize: 18)),
        )
      ],
    );
  }
}