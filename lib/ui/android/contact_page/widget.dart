import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_contact_app/data/model/model.dart';
import 'package:my_contact_app/ui/theme/app_text_theme.dart';

class PersonList extends StatelessWidget {
  final ContactModel data;

  const PersonList({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key("PERSON_LIST-${data.id}"),
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // profile picture
              CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=${data.id}"),
              ),
              const SizedBox(width: 10),

              // name and notes
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${data.name}", style: cardTextStyle.copyWith(fontSize: 16, fontWeight: FontWeight.bold,)),
                  const SizedBox(height: 3),
                  Text(
                    data.note!.isNotEmpty ? data.note! : "Tidak ada keterangan", 
                    style: cardTextStyle.copyWith(fontSize: 12, fontWeight: FontWeight.w100)
                  ),
                  const SizedBox(height: 10),
                  // label
                  Wrap(
                    children: data.labels!.map((e) => LabelPerson(title: e['title'])).toList(),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.phone, size: 15, color: Colors.white),
                      const SizedBox(width: 8,),
                      Text(data.phone!, style: cardTextStyle.copyWith(fontSize: 12, fontWeight: FontWeight.w100)),
                    ],
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      const Icon(Icons.email, size: 15, color: Colors.white),
                      const SizedBox(width: 8,),
                      Text(data.email!, style: cardTextStyle.copyWith(fontSize: 12, fontWeight: FontWeight.w100)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text("Created on " + DateFormat("dd MMMM yyyy").format(DateTime.parse(data.created.toString())), style: cardTextStyle.copyWith(fontSize: 12, fontWeight: FontWeight.w100)),
                ],
              ),
              const Spacer(),
            ],
          ),
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
      margin: const EdgeInsets.only(right: 4),
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
      child: Center(
        child: Text(title, style: cardTextStyle.copyWith(fontSize: 9, color: Colors.white,),),
      ),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}