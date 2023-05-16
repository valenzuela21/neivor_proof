import 'package:flutter/material.dart';
import 'package:neivor/presentation/routes/route.dart';
import 'package:neivor/presentation/themes/app.themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Neivor',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme(context),
      initialRoute: Routes.Home,
      routes: AppRoute.routes,
    );
  }
}




