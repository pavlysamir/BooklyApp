import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Features/splash/presentation/views/splash_view.dart';

void main() {
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context)  {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
       theme: ThemeData.dark().copyWith(
           scaffoldBackgroundColor:  kPrimaryKey,
           textTheme: GoogleFonts.montserratTextTheme(
               ThemeData.dark().textTheme
           ),
      ),

    );
  }
}


