import 'package:flutter/material.dart';
import 'package:quran_app/features/quran/presentation/widgets/continue_reading_card.dart';
import 'package:quran_app/features/quran/presentation/widgets/life_situation_finder.dart';
import 'package:quran_app/features/quran/presentation/widgets/quick_access.dart';
import 'package:quran_app/features/quran/presentation/widgets/reflection_journal.dart';
import 'package:quran_app/features/quran/presentation/widgets/study_plan_card.dart';
import 'package:quran_app/features/quran/presentation/widgets/verse_of_day_card.dart';






class BodySection extends StatelessWidget {
  const BodySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ContinueReadingCard(),
        DailyVerseCard(),
        LifeSituationCard(),
        StudyPlanCard(),
        SizedBox(height: 1),
        QuickAccess(),
        ReflectionJournalCard(),
      ],
    );
  }
}
