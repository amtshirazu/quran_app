import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quran_app/features/azkaar_and_dua/presentation/widgets/azkaar/azkaar_dua_appbar.dart';
import 'package:quran_app/features/azkaar_and_dua/presentation/widgets/azkaar/benefits_card.dart';
import 'package:quran_app/features/azkaar_and_dua/presentation/widgets/azkaar/remembrance_card.dart';
import 'package:quran_app/features/azkaar_and_dua/presentation/widgets/azkaar/selection_card.dart';

class AzkaarDuaScreen extends StatelessWidget {
  const AzkaarDuaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const AzkaarDuaAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const RemembranceCard(),

            // AZKAAR SELECTION
            SelectionCard(
              title: 'Azkaar',
              subtitle:
                  'Remembrance and phrases from the Sunnah to say throughout your day',
              icon: Icons.auto_awesome_rounded,
              tags: const ['Morning & Evening', 'After Salah', 'Before Sleep'],
              onTap: () {
                context.push('/azkaarCategories');
              },
            ),

            // DUA SELECTION
            SelectionCard(
              title: 'Duas',
              subtitle: 'Supplications from the Holy Quran for every need',
              icon: Icons.menu_book_rounded,
              tags: const [
                'Prophetic (Rabbana)',
                'For Success',
                'For Protection',
              ],
              onTap: () {
                context.push('/duas');
              },
            ),

            const BenefitsCard(),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
