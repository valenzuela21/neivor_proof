import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ModalSharedNotification {
  static modalSharedButton(context) {
    return showModalBottomSheet<void>(
        context: context,
        isScrollControlled: false,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            padding: const EdgeInsets.all(20),
            height: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Roulette(
                  child: const Icon(
                    Icons.autorenew,
                    color: Colors.grey,
                    size: 65,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text('Sincroniza tus datos',
                    style: GoogleFonts.aBeeZee(
                        textStyle: Theme.of(context).textTheme.titleMedium)),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                    'Permitir acceso para invitar a tu lista de amigos y familiares a tu condominio.',
                    textAlign: TextAlign.center),
                const SizedBox(
                  height: 10,
                ),
                MaterialButton(
                    minWidth: double.infinity,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.0)),
                    disabledColor: Theme.of(context).colorScheme.tertiary,
                    focusColor: Theme.of(context).colorScheme.tertiary,
                    splashColor: Theme.of(context).colorScheme.tertiary,
                    highlightColor: Theme.of(context).colorScheme.tertiary,
                    elevation: 0,
                    color: Theme.of(context).colorScheme.primary,
                    onPressed: () =>
                        Navigator.of(context).pushNamed("/list_access"),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      child: Text("Permitir".toUpperCase(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700)),
                    )),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: SizedBox.expand(
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          side: const BorderSide(width: 1, color: Colors.grey),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/not_list_access');
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          child: Text("Omitir".toUpperCase(),
                              style: const TextStyle(
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w700)),
                        )),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
