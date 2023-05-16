import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:neivor/presentation/shared/layout/general.layout.dart";

class PreviewPage extends StatelessWidget {
  const PreviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GeneralLayout(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
      children: [
          Card(
              clipBehavior: Clip.hardEdge,
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                child: SizedBox(
                  width: 400,
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200
                        ),
                        child:  Text('Visita',  style: GoogleFonts.lato(textStyle: Theme.of(context).textTheme.titleMedium)),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                    width: 120,
                                    child: Text('Nombre:')),
                                Expanded(child: Text('Claudia Morales', style: Theme.of(context).textTheme.bodyLarge ,textAlign: TextAlign.right))
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children:[
                                SizedBox(
                                    width: 120,
                                    child: Text('Tipo de visita:')),
                                Expanded(child: Text('Invitado Personal', style: Theme.of(context).textTheme.bodyLarge, textAlign: TextAlign.right))
                              ],
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: 180,
                              height: 35,
                              child: SizedBox.expand(
                                child: OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(20),
                                      ),
                                      side: const BorderSide(
                                          width: 1, color: Colors.grey),
                                    ),
                                    onPressed: () {

                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children:const [
                                        Text("Añadir a favoritos",
                                            style: TextStyle(
                                              fontSize: 12,
                                                color: Colors.black45,
                                                fontWeight:
                                                FontWeight.w700)),
                                        SizedBox(width: 6,),
                                        Icon(Icons.star_border_outlined, size: 16, color: Colors.grey)
                                      ],
                                    )),
                              ),
                            ),


                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )),
          Card(
              clipBehavior: Clip.hardEdge,
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                child: SizedBox(
                  width: 400,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200
                        ),
                        child:  Row(
                          children: [
                            Expanded(child: Text('Detalles', style: GoogleFonts.lato(textStyle: Theme.of(context).textTheme.titleMedium))),
                            Icon(Icons.edit, color: Colors.grey, size: 18,)
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                    width: 120,
                                    child: Text('Residente que autoriza:')),
                                Expanded(child: Text('Martin Gutierrez', style: Theme.of(context).textTheme.bodyLarge ,textAlign: TextAlign.right))
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                SizedBox(
                                    width: 120,
                                    child: Text('Fecha Creación:')),
                                Expanded(child: Text('23/03/2023', style: Theme.of(context).textTheme.bodyLarge ,textAlign: TextAlign.right))
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                SizedBox(
                                    width: 120,
                                    child: Text('Día Entrada:')),
                                Expanded(child: Text('23/03/2023', style: Theme.of(context).textTheme.bodyLarge, textAlign: TextAlign.right))
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text("Instrucciones Personales"),
                            const SizedBox(height: 8),
                            Text("La Persona tiene la dificultad para caminar por favor asistirla la ingreso."),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )),
          const Expanded(child: SizedBox()),
          MaterialButton(
              minWidth: double.infinity,
              shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(22.0)),
              disabledColor: Theme.of(context)
                  .colorScheme
                  .tertiary,
              focusColor: Theme.of(context)
                  .colorScheme
                  .tertiary,
              splashColor: Theme.of(context)
                  .colorScheme
                  .tertiary,
              highlightColor: Theme.of(context)
                  .colorScheme
                  .tertiary,
              elevation: 0,
              color:
              Theme.of(context).colorScheme.primary,
              onPressed: () => Navigator.of(context).pushNamed("/access"),
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 15),
                child: Text("Crear Acceso".toUpperCase(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700)),
              )),
      ],
    ),
        ));
  }
}
