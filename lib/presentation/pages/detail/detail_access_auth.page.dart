import 'package:animate_do/animate_do.dart';
import 'package:fast_contacts/fast_contacts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neivor/blocs/contact/contact_bloc.dart';
import 'package:neivor/presentation/shared/layout/general.layout.dart';

import '../../components/form/calendar.component.dart';
import '../../components/form/switch.component.dart';
import '../../ui/form/input.decoration.ui.dart';

class DetailAccessPage extends StatefulWidget {
  const DetailAccessPage({Key? key}) : super(key: key);

  @override
  State<DetailAccessPage> createState() => _DetailAccessPageState();
}

class _DetailAccessPageState extends State<DetailAccessPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _dataInputName = TextEditingController();
  final TextEditingController _dataInputDate = TextEditingController();
  final TextEditingController  _dataComment = TextEditingController();

  @override
  void dispose() {
    _dataInputName.dispose();
    _dataInputName.dispose();
    _dataComment.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final contact = ModalRoute.of(context)?.settings.arguments as Contact;
    _dataInputName.text = contact.displayName;

    return GeneralLayout(
        child: SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 1.2,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: FadeIn(
            duration: const Duration(milliseconds: 1000),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Detalle de la visita',
                      style: GoogleFonts.aBeeZee(
                          textStyle: Theme.of(context).textTheme.headlineMedium)),
                  const SizedBox(height: 20),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: _dataInputName,
                        enableSuggestions: false,
                        maxLength: 22,
                        cursorColor: Colors.grey,
                        autocorrect: false,
                        readOnly: true,
                        style: const TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w400),
                        keyboardType: TextInputType.text,
                        decoration: InputDecorations.generalInputDecoration(
                          hinText: 'Ingresa el nombre completo',
                          labelText: 'Nombre Completo',
                          colorInput: Colors.grey,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        validator: (String? value) {
                          if (value == null || value.length < 4) {
                            return "Ingresa el nombre completo";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                              child: Text("Visita de varios días.",
                                  style: GoogleFonts.lato(
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .bodyLarge))),
                          const SwitchApp()
                        ],
                      ),
                      TextFormField(
                        controller: _dataInputDate,
                        enableSuggestions: false,
                        maxLength: 22,
                        cursorColor: Colors.grey,
                        autocorrect: false,
                        keyboardType: TextInputType.none,
                        readOnly: true,
                        style: const TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w400),
                        decoration: InputDecorations.generalInputDecoration(
                          hinText: 'Ingresa día de la visita',
                          labelText: 'Día de la visita',
                          colorInput: Colors.grey,
                          suffixIcon: Icons.calendar_month,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        onTap: () {
                          CalendarPicker.dialogBuilder(context, _dataInputDate);
                        },
                        validator: (String? value) {
                          if (value == null || value.length < 4) {
                            return "Ingresa la fecha de la visita";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 8),
                      Text("Instrucciones al personal (Opcional)",
                          style: GoogleFonts.lato(
                              textStyle: Theme.of(context).textTheme.bodyLarge)),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _dataComment,
                        enableSuggestions: false,
                        cursorColor: Colors.grey,
                        autocorrect: false,
                        style: const TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w400),
                        keyboardType: TextInputType.multiline,
                        maxLines: 4,
                        decoration: InputDecorations.generalInputDecoration(
                          hinText: 'Ingresa si tienes una descripción o sugerencia',
                          labelText: '',
                          colorInput: Colors.grey,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ],
                  )),
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
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<ContactBloc>().add(AddContactEvent(name: _dataInputName.text, dateInvitation: DateTime.parse(_dataInputDate.text), phone: contact.phones[0].toString(), comment: _dataComment.text, status: Status.LOADING));
                          Navigator.of(context).pushNamed("/preview");
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        child: Text("Continuar".toUpperCase(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700)),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
