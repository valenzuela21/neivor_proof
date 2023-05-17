import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:neivor/constant/contanst.dart';

import '../models/ucontact.model.dart';
import 'http_error_handler.service.dart';

abstract class ServerResource {
  Future<UContact> addContactUser(UContact data);
}


class ContactServices implements ServerResource {
  final http.Client httpClient;
  ContactServices({
    required this.httpClient
});

  @override
  Future<UContact> addContactUser(UContact data) async  {

    final uri = Uri.parse(NetworkApp.apiHost);

    try{
          final http.Response response = await httpClient.post(uri,
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: jsonEncode(<String, String>{
            'name': data.name,
            "date_invitation": data.dateInvitation.toString(),
            "phone": data.phone,
            "comment": data.comment
          }));

          if(response.statusCode != 201){
            throw Exception(httpErrorHandler(response));
          }
          final contactJson = jsonDecode(response.body);
          final UContact contact =  UContact.fromJson(contactJson);
          return contact;
      }catch(e){
        rethrow;
      }

  }

}