part of 'contact_bloc.dart';

class ContactState extends Equatable {
  final List<UContact> listContact;

  const ContactState({required this.listContact});

  factory ContactState.initial() {
    return const ContactState(listContact: []);
  }

  @override
  List<Object> get props => [listContact];

  @override
  String toString() {
    return 'ContactState{listContact: $listContact}';
  }

  ContactState copyWith({List<UContact>? listContact}) {
    return ContactState(listContact: listContact ?? this.listContact);
  }
}
