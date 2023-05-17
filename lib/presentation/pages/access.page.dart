import 'dart:io' show Platform;

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:neivor/presentation/shared/layout/general.layout.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse('https://www.neivor.com');

class AccessPage extends StatelessWidget {
  const AccessPage({Key? key}) : super(key: key);



  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }


  Future<void> _openWhatsapp({required BuildContext context}) async {
    String whatsapp = '+573213487458';
    String whatsappURlAndroid = "whatsapp://send?phone=$whatsapp&text=hello";
    String whatsappURLIos =
        "https://wa.me/$whatsapp?text=${Uri.parse("hello")}";
    if (Platform.isIOS) {
      if (await canLaunchUrl(Uri.parse(whatsappURLIos))) {
        await launchUrl(Uri.parse(whatsappURLIos));
      } else {

      }
    } else {
      if (await canLaunchUrl(Uri.parse(whatsappURlAndroid))) {
        await launchUrl(Uri.parse(whatsappURlAndroid));
      } else {

      }
    }
  }
  
  
  @override
  Widget build(BuildContext context) {

    const String qrData = " Nombre: Alicia Gonzales \n Telefóno: 321347589 \n Día Entrada: 2022-08-10 \n Expira: 2022-09-22 \n Comentario: Nuevo Comentario";
    return GeneralLayout(
        child: Column(children: [
      Expanded(
        child: FadeInDown(
          duration: const Duration(milliseconds: 1000),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
              ),
               Positioned.fill(
                    top: -30,
                    child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 330,
                          height: 480,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).colorScheme.primary,
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20))),
                              ),
                              Image.asset(
                                'assets/images/neivor.png',
                                width: 100,
                              ),
                              const SizedBox(height: 10),
                              const Text("Alicia Gonzales",
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 24)),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.business,
                                      color:
                                          Theme.of(context).colorScheme.secondary),
                                  const SizedBox(width: 5),
                                  Text("Torre 101",
                                      style: Theme.of(context).textTheme.bodyLarge),
                                  const SizedBox(width: 10),
                                  Icon(Icons.account_circle,
                                      color:
                                          Theme.of(context).colorScheme.secondary),
                                  const SizedBox(width: 5),
                                  Text("Manuel Sanchez",
                                      style: Theme.of(context).textTheme.bodyLarge),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "Francisco Javier Clavijero 51, CDMX, México",
                                style: Theme.of(context).textTheme.bodyLarge,
                                textAlign: TextAlign.center,
                              ),
                              QrImage(
                                data: qrData,
                                version: QrVersions.auto,
                                size: 180.0,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "Entrada: Jueves 07 de Junio 2022 ",
                                style: Theme.of(context).textTheme.bodyLarge,
                                textAlign: TextAlign.center,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.access_time_sharp, color: Colors.black45,),
                                  SizedBox(width: 5),
                                  Text(
                                    "Expira: 21/04/2023 - 18:30",
                                    style: Theme.of(context).textTheme.bodyLarge,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "¿Quieres saber mas sobre neivor?",
                                style: Theme.of(context).textTheme.bodyLarge,
                                textAlign: TextAlign.center,
                              ),
                              TextButton(
                                onPressed: _launchUrl,
                                child: Text(
                                  "www.neivor.com",
                                  style: Theme.of(context).textTheme.bodyLarge,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ))),
            ],
          ),
        ),
      ),
      FadeInUp(
        duration: Duration(milliseconds: 1000),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: MaterialButton(
              minWidth: double.infinity,
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.0)),
              disabledColor: Theme.of(context).colorScheme.tertiary,
              focusColor: Theme.of(context).colorScheme.tertiary,
              splashColor: Theme.of(context).colorScheme.tertiary,
              highlightColor: Theme.of(context).colorScheme.tertiary,
              elevation: 0,
              color: Theme.of(context).colorScheme.primary,
              onPressed: () => _openWhatsapp(context: context),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Text("Whatsapp".toUpperCase(),
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700)),
              )),
        ),
      ),
         const  SizedBox(height: 20)
    ]));
  }

 
}
