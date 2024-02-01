import 'package:flutter/material.dart';
import 'package:ny_news/core/dependency_injection/dependency_injection.dart';
import 'package:ny_news/core/resources/app_router.dart';
import 'package:ny_news/core/resources/app_strings.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DependencyInjection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appTitle,
      routerConfig: AppRouter().router,
    );
  }
}
