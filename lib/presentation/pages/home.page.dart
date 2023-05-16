import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neivor/presentation/shared/layout/general.layout.dart';

import '../../models/services.modesl.dart';
import '../components/modaL_hared_notification.component.dart';



class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<ServiceModel> listServices = [
      ServiceModel(
          title: "Acceso Invitado Personal",
          subtitle: "Registrar a tus amigos familia y conocidos.",
          onTap: () {
            ModalSharedNotification.modalSharedButton(context);
          },
          icon: const Icon(Icons.account_circle_rounded, color: Colors.grey)),
      ServiceModel(
          title: "Acceso a Personal del Hogar",
          subtitle: "Registrar a una empleada domestica, niñera, chofer y otros.",
          onTap: () {},
          icon: const Icon(Icons.format_color_fill, color: Colors.grey)),
      ServiceModel(
          title: "Acceso a Proveedor / Mantenimiento",
          subtitle: "Registrar a proveedores de servicios de hogar o condominio.",
          onTap: () {},
          icon: const Icon(Icons.home, color: Colors.grey)),
      ServiceModel(
          title: "Mi Historial de Visitas",
          subtitle: "Revisa los accesos que has autorizado.",
          onTap: () {},
          icon: const Icon(Icons.feed, color: Colors.grey)),
    ];

    return GeneralLayout(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    child: Text("Autorizo Acceso",
                        style: GoogleFonts.aBeeZee(textStyle: Theme.of(context).textTheme.displaySmall))),
                Expanded(
                    child: Text("Ver favoritos",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 14),
                        textAlign: TextAlign.right)),
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: listServices.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: listServices[index].onTap,
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey, width: 1.0)),
                          padding: const EdgeInsets.symmetric(
                              vertical: 25, horizontal: 10),
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 240,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    listServices[index].icon,
                                    Text(listServices[index].title,
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                            fontSize: 14,
                                            height: 2)),
                                    Text(listServices[index].subtitle)
                                  ],
                                ),
                              ),
                              Expanded(
                                  child: Icon(
                                Icons.keyboard_arrow_right_outlined,
                                color: Theme.of(context).colorScheme.secondary,
                              ))
                            ],
                          )),
                    );
                  }))
      ],
    ),
        ));
  }
}
