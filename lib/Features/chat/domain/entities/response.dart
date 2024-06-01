// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class MessageResponse extends Equatable {
  final String response;
  final bool isTyping;
  final bool isChatbot;
  MessageResponse(
      {required this.response,
      required this.isTyping,
      required this.isChatbot});

  @override
  List<Object?> get props => [response, isTyping];
}
