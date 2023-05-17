part of 'contact_bloc.dart';

enum Status { INITIAL, LOADING, COMPLETED, ERROR }

class ContactState extends Equatable {
  final Status status;
  final List<UContact> listContact;
  final UContact contactLast;

  const ContactState({required this.listContact, required this.contactLast, required this.status});

  factory ContactState.initial() {
    return ContactState(
        status: Status.INITIAL,
        listContact: [],
        contactLast: UContact(
            name: '', dateInvitation: DateTime.now(), phone: "", comment: ""));
  }

  @override
  List<Object> get props => [listContact, contactLast, status];


  @override
  String toString() {
    return 'ContactState{status: $status, listContact: $listContact, contactLast: $contactLast}';
  }

  ContactState copyWith({List<UContact>? listContact, UContact? contactLast, Status? status}) {
    return ContactState(
        listContact: listContact ?? this.listContact,
        contactLast: contactLast ?? this.contactLast,
        status: status ?? this.status
    );
  }
}
