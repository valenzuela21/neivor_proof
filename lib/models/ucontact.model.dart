import 'dart:convert';

class UContact {
  final String name;
  final DateTime dateInvitation;
  final String phone;
  final String comment;

  UContact({
    required this.name,
    required this.dateInvitation,
    required this.phone,
    required this.comment,
  });

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
    "name": name,
    "date_invitation": "${dateInvitation.year.toString().padLeft(4, '0')}-${dateInvitation.month.toString().padLeft(2, '0')}-${dateInvitation.day.toString().padLeft(2, '0')}",
    "phone": phone,
    "comment": comment,
  };
}
