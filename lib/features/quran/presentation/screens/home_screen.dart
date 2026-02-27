import 'package:flutter/material.dart';
import 'package:quran_app/features/quran/presentation/widgets/body_section.dart';
import '../../../../core/constants/app_colors.dart';
import '../widgets/bottom_navbar.dart';
import '../widgets/header_section.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.emerald50,
              Colors.white,
            ],
          ),
        ),
        child: CustomScrollView(
          slivers: [
            _buildHeader(),
            _buildBody(),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavbar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }

  SliverAppBar _buildHeader() {
    return SliverAppBar(
      expandedHeight: 220,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      forceElevated: false,
      scrolledUnderElevation: 0,
      elevation: 0,
      pinned: true,
      flexibleSpace: const FlexibleSpaceBar(
        background: HeaderSection(),
      ),
    );
  }

  SliverList _buildBody() {
    return SliverList(
      delegate: SliverChildListDelegate(
        const [
          BodySection(),
        ],
      ),
    );
  }
}