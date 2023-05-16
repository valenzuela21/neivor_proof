import 'package:flutter/cupertino.dart';
import 'package:neivor/presentation/pages/access.page.dart';
import 'package:neivor/presentation/pages/detail_access.page.dart';
import 'package:neivor/presentation/pages/home.page.dart';
import 'package:neivor/presentation/pages/list_access.page.dart';
import 'package:neivor/presentation/pages/preview_acces.page.dart';

abstract class Routes {
  static const Home =  "/home";
  static const ListAccess =  "/list_access";
  static const Detail =  "/detail";
  static const Preview =  "/preview";
  static const Access =  "/access";
}

abstract class AppRoute {
  static String initial =  Routes.Home;
  static Map<String, Widget Function(BuildContext)> routes =  {
    Routes.Home: (context) => const HomePage(),
    Routes.ListAccess: (context) => const ListAccessPage(),
    Routes.Detail: (context) => const DetailAccessPage(),
    Routes.Preview: (context) => const PreviewPage(),
    Routes.Access: (context) => const AccessPage()
  };
}