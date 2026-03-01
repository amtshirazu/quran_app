import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';



class NextPrayerCard extends StatelessWidget {
  const NextPrayerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: AppColors.emerald500,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.access_time,
                    color: Colors.white),
              ),
              const SizedBox(width: 12),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Next Prayer",
                      style: TextStyle(
                          color: AppColors.emerald100,
                          fontSize: 12)),
                  Text("Dhuhr",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600)),
                ],
              ),
            ],
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("12:30 PM",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold)),
              Text("in 2h 15m",
                  style: TextStyle(
                      color: AppColors.emerald100,
                      fontSize: 12)),
            ],
          )
        ],
      ),
    );
  }
}