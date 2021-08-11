import 'dart:convert';

ForgetPassword forgetPasswordFromJson(String str) =>
    ForgetPassword.fromJson(json.decode(str));

String forgetPasswordToJson(ForgetPassword data) => json.encode(data.toJson());

class ForgetPassword {
  ForgetPassword({
    this.status,
    this.message,
  });

  String status;
  String message;

  factory ForgetPassword.fromJson(Map<String, dynamic> json) => ForgetPassword(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
