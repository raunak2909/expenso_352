import 'package:xpenso/data/model/user_model.dart';

abstract class RegisterEvent{}

class RegisterUserEvent extends RegisterEvent{
  UserModel newUser;
  RegisterUserEvent({required this.newUser});
}