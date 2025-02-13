import 'package:bloc/bloc.dart';

class DateCubit extends Cubit<int> {
  DateCubit() : super(DateTime.now().day);

  void changeDate(int date) => emit(date);
}

class ChatButtonCubit extends Cubit<bool> {
  ChatButtonCubit() : super(false);

  void changeChatButton(bool isChatButton) => emit(isChatButton);
}