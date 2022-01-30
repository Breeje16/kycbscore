import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kycbscore/data/prefs/prefs.dart';
import 'package:kycbscore/data/repository/main_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> authenticateUser(Map query) async {

    emit(AuthLoading());

    await Prefs.setEmail(query['email']);
    await Prefs.setUserName(query['username']);
    await Prefs.setFirstName(query['first_name']);
    await Prefs.setLastName('');
    await Prefs.setPassword(query['password']);

    final response = await MainRepo.signupUser(query);
    if (response['email'] != null) {
      final resToken = await MainRepo.getUserToken({
        "username": query['username'],
        "password": query['password'],
      });
      if (resToken['access'] != null) {
        await Prefs.setToken(resToken['access']);
        await Prefs.setRefreshToken(resToken['refresh']);
        await Prefs.setIsNewUser(false);
        var uname = await Prefs.getUserName();
        emit(
          AuthLoaded(
              refreshToken: resToken['refresh'], token: resToken['access']),
        );
      }
    }else {
      emit(const AuthError("Auth Error"));
    }
    if (response['message'] == "Token has expired") {
      final responseToken = await MainRepo.getUserToken({
        "username": query['username'],
        "password": query['password'],
      });
      if (responseToken['access'] != null) {
        await Prefs.setToken(responseToken['access']);
        await Prefs.setRefreshToken(responseToken['refresh']);
        await Prefs.setIsNewUser(false);
        emit(
          AuthLoaded(
              refreshToken: responseToken['refresh'],
              token: responseToken['access']),
        );
      }
    } else {
      emit(const AuthError("Auth Error"));
    }

  }

  Future<void> loginUser(Map query) async {

    emit(AuthLoading());

    await Prefs.setUserName(query['username']);
    await Prefs.setPassword(query['password']);

    final resToken = await MainRepo.getUserToken(query);
    if (resToken['access'] != null) {
      await Prefs.setToken(resToken['access']);
      await Prefs.setRefreshToken(resToken['refresh']);
      await Prefs.setIsNewUser(false);
      print(await Prefs.getUserName());
      emit(
        AuthLoaded(
            refreshToken: resToken['refresh'], token: resToken['access']),
      );
    } else {
      emit(const AuthError("Auth Error"));
    }

  }

  Future<void> logoutUser() async {

    emit(AuthLoading());
    await Prefs.clearPrefs();

  }
}
