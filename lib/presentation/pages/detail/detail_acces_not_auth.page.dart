import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neivor/presentation/shared/layout/general.layout.dart';
import 'package:country_picker/country_picker.dart';
import '../../../blocs/contact/contact_bloc.dart';
import '../../components/form/calendar.component.dart';
import '../../components/form/switch.component.dart';
import '../../ui/form/input.decoration.ui.dart';

class DetailAccessNotPage extends StatefulWidget {
  const DetailAccessNotPage({Key? key}) : super(key: key);

  @override
  State<DetailAccessNotPage> createState() => _DetailAccessNotPageState();
}

class _DetailAccessNotPageState extends State<DetailAccessNotPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _dataName = TextEditingController();
  final TextEditingController _dataInputDate = TextEditingController();
  final TextEditingController _dataCodePhone = TextEditingController();
  final TextEditingController _dataPhone = TextEditingController();
  final TextEditingController _dataComment = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _dataName.dispose();
    _dataInputDate.dispose();
    _dataCodePhone.dispose();
    _dataPhone.dispose();
    _dataComment.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GeneralLayout(
        child: SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 1.2,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: FadeIn(
            duration: Duration(milliseconds: 1000),
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
                        controller: _dataName,
                        enableSuggestions: false,
                        maxLength: 22,
                        cursorColor: Colors.grey,
                        autocorrect: false,
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
                            flex: 1,
                            child: TextFormField(
                              controller: _dataCodePhone,
                              enableSuggestions: false,
                              maxLength: 22,
                              cursorColor: Colors.grey,
                              autocorrect: false,
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                              readOnly: true,
                              keyboardType: TextInputType.none,
                              decoration: InputDecorations.generalInputDecoration(
                                  hinText: 'Code',
                                  labelText: 'Ej: +57',
                                  colorInput: Colors.grey,
                                  borderRadius: BorderRadius.circular(5),
                                  suffixIcon: Icons.arrow_drop_down),
                              validator: (String? value) {
                                if (value == null || value.length < 4) {
                                  return "Ingresa Code...";
                                }
                                return null;
                              },
                              onTap: () {
                                showCountryPicker(
                                  showSearch: false,
                                  searchAutofocus: false,
                                  context: context,
                                  showPhoneCode: true,
                                  // optional. Shows phone code before the country name.
                                  onSelect: (Country country) {
                                    _dataCodePhone.text =
                                        '${country.flagEmoji} +${country.phoneCode}';
                                  },
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                              flex: 2,
                              child: TextFormField(
                                controller: _dataPhone,
                                enableSuggestions: false,
                                maxLength: 22,
                                cursorColor: Colors.grey,
                                autocorrect: false,
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400),
                                keyboardType: TextInputType.phone,
                                decoration:
                                    InputDecorations.generalInputDecoration(
                                  hinText: 'Inrese el número telefónico',
                                  labelText: 'Número telefónico',
                                  colorInput: Colors.grey,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                validator: (String? value) {
                                  if (value == null || value.length < 4) {
                                    return "Ingresa el número telefónico";
                                  }
                                  return null;
                                },
                              ))
                        ],
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
                          SwitchApp()
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
                            return "Ingresa el día de la visita";
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
                          hinText: 'Ingresa la descripción o sugerencia',
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
                          var codeNumber = _dataCodePhone.text.split(' ');
                          context.read<ContactBloc>().add(AddContactEvent(name: _dataName.text, dateInvitation: DateTime.parse(_dataInputDate.text), phone:  codeNumber[1] +_dataPhone.text.toString(), comment: _dataComment.text));
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
