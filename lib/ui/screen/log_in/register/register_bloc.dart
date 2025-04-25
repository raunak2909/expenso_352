import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xpenso/data/local/db_helper.dart';
import 'package:xpenso/data/repository/user_repository.dart';
import 'package:xpenso/ui/screen/log_in/register/register_event.dart';
import 'package:xpenso/ui/screen/log_in/register/register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  UserRepository userRepository;
  RegisterBloc({required this.userRepository}) : super(RegisterInitialState()) {

    on<RegisterUserEvent>((event, emit) async {
      emit(RegisterLoadingState());

      if (await userRepository.checkIfEmailAlreadyExists(email: event.newUser.email)) {
        emit(RegisterFailureState(errorMsg: 'Email already exists'));
      } else {
        bool check = await userRepository.registerUser(newUser: event.newUser);
        if(check){
          emit(RegisterSuccessState());
        }else{
          emit(RegisterFailureState(errorMsg: 'Something went wrong'));
        }
      }
    });
  }
}
