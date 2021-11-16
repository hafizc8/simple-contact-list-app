import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_contact_app/controller/contact/contact_controller.dart';
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
          IconButton(onPressed: () {}, icon: const Icon(Icons.add))
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
              color: Colors.white,
              child: Row(
                children: [
                  const Icon(Icons.search, color: Color(0xFF808080)),
                  const SizedBox(width: 15),
                  Flexible(
                    child: TextField(
                      controller: _findKeyword,
                      decoration: InputDecoration(
                        hintStyle: cardTextStyle.copyWith(fontSize: 12, color: const Color(0xFF616161)),
                        hintText: "Find Something ..",
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
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: c.contactData.length,
                  itemBuilder: (ctx, i) {
                    return PersonList(data: c.contactData[i]);
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}