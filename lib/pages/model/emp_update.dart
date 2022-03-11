import 'emp_model.dart';

class EmpUpdate {
  String status;
  String message;
  Employee data;

  EmpUpdate.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        message = json['message'],
        data = Employee.fromJson(json['data']);

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };

}