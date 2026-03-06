import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:quran_app/features/audio/presentation/widgets/reciter_audio_widgets/player_card_buttons.dart';

import '../../../../../core/constants/app_colors.dart';






class PlayerCard extends ConsumerStatefulWidget {
  const PlayerCard({super.key});

  @override
  ConsumerState<PlayerCard> createState() => PlayerCardState();
}

class PlayerCardState extends ConsumerState<PlayerCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Container(
              height: 220,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.emerald100,
                    AppColors.emerald50,
                    Colors.white
                  ],
                ),
              ),

              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Al-Fatiha",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(
                        "الفاتحة",
                        style: TextStyle(fontSize: 40),
                      ),
                    ),
                    SizedBox(height: 6),
                    Chip(label: Text("The Opening")),
                    SizedBox(height: 6),
                    Text(
                      "Surah 1 • 7 Verses",
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [

                  /// PROGRESS BAR
                  Column(
                    children: [
                      Slider(
                        value: 20,
                        max: 100,
                        onChanged: (value) {},
                      ),
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("0:20",
                              style: TextStyle(color: Colors.grey)),
                          Text("4:25",
                              style: TextStyle(color: Colors.grey)),
                        ],
                      )
                    ],
                  ),

                  const SizedBox(height: 20),

                  /// CONTROLS
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                            LucideIcons.repeat,
                        ),
                      ),

                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                            LucideIcons.skipBack,
                        ),
                      ),

                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.emerald600,
                        ),
                        child: IconButton(
                          icon: Icon(
                            LucideIcons.play,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                      ),

                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          LucideIcons.skipForward,
                        ),
                      ),

                      IconButton(
                        onPressed: () {},
                        icon:  Icon(
                            LucideIcons.volume,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),


                  Row(
                    children: [
                       Icon(
                          LucideIcons.volume,
                          color: AppColors.gray200,
                       ),
                      Expanded(
                        child: Slider(
                          value: 70,
                          max: 100,
                          onChanged: (value) {},
                        ),
                      ),
                      const Text(
                        "70%",
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),

                  const SizedBox(height: 10),

                  Row(
                    children: [
                      Expanded(
                        child: PlayerCardButtons(
                          icon: LucideIcons.share,
                          text: "Share",
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: PlayerCardButtons(
                          icon: LucideIcons.download,
                          text: "Download",
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      );
  }
}
