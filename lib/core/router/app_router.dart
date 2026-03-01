import 'package:go_router/go_router.dart';
import '../../features/quran/presentation/screens/home_screen.dart';
import '../../features/quran/presentation/screens/read_quran_screen.dart';





class AppRouter {

      static final GoRouter goRouter = GoRouter (
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/surah',
            builder: (context, state) => const ReadQuranScreen(),
          ),
          GoRoute(
            path: '/tafseer',
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/search',
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/settings',
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/about',
            builder: (context, state) => const HomeScreen(),
          ),
        ]
      );
}