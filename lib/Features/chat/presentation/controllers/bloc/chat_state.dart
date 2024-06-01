part of 'chat_bloc.dart';

abstract class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

final class ChatInitial extends ChatState {}

final class LoadingChatsState extends ChatState {}

final class LoadedChatsState extends ChatState {
  LoadedChatsState();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

final class ErrorLoadingChatsState extends ChatState {
  String message;
  ErrorLoadingChatsState({required this.message});
  @override
  // TODO: implement props
  List<Object> get props => [message];
}
