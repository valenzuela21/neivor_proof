import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:neivor/models/ucontact.model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/contact.repository.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {

  final ContactRepository contactRepository;

  ContactBloc({required this.contactRepository}) : super(ContactState.initial()) {
    on<AddContactEvent>(_addContact);
  }

  Future<void> _addContact(AddContactEvent event, Emitter<ContactState> emit ) async {

    final newContact = UContact(name: event.name, dateInvitation: event.dateInvitation, phone: event.phone, comment: event.comment);
    await contactRepository.addContact(newContact);
    final contacts = [...state.listContact, newContact];
    emit(state.copyWith(listContact: contacts));
  }
}


