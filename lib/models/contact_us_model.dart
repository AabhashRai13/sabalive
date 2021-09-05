
import 'dart:convert';

ContactUs contactUsFromJson(String str) => ContactUs.fromJson(json.decode(str));

String contactUsToJson(ContactUs data) => json.encode(data.toJson());

class ContactUs {
  ContactUs({
    this.status,
    this.data,
  });
  
  String status;
  Data data;
  
  factory ContactUs.fromJson(Map<String, dynamic> json) => ContactUs(
    status: json["status"],
    data: Data.fromJson(json["data"]),
  );
  
  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.sender,
    this.email,
    this.subject,
    this.content,
    this.store,
  });
  
  String sender;
  String email;
  String subject;
  String content;
  int store;
  
  factory Data.fromJson(Map<String, dynamic> json) => Data(
    sender: json["sender"],
    email: json["email"],
    subject: json["subject"],
    content: json["content"],
    store: json["store"],
  );
  
  Map<String, dynamic> toJson() => {
    "sender": sender,
    "email": email,
    "subject": subject,
    "content": content,
    "store": store,
  };
}
