import 'package:bookly_app/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/presentation/views/home_view.dart';
import '../../features/search/presentation/views/search_view.dart';

abstract class AppRouter{
  static const  kHomeView='/HomeView';
  static const  kSearchView='/SearchView';
  static final router=GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) =>const SplashView(),
        ),
        GoRoute(
          path: kHomeView,
          builder: (context, state) =>const HomeView(),
          ),
          GoRoute(
            path: kSearchView,
            builder: (context, state) => const SearchView(),
          )

    ]
  );
}