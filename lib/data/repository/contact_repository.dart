import 'package:my_contact_app/data/provider/contact_api.dart';

///
/// This class for storing all list of api provider function
///
class ContactRepository {
  ContactApi api = ContactApi();

  ///
  /// call get contact list api from provider
  ///
  dynamic getContactList() {
    return api.getContactListApi();
  }
}
