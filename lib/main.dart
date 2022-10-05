import 'package:cleanapp/core/services/services_locator.dart';
import 'package:cleanapp/core/utils/app_string.dart';
import 'package:flutter/material.dart';

import 'movies/presentation/screens/movies_screen.dart';

void main() {
  ServicesLocator().init();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppString.appName,
      theme:ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.grey.shade900,),
      home:const MoviesScreen(),
    );
  }
}
