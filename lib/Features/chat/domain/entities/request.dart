// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class MessageRequest extends Equatable {
  final String message;
  final String inputLanguage;
  final String outputLanguage;
  MessageRequest({
    required this.message,
    required this.inputLanguage,
    required this.outputLanguage,
  });

  @override
  List<Object?> get props => throw [message, inputLanguage, outputLanguage];
}
