import 'package:flutter/material.dart';
import 'package:store_app/secreens/home.dart';
import 'package:store_app/secreens/update_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Home.id: (context) => const Home(),
        UpdatePage.id: (context) => UpdatePage(),
      },
      initialRoute: Home.id,
     
    );
  }
}

// وصلت عند فيديو 307