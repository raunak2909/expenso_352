import 'package:xpenso/data/local/db_helper.dart';

import '../model/user_model.dart';

class UserRepository{
  DbHelper dbHelper;
  UserRepository({required this.dbHelper});

  Future<bool> registerUser({required UserModel newUser}) async{
   bool check = await dbHelper.registerUser(newUser);
   return check;
  }

  Future<bool> checkIfEmailAlreadyExists({required String email}) async{
    return await dbHelper.isEmailAlreadyExists(email: email);
  }

  Future<bool> authenticateUser({String? email, String? mobNo, required String pass, bool isEmail = true}) async{
    if(isEmail) {
      return await dbHelper.authenticateUser(
          email: email!, pass: pass, isEmail: isEmail);
    } else {
      return await dbHelper.authenticateUser(
          mobNo: mobNo!, pass: pass, isEmail: isEmail);
    }
  }

}