// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'chat_bloc.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class getAllChatsEvent extends ChatEvent {}

class sendAudioMessageEvent extends ChatEvent {
  final File audioFile;
  final String outputLanguage;
  sendAudioMessageEvent({
    required this.audioFile,
    required this.outputLanguage,
  });
  @override
  List<Object> get props => [audioFile, outputLanguage];
}

class SendMessageEvent extends ChatEvent {
  final String message;
  final String inputLanguage;
  final String outputLanguage;
  const SendMessageEvent({
    required this.message,
    required this.inputLanguage,
    required this.outputLanguage,
  });
  @override
  List<Object> get props => [message, inputLanguage, outputLanguage];
}
