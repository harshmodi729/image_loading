import 'dart:convert';

ResponseItem identityItemFromJson(String str) =>
    ResponseItem.fromJson(json.decode(str));

String identityItemToJson(ResponseItem data) => json.encode(data.toJson());

class ResponseItem {
  ResponseItem({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  Map<String, dynamic>? data;

  factory ResponseItem.fromJson(Map<String, dynamic> json) =>
      ResponseItem(
        status: json["status"] == 1,
        message: json["msg"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() =>
      {
        "status": status,
        "message": message,
        "data": data,
      };
}