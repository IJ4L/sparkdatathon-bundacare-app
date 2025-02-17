import 'package:bloc/bloc.dart';
import 'package:bundacare/data/api_service.dart';
import 'package:equatable/equatable.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final ApiService apiService;
  SignInCubit(this.apiService) : super(SignInInitial());

  void autoLogin() async {
    emit(SignInLoading());
    final result = await apiService.autoLogin();
    if (result) {
      emit(const SignInSuccess(true));
    } else {
      emit(const SignInFailed('username or password is wrong'));
    }
  }

  void signIn(String user, String pass) async {
    emit(SignInLoading());
    final result = await apiService.login(user, pass);
    if (result) {
      emit(const SignInSuccess(true));
    } else {
      emit(const SignInFailed('username or password is wrong'));
    }
  }

  void signOut() async {
    emit(SignInLoading());
    final result = await apiService.logout();
    if (result) {
      emit(const SignInSuccess(false));
    } else {
      emit(const SignInFailed('failed to logout'));
    }
  }
}
