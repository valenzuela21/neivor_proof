import 'dart:convert';
import 'package:uuid/uuid.dart';

Uuid uuid = const Uuid();
class UContact {
  final String id;
  final String name;
  final DateTime dateInvitation;
  final String phone;
  final String comment;

  UContact({
    String? id,
    required this.name,
    required this.dateInvitation,
    required this.phone,
    required this.comment,
  }): id = id ?? uuid.v4();

  UContact copyWith({
    String? name,
    DateTime? dateInvitation,
    String? phone,
    String? comment,
  }) =>
      UContact(
        name: name ?? this.name,
        dateInvitation: dateInvitation ?? this.dateInvitation,
        phone: phone ?? this.phone,
        comment: comment ?? this.comment,
      );

  factory UContact.fromRawJson(String str) => UContact.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UContact.fromJson(Map<String, dynamic> json) => UContact(
    name: json["name"],
    dateInvitation: DateTime.parse(json["date_invitation"]),
    phone: json["phone"],
    comment: json["comment"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "date_invitation": "${dateInvitation.year.toString().padLeft(4, '0')}-${dateInvitation.month.toString().padLeft(2, '0')}-${dateInvitation.day.toString().padLeft(2, '0')}",
    "phone": phone,
    "comment": comment,
  };

  @override
  String toString() {
    return 'UContact{id: $id, name: $name, dateInvitation: $dateInvitation, phone: $phone, comment: $comment}';
  }
}
