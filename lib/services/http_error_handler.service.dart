import 'package:http/http.dart' as http;


String httpErrorHandler(http.Response  response){
  final statusCode = response.statusCode;
  final reasonPrase =  response.reasonPhrase;
  final String errorMessage =  'Rquest failed \n status Code: $statusCode \n Reason: $reasonPrase ';

  return errorMessage;
}