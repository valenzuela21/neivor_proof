import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neivor/blocs/contact/contact_bloc.dart';
import 'package:neivor/presentation/routes/route.dart';
import 'package:neivor/presentation/themes/app.themes.dart';
import 'package:neivor/repositories/contact.repository.dart';
import 'package:neivor/services/contact.service.dart';
import 'package:http/http.dart' as http;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ContactRepository(contactServices: ContactServices(httpClient: http.Client())),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ContactBloc(contactRepository: context.read<ContactRepository>()))
        ],
        child: MaterialApp(
          title: 'Neivor',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.theme(context),
          initialRoute: Routes.home,
          routes: AppRoute.routes,
        ),
      ),
    );
  }
}




