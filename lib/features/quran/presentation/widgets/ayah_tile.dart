import 'package:flutter/material.dart';
import '../../domain/models/ayah.dart';
import '../../domain/models/translation.dart';
import '../state/reading_mode.dart';

class AyahTile extends StatelessWidget {
  final Ayah ayah;
  final Translation? translation;
  final ReadingMode mode;

  const AyahTile({
    super.key,
    required this.ayah,
    this.translation,
    required this.mode,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            ayah.text,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
            style: const TextStyle(
              fontSize: 26,
              height: 1.8,
            ),
          ),

          if (mode == ReadingMode.translation &&
              translation != null) ...[
            const SizedBox(height: 10),
            Text(
              translation!.text,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ],
      ),
    );
  }
}