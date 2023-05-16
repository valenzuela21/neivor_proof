import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neivor/presentation/shared/layout/general.layout.dart';

import '../ui/form/input.decoration.ui.dart';

class ListAccessPage extends StatelessWidget {
  const ListAccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size =  MediaQuery.of(context).size;
    return GeneralLayout(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Autorizo Acceso', style:  GoogleFonts.aBeeZee(textStyle: Theme.of(context).textTheme.headlineMedium)),
                const SizedBox(height: 20),
                TextFormField(
                  enableSuggestions: false,
                  maxLength: 52,
                  cursorColor: Colors.grey,
                  autocorrect: false,
                  style: const TextStyle(color: Colors.grey,  fontWeight: FontWeight.w400),
                  keyboardType: TextInputType.text,
                  decoration: InputDecorations.generalInputDecoration(
                      hinText: 'Buscar Contacto',
                      labelText: 'Buscar...',
                      prefixIcon: Icons.search,
                      colorInput: Colors.grey,
                      borderRadius: BorderRadius.circular(50)),
                  validator: (String? value) {
                    if (value == null || value.length < 4) {
                      return "Ingresa el término de busqueda";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                Text("Seleccione un contacto",
                    style:  GoogleFonts.lato(textStyle: Theme.of(context).textTheme.displaySmall)),
                const SizedBox(height: 20),
                SizedBox(
                  height: size.height / 2.5,
                  child: ListView.builder(
                      itemBuilder: (context, index) {
                        return GestureDetector(onTap:
                            (){
                          Navigator.pushNamed(context, '/detail');
                            },
                          child: ListTile(
                            leading:Icon(Icons.account_circle, size: 40,),
                            title: Text("Alicia Linda", style: Theme.of(context).textTheme.titleSmall),
                            subtitle: Text("(124) 145-7873"),
                            trailing:Icon(Icons.arrow_forward_ios_rounded, size: 14,),
                          ),
                        );
                      }),
                ),
                const SizedBox(height: 10),
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
                    onPressed: () => Navigator.of(context).pushNamed("/list_access"),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      child: Text("Registrar Visitante".toUpperCase(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700)),
                    )),
              ],
            ),
          ),
        )
    );
  }
}
