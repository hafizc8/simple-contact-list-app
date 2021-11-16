class ContactModel {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? note;
  String? created;
  List? labels;

  ContactModel({this.id, this.name, this.email, this.phone, this.note, this.created, this.labels});

  ContactModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    note = json['notes'];
    created = json['created'];
    labels = json['labels'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['notes'] = note;
    data['created'] = created;
    data['labels'] = labels;
    return data;
  }

  ContactModel copyWith({
    int? id,
    String? name,
    String? email,
    String? phone,
    String? note,
    String? created,
    List? labels,
  }) {
    return ContactModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      note: note ?? this.note,
      created: created ?? this.created,
      labels: labels ?? this.labels,
    );
  }
}