import 'package:flutter/material.dart';
import 'package:quran_app/features/prayer_times/presentation/widgets/prayer_times_header.dart';
import 'package:quran_app/features/prayer_times/presentation/widgets/prayer_times_list.dart';

class PrayerTimesScreen extends StatelessWidget {
  const PrayerTimesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const PrayerTimesHeader(),
      body: const PrayerTimesList(),
    );
  }
}
