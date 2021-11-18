import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_tag_editor/tag_editor.dart';
import 'package:my_contact_app/controller/contact/contact_controller.dart';
import 'package:my_contact_app/data/model/model.dart';
import 'package:my_contact_app/ui/theme/app_text_theme.dart';

class AddContactPage extends StatefulWidget {
  const AddContactPage({ Key? key }) : super(key: key);

  @override
  _AddContactPageState createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  final _nameC = TextEditingController();
  final _emailC = TextEditingController();
  final _phoneC = TextEditingController();
  final _notesC = TextEditingController();
  final List<String> _labels = [];

  _submitForm() {
    Get.find<ContactController>().addData(newData: ContactModel(
      name: _nameC.text,
      email: _emailC.text,
      phone: _phoneC.text,
      note: _notesC.text,
      created: DateTime.now().toIso8601String(),
      labels: _labels.map((e) => {"slug": e.toLowerCase().split(" ").join("-"), "title": e}).toList(),
    ));
    Get.back();
    Get.showSnackbar(
      GetBar(
        icon: const Icon(Icons.check, color: Colors.white),
        title: "Message",
        message: "Successfully added new contact !",
        duration: const Duration(seconds: 4),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Contact"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                TextFormField(
                  controller: _nameC,
                  decoration: InputDecoration(
                    hintStyle: cardTextStyle.copyWith(fontSize: 12,),
                    hintText: "Contact name",
                    // border: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value!.isEmpty || value == null) {
                      return "Contact name must filled";
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 25),
                TextFormField(
                  controller: _emailC,
                  decoration: InputDecoration(
                    hintStyle: cardTextStyle.copyWith(fontSize: 12,),
                    hintText: "Contact email address",
                    // border: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value!.isEmpty || value == null) {
                      return "Contact email address must filled";
                    }

                    if (!GetUtils.isEmail(value)) {
                      return "Email is not correct format";
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 25),
                TextFormField(
                  controller: _phoneC,
                  decoration: InputDecoration(
                    hintStyle: cardTextStyle.copyWith(fontSize: 12,),
                    hintText: "Phone number",
                    // border: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value!.isEmpty || value == null) {
                      return "Phone number must filled";
                    }

                    if (!GetUtils.isPhoneNumber(value)) {
                      return "Phone number is not correct format";
                    }

                    return null;
                  },
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 25),
                TextFormField(
                  controller: _notesC,
                  decoration: InputDecoration(
                    hintStyle: cardTextStyle.copyWith(fontSize: 12,),
                    hintText: "Anything about the contact",
                    // border: InputBorder.none,
                  ),
                  maxLength: 150,
                ),
                const SizedBox(height: 25),
                TagEditor(
                  length: _labels.length,
                  delimiters: [',', ' '],
                  hasAddButton: true,
                  inputDecoration: InputDecoration(
                    hintStyle: cardTextStyle.copyWith(fontSize: 12,),
                    hintText: 'Labels about the contact',
                    // border: InputBorder.none,
                  ),
                  onTagChanged: (newValue) => setState(() => _labels.add(newValue)),
                  tagBuilder: (context, index) => _Chip(
                    index: index,
                    label: _labels[index],
                    onDeleted: (index) => setState(() => _labels.removeAt(index)),
                  ),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () => _submitForm(),
                    child: Text("Save", style: cardTextStyle.copyWith(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      shadowColor: MaterialStateProperty.all<Color>(Colors.white.withOpacity(0.5)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )
                      )
                    ),
                  )
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({
    required this.label,
    required this.onDeleted,
    required this.index,
  });

  final String label;
  final ValueChanged<int> onDeleted;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Chip(
      labelPadding: const EdgeInsets.only(left: 8.0),
      label: Text(label),
      deleteIcon: const Icon(
        Icons.close,
        size: 18,
      ),
      onDeleted: () {
        onDeleted(index);
      },
    );
  }
}