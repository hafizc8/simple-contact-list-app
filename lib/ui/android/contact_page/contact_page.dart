import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_contact_app/controller/contact/contact_controller.dart';
import 'package:my_contact_app/routes/app_pages.dart';
import 'package:my_contact_app/ui/android/contact_page/widget.dart';
import 'package:my_contact_app/ui/theme/app_text_theme.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({ Key? key }) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final TextEditingController _findKeyword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage Contacts"),
        actions: [
          IconButton(onPressed: () => Get.toNamed(Routes.ADD), icon: const Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///
            /// Search section
            ///
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 60,
              color: Colors.black12,
              child: Row(
                children: [
                  const Icon(Icons.search, color: Colors.white),
                  const SizedBox(width: 15),
                  Flexible(
                    child: TextField(
                      controller: _findKeyword,
                      decoration: InputDecoration(
                        hintStyle: cardTextStyle.copyWith(fontSize: 12),
                        hintText: "Type here for find Something ..",
                        border: InputBorder.none,
                      ),
                      onChanged: (query) {
                        Get.find<ContactController>().searchData(query);
                      },
                    )
                  ),
                ],
              ),
            ),
            
            ///
            /// Listview section
            ///
            GetX<ContactController>(
              initState: (state) => Get.find<ContactController>().getContactList(),
              builder: (c) {
                if (c.contactData.isEmpty) {
                  return const Center(child: Text("Getting data ..", key: Key("loadingText")));
                }

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: c.contactData.length,
                  itemBuilder: (ctx, i) {
                    return PersonList(data: c.contactData[i]);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}