import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:neivor/exceptions/general.exceptions.dart';
import 'package:neivor/models/custom_error.dart';
import 'package:neivor/models/ucontact.model.dart';
import 'package:neivor/services/contact.service.dart';

abstract class ServerRepository {
  Future<UContact> addContact(UContact data);
}

class ContactRepository implements ServerRepository {
  final ContactServices contactServices;

  ContactRepository({
    required this.contactServices
  });

  @override
  Future<UContact> addContact(UContact data) async {
    bool connection = await InternetConnectionChecker().hasConnection;
    try {
      if (connection) {
        final result = contactServices.addContactUser(data);
        return result;
      } else {
        throw const CustomError(errMsg: 'No internet :( Reason:');
      }
    } on GeneralException catch (e) {
      throw CustomError(errMsg: e.message);
    } catch (e) {
      throw CustomError(errMsg: e.toString());
    }
  }

}