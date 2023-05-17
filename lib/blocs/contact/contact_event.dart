part of 'contact_bloc.dart';

abstract class ContactEvent extends Equatable {
  const ContactEvent();

  @override
  List<Object> get props => [];
}

class GetContactLastEvent  extends ContactEvent {
  final Status status;

  const GetContactLastEvent({required this.status});

  @override
  List<Object> get props => [status];

  @override
  String toString() {
    return 'GetContactLastEvent{status: $status}';
  }
}

class AddContactEvent extends ContactEvent {
  final String name;
  final DateTime dateInvitation;
  final String phone;
  final String comment;
  final Status status;

  const AddContactEvent(
      {required this.name,
      required this.dateInvitation,
      required this.phone,
      required this.comment,
      required this.status
      });

  @override
  List<Object> get props => [name, dateInvitation, phone, comment, status];

  @override
  String toString() {
    return 'AddContactEvent{name: $name, dateInvitation: $dateInvitation, phone: $phone, comment: $comment, status: $status}';
  }
}
