import 'package:flutter/material.dart';
import 'package:store_app/core/app_theme.dart';
import 'package:store_app/core/theme_provider.dart';
import 'package:store_app/secreens/home.dart';
import 'package:store_app/secreens/update_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: themeNotifier,
      builder: (context, _) {
        return MaterialApp(
          title: 'Store App',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeNotifier.themeMode,
          routes: {
            Home.id: (context) => const Home(),
            UpdatePage.id: (context) => const UpdatePage(),
          },
          initialRoute: Home.id,
        );
      },
    );
  }
}
