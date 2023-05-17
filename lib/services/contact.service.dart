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
    final Uri uri = Uri(
      scheme: 'https',
      host: NetworkApp.apiHost,
      path: '/server_json'
    );
      try{
          final http.Response response = await httpClient.post(uri, body: data);
          if(response.statusCode != 200){
            throw Exception(httpErrorHandler(response));
          }
          final contactJson = json.decode(response.body);
          final UContact contact =  UContact.fromJson(contactJson);
          return contact;
      }catch(e){
        rethrow;
      }

  }

}