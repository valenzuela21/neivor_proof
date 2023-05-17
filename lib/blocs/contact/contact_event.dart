part of 'contact_bloc.dart';

abstract class ContactEvent extends Equatable {
  const ContactEvent();

  @override
  List<Object> get props => [];
}

class AddContactEvent extends ContactEvent {
  final String name;
  final DateTime dateInvitation;
  final String phone;
  final String comment;

  const AddContactEvent(
      {required this.name,
      required this.dateInvitation,
      required this.phone,
      required this.comment});

  @override
  List<Object> get props => [name, dateInvitation, phone, comment];

  @override
  String toString() {
    return 'AddContactEvent{name: $name, dateInvitation: $dateInvitation, phone: $phone, comment: $comment}';
  }
}
