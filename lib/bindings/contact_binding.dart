import 'package:get/get.dart';
import 'package:my_contact_app/controller/contact/contact_controller.dart';

///
/// Binding class for contact page controller
///
class ContactBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContactController>(() {
      return ContactController();
    });
  }
}
