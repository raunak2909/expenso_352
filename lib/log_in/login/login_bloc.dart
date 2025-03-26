import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xpenso/data/repository/user_repository.dart';
import 'package:xpenso/domain/app_constants.dart';
import 'package:xpenso/log_in/login/login_event.dart';
import 'package:xpenso/log_in/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>{
  UserRepository userRepository;
  LoginBloc({required this.userRepository}) : super(LoginInitialState()){

    on<AuthenticateUserEvent>((event, emit) async{

      emit(LoginLoadingState());

      bool check = await userRepository.authenticateUser(pass: event.pass, email: event.email, isEmail: event.isEmail, mobNo: event.mobNo);

      if(check){
        emit(LoginSuccessState());
      } else {
        emit(LoginFailureState(errorMsg: "Invalid credentials!!"));
      }

    });

  }

}