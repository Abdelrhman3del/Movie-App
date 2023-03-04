import 'package:equatable/equatable.dart';

class ServerExceptionModel extends Equatable {
  final bool success;
  final String statusMessage;
  final int statusCode;

  const ServerExceptionModel(
      { required this.success, required this.statusMessage, required this.statusCode,});

  factory ServerExceptionModel.fromJson(Map<String, dynamic> json)=>
ServerExceptionModel(success: json['success'], statusMessage: json['status_message'], statusCode: json['status_code']);
  @override
  List<Object> get props => [success, statusCode, statusMessage];
}