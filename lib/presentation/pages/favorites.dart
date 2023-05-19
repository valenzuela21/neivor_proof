import 'package:flutter/material.dart';
import 'package:neivor/presentation/shared/layout/general.layout.dart';

import '../components/tabs.component.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GeneralLayout(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        SizedBox(
          height: 5,
        ),
        TabsComponent(),
        SizedBox(
          height: 5,
        ),
        Text("Working favoritos..."),
      ],
    ));
  }
}
