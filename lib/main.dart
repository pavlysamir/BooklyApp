import 'package:bookly_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/Features/home/domain/usecases/fetch_feature_books_use_case.dart';
import 'package:bookly_app/Features/home/domain/usecases/fetch_feature_newest_books_use_case.dart';
import 'package:bookly_app/Features/home/presentation/managers/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/managers/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/functions/setup_service_locator.dart';

void main() async {
  await Hive.initFlutter();
  setUpServiceLocator();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(kFeaturedBox);
  await Hive.openBox<BookEntity>(kNewsBox);
  Bloc.observer = SimpleBlocObserver();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return FeaturedBooksCubit(
              FetchFeatureBooksUseCase(
                getIt.get<HomeRepoImpl>(),
              ),
            )..fetchFeaturedBooks();
          },
        ),
        BlocProvider(
          create: (context) {
            return NewestBooksCubit(
              FetchNewestFeatureBooksUseCase(
                getIt.get<HomeRepoImpl>(),
              ),
            )..fetchNewestdBooks();
          },
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryKey,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
