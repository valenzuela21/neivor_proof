import 'dart:async';
import 'dart:typed_data' as td;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neivor/presentation/components/tabs.component.dart';
import 'package:neivor/presentation/shared/layout/general.layout.dart';
import '../ui/form/input.decoration.ui.dart';
import 'package:fast_contacts/fast_contacts.dart';
import 'package:permission_handler/permission_handler.dart';

class ListAccessPage extends StatefulWidget {
  const ListAccessPage({Key? key}) : super(key: key);

  @override
  State<ListAccessPage> createState() => _ListAccessPageState();
}

class _ListAccessPageState extends State<ListAccessPage> {
  late Future<List<Contact>> getContactFuture;
  Timer? _debounce;

  @override
  void initState() {
    getContactFuture = getContacts();
    super.initState();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  Future<List<Contact>> getContacts() async {
    bool isGranted = await Permission.contacts.status.isGranted;
    if (!isGranted) {
      isGranted = await Permission.contacts.request().isGranted;
    }
    if (isGranted) {
      return await FastContacts.getAllContacts();
    }
    return [];
  }

  Future<void> getFilter(String term) async {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () async {
      final filter = await FastContacts.getAllContacts();
      getContactFuture = Future.value(filter
          .where((element) =>
              element.displayName.toLowerCase().contains(term.toLowerCase()))
          .toList());
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GeneralLayout(
      child: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: FutureBuilder(
                future: getContactFuture,
                builder: (context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return SizedBox(
                      width: 35,
                      height: 35,
                      child: Image.asset('assets/images/neivor.png'),
                    );
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TabsComponent(),
                      Text('Autorizo Acceso',
                          style: GoogleFonts.aBeeZee(
                              textStyle:
                                  Theme.of(context).textTheme.headlineMedium)),
                      const SizedBox(height: 20),
                      TextFormField(
                        onChanged: (value) => getFilter(value),
                        enableSuggestions: false,
                        maxLength: 52,
                        cursorColor: Colors.grey,
                        autocorrect: false,
                        style: const TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w400),
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
                          style: GoogleFonts.lato(
                              textStyle:
                                  Theme.of(context).textTheme.displaySmall)),
                      const SizedBox(height: 20),
                      _ListAccessContact(
                        size: size,
                        snapshot: snapshot,
                      ),
                      const SizedBox(height: 10),
                      MaterialButton(
                          minWidth: double.infinity,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22.0)),
                          disabledColor: Theme.of(context).colorScheme.tertiary,
                          focusColor: Theme.of(context).colorScheme.tertiary,
                          splashColor: Theme.of(context).colorScheme.tertiary,
                          highlightColor:
                              Theme.of(context).colorScheme.tertiary,
                          elevation: 0,
                          color: Theme.of(context).colorScheme.primary,
                          onPressed: () =>
                              Navigator.of(context).pushNamed("/list_access"),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            child: Text("Registrar Visitante".toUpperCase(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700)),
                          )),
                    ],
                  );
                })),
      ),
    );
  }
}

class _ListAccessContact extends StatelessWidget {
  final AsyncSnapshot snapshot;
  final Size size;

  const _ListAccessContact(
      {super.key, required this.size, required this.snapshot});


  @override
  Widget build(BuildContext context) {
    return snapshot.data.length > 0
        ? SizedBox(
            height: size.height / 2.5,
            child: ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  String phone = "";
                  Contact contact = snapshot.data[index];
                  final _imageFuture = FastContacts.getContactImage(contact.id);
                  for (var element in contact.phones) {
                    phone += '${element.number}  ';
                  }
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/detail',
                          arguments: snapshot.data[index]);
                    },
                    child: ListTile(
                      leading: _ImageContact(imageFuture: _imageFuture),
                      title: Text(contact.displayName,
                          style: Theme.of(context).textTheme.titleSmall),
                      subtitle: Text(phone),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 14,
                      ),
                    ),
                  );
                }),
          )
        : SizedBox(
                height: size.height / 2.5,
                child:Center(child: Text('No hay números telefónicos')));

  }
}

class _ImageContact extends StatelessWidget {
  final imageFuture;

  const _ImageContact({Key? key, required this.imageFuture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<td.Uint8List?>(
      future: imageFuture,
      builder: (context, snapshot) {
        return ClipRRect(
            borderRadius: BorderRadius.circular(50.0),
            child: Container(
              width: 46,
              height: 46,
              child: snapshot.hasData
                  ? Image.memory(snapshot.data!, gaplessPlayback: true)
                  : const Icon(Icons.account_circle, size: 46),
            ));
      },
    );
  }
}
