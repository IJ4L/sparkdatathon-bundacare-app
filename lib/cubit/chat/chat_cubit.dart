import 'package:bloc/bloc.dart';
import 'package:bundacare/data/api_service.dart';
import 'package:bundacare/data/models/chat_model.dart';
import 'package:equatable/equatable.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final ApiService apiService;
  List<ChatModel> _chats = [];

  ChatCubit(this.apiService) : super(ChatInitial());

  void getChats(String text) async {
    emit(ChatLoading());
    try {
      var data = await apiService.chat(text);

      _chats.add(data);

      emit(ChatLoaded(_chats));
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }
}
