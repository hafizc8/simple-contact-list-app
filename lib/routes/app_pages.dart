import 'package:get/get.dart';
import 'package:my_contact_app/bindings/contact_binding.dart';
import 'package:my_contact_app/ui/android/add_contact_page/add_contact_page.dart';
import 'package:my_contact_app/ui/android/contact_page/contact_page.dart';
part './app_routes.dart';

class AppPages {
  static List<GetPage<dynamic>> pages = [
    GetPage(name: Routes.INITIAL, page: () => const ContactPage(), binding: ContactBinding()),
    GetPage(name: Routes.ADD, page: () => const AddContactPage(), binding: ContactBinding()),
  ];
}
