import 'package:go_router/go_router.dart';
import 'package:quran_app/features/quran/presentation/screens/surah_detail_screen.dart';
import 'package:quran_app/features/quran/presentation/widgets/ayah_details_widget/header_section.dart';
import '../../features/quran/presentation/screens/home_screen.dart';
import '../../features/quran/presentation/screens/read_quran_screen.dart';
import '../../features/quran/presentation/screens/settings_screen.dart';





class AppRouter {

      static final GoRouter goRouter = GoRouter (
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/surahs',
            builder: (context, state) => const ReadQuranScreen(),
          ),
          GoRoute(
            path: '/readAyah',
            builder: (context, state) => const SurahDetailScreen(),
          ),
          GoRoute(
            path: '/search',
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/settings',
            builder: (context, state) => const SettingsScreen(),
          ),
          GoRoute(
            path: '/about',
            builder: (context, state) => const HomeScreen(),
          ),
        ]
      );
}