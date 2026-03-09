import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../domain/models/paged.dart';
import 'bounding_box.dart';



class QuranPage extends StatelessWidget {
  final String svgAsset;
  final List<PagedAyah> ayahs;
  final Function(PagedAyah) onTapAyah;

  const QuranPage({super.key, required this.svgAsset, required this.ayahs, required this.onTapAyah});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (ayahs.isEmpty) return const SizedBox.shrink();

        final int pageNumber = ayahs.first.page;

        double maxDesignX = 0;
        double maxDesignY = 0;

        for (var ayah in ayahs) {
          final rect = polygonToRect(ayah.polygon);
          if (rect.right > maxDesignX) maxDesignX = rect.right;
          if (rect.bottom > maxDesignY) maxDesignY = rect.bottom;
        }

        final double scaleX = constraints.maxWidth / maxDesignX;
        final double scaleY = constraints.maxHeight / maxDesignY;

        return Center(
          child: AspectRatio(
            aspectRatio: 0.707,
            child: Stack(
              children: [
                SvgPicture.asset(
                  svgAsset,
                  fit: BoxFit.contain,
                  alignment: pageNumber % 2 == 0
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  width: constraints.maxWidth,
                  height: constraints.maxHeight,
                ),
                ...ayahs.map((ayah) {
                  final rect = polygonToRect(ayah.polygon);

                  return Positioned(
                    left: rect.left * scaleX,
                    top: rect.top * scaleY,
                    width: rect.width * scaleX,
                    height: rect.height * scaleY,
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => onTapAyah(ayah),
                      child: Container(
                        color: Colors.transparent,
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        );
      },
    );
  }
}