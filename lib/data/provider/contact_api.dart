import 'package:dio/dio.dart';
import 'package:my_contact_app/data/model/model.dart';

const baseUrl       = 'https://demo2278480.mockable.io';
const getContactUrl = "$baseUrl/contacts";

///
/// This class for storing all function connect to api
///
class ContactApi {
  ///
  /// Connect to api get contact list
  ///
  dynamic getContactListApi() async {
    try {
      Response response = await Dio().get(getContactUrl);
      
      // when success
      if (response.statusCode == 200) {
        Iterable jsonResponse = response.data;
        List<ContactModel> contactData = jsonResponse.map((model) => ContactModel.fromJson(model)).toList();

        return contactData;
      }
      
      // when error
      else {

      }
    } catch(_) {
      
    }
  }
}