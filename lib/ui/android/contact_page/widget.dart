import 'package:flutter/material.dart';
import 'package:my_contact_app/data/model/model.dart';
import 'package:my_contact_app/ui/theme/app_text_theme.dart';

class PersonList extends StatelessWidget {
  final ContactModel data;

  const PersonList({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${data.name}", style: cardTextStyle.copyWith(fontSize: 16, fontWeight: FontWeight.bold, color: const Color(0xFF313131))),
              const SizedBox(height: 3),
              Text(
                data.note!.isNotEmpty ? data.note! : "Tidak ada keterangan", 
                style: cardTextStyle.copyWith(fontSize: 12, color: const Color(0xFF818181), fontWeight: FontWeight.w100)
              ),
              const Divider(color: Color(0xFF818181), thickness: 0.5),
              Row(
                children: [
                  const Icon(Icons.phone, size: 15, color: Color(0xFF818181)),
                  const SizedBox(width: 8,),
                  Text(data.phone!, style: cardTextStyle.copyWith(fontSize: 12, color: const Color(0xFF818181), fontWeight: FontWeight.w100)),
                ],
              ),
              const SizedBox(height: 3),
              Row(
                children: [
                  const Icon(Icons.email, size: 15, color: Color(0xFF818181)),
                  const SizedBox(width: 8,),
                  Text(data.email!, style: cardTextStyle.copyWith(fontSize: 12, color: const Color(0xFF818181), fontWeight: FontWeight.w100)),
                ],
              ),
            ],
          ),
          const Spacer(),
          Wrap(
            children: data.labels!.map((e) => LabelPerson(title: e['title'])).toList(),
          )
        ],
      ),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(width: 0.1, color: Color(0xFF818181)))
      ),
    );
  }
}

class LabelPerson extends StatelessWidget {
  final String title;
  const LabelPerson({required this.title, Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
      child: Center(
        child: Text(title, style: cardTextStyle.copyWith(fontSize: 9, color: Colors.white, fontWeight: FontWeight.w100)),
      ),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}