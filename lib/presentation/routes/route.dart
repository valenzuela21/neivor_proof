import 'package:flutter/cupertino.dart';
import 'package:neivor/presentation/pages/access.page.dart';
import 'package:neivor/presentation/pages/detail/detail_acces_not_auth.page.dart';
import 'package:neivor/presentation/pages/detail/detail_access_auth.page.dart';
import 'package:neivor/presentation/pages/home.page.dart';
import 'package:neivor/presentation/pages/list_access.page.dart';
import 'package:neivor/presentation/pages/preview_acces.page.dart';

abstract class Routes {
  static const home =  "/home";
  static const listAccess =  "/list_access";
  static const notListAccess =  "/not_list_access";
  static const detail =  "/detail";
  static const preview =  "/preview";
  static const access =  "/access";
}

abstract class AppRoute {
  static String initial =  Routes.home;
  static Map<String, Widget Function(BuildContext)> routes =  {
    Routes.home: (context) => const HomePage(),
    Routes.listAccess: (context) => const ListAccessPage(),
    Routes.notListAccess: (context) => const DetailAccessNotPage(),
    Routes.detail: (context) => const DetailAccessPage(),
    Routes.preview: (context) => const PreviewPage(),
    Routes.access: (context) => const AccessPage()
  };
}