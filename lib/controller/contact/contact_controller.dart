import 'package:get/get.dart';
import 'package:my_contact_app/data/model/model.dart';
import 'package:my_contact_app/data/repository/contact_repository.dart';

///
/// This controller for all contact function in view design
///
class ContactController extends GetxController {
  ///
  /// Initialize
  ///
  final ContactRepository repository  = ContactRepository();
  RxList<ContactModel> contactData    = <ContactModel>[].obs;
  RxList<ContactModel> allContactData = <ContactModel>[].obs;

  ///
  /// Function for get data from repository function
  ///
  dynamic getContactList(){
    repository.getContactList().then((data) {
      contactData.value = data;
      allContactData.value = data;
    });
  }

  ///
  /// Function for search data
  ///
  dynamic searchData(String query) {
    contactData.value = allContactData.where((e) {
      return e.name!.toLowerCase().contains(query.toLowerCase()) 
        || e.note!.toLowerCase().contains(query.toLowerCase())
        || e.email!.toLowerCase().contains(query.toLowerCase())
        || e.phone!.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }

  ///
  /// Function for add data
  /// this function add data to current array, because api post data not available
  ///
  dynamic addData({required ContactModel newData}) {
    contactData.add(newData.copyWith(id: contactData.length+1));
  }
}