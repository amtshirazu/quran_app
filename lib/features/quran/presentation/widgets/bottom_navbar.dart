import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import '../../../../core/constants/app_colors.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({
    super.key,
    required this.onTap,
    required this.currentIndex,
  });

  final Function(int) onTap;
  final int currentIndex;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 8, bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: AppColors.gray200, width: 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          _NavItem(
              icon: LucideIcons.bookOpen,
              text: "Read",
              onTap: () => onTap(0),
              isActive: currentIndex == 0,
          ),

          _NavItem(
            icon: LucideIcons.headphones,
            text: "Audio",
            onTap: () => onTap(1),
            isActive: currentIndex == 1,
          ),

          _NavItem(
            icon: LucideIcons.search,
            text: "Search",
            onTap: () => onTap(2),
            isActive: currentIndex == 2,
          ),

          _NavItem(
            icon: LucideIcons.settings,
            text: "Settings",
            onTap: () => onTap(3),
            isActive: currentIndex == 3,
          ),

        ]
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
    required this.isActive,
  });

  final IconData icon;
  final String text;
  final VoidCallback? onTap;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final color = isActive ? AppColors.emerald600 : AppColors.gray600;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 24),
          SizedBox(height: 4),
          Text(text, style: TextStyle(color: color, fontSize: 15)),
        ],
      ),
    );
  }
}
