import 'package:bookly_app/features/home/presentation/data/repos/home_repo_imp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'constants.dart';
import 'core/utils/bloc_observer.dart';
import 'core/utils/service_locator.dart';
import 'core/utils/app_router.dart';
import 'features/home/presentation/manager/featured_books_cubit/featured_book_cubit.dart';
import 'features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';

void main() {
  setupServiceLocator();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBookCubit(homeRepo:getIt.get<HomeRepoImpl>() ,
        )..featchFeaturedBooks()
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(homeRepo:getIt.get<HomeRepoImpl>() ,
        )..featchNewestdBooks()
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: kPrimaryColor),
      ),
    );
  }
}
