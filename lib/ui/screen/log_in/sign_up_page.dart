import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xpenso/data/model/user_model.dart';
import 'package:xpenso/ui/screen/log_in/register/register_bloc.dart';
import 'package:xpenso/ui/screen/log_in/register/register_event.dart';
import 'package:xpenso/ui/screen/log_in/register/register_state.dart';

class signUpPage extends StatefulWidget {
  @override
  State<signUpPage> createState() => _signUpPageState();
}

class _signUpPageState extends State<signUpPage> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController mobNoController = TextEditingController();

  TextEditingController passController = TextEditingController();

  TextEditingController confirmPassController = TextEditingController();

  bool isLoading = false;
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Color(0xff6674D3), Color(0xffE78BBC)])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Create\nAccount",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold,
                        fontSize: 31,
                        color: Colors.white),
                  )),
              SizedBox(
                height: 70,
              ),
              Container(
                height: 50,
                width: double.infinity,
                padding: const EdgeInsets.only(left: 21),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white,
                    boxShadow: [const BoxShadow(offset: Offset(0, 1), blurRadius: 2)]),
                child: Center(
                  child: TextFormField(
                    validator: (value){
                      if(value!.isEmpty){
                        return "Name field cannot be empty!";
                      } else {
                        return null;
                      }
                    },
                    controller: nameController,
                    cursorColor: Colors.black,
                    decoration: const InputDecoration.collapsed(
                        hintText: " Full name",
                        hintStyle: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 15,
                            color: Color(0xff4C4C4C))),
                  ),
                ),
              ),
              Container(
                height: 50,
                width: double.infinity,
                padding: const EdgeInsets.only(left: 21),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white,
                    boxShadow: [const BoxShadow(offset: Offset(0, 1), blurRadius: 2)]),
                child: Center(
                  child: TextFormField(
                    validator: (value){
                      var exp = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");


                      if(value!.isEmpty){
                        return "Email field cannot be empty!";
                      } else if(!exp.hasMatch(value)){
                        return "Please enter a valid email";
                      } else {
                        return null;
                      }
                    },
                    controller: emailController,
                    cursorColor: Colors.black,
                    decoration: const InputDecoration.collapsed(
                        hintText: " Email",
                        hintStyle: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 15,
                            color: Color(0xff4C4C4C))),
                  ),
                ),
              ),
              Container(
                height: 50,
                width: double.infinity,
                padding: const EdgeInsets.only(left: 21),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white,
                    boxShadow: [const BoxShadow(offset: Offset(0, 1), blurRadius: 2)]),
                child: Center(
                  child: TextFormField(
                    maxLength: 10,
                    validator: (value){
                      if(value!.isEmpty){
                        return "MobNo field cannot be empty!";
                      } else if(value.length!=10){
                        return "Please enter a valid number";
                      } else {
                        return null;
                      }
                    },
                    controller: mobNoController,
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      counterText: "",
                        hintText: " MobNo",
                        hintStyle: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 15,
                            color: Color(0xff4C4C4C))),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(left: 21),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white,
                    boxShadow: [const BoxShadow(offset: Offset(0, 1), blurRadius: 2)]),
                child: Center(
                  child: TextFormField(
                    validator: (value){

                      var exp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

                      if(value!.isEmpty){
                        return "Password field cannot be empty!";
                      } else if(!exp.hasMatch(value)){
                        return "Please include Minimum 1 Upper case\nMinimum 1 lowercase\nMinimum 1 Numeric Number\nMinimum 1 Special Character";
                      } else {
                        return null;
                      }
                    },
                    obscureText: !isPasswordVisible ,
                    controller: passController,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                      suffixIcon: InkWell(
                        onTap: (){
                          isPasswordVisible = !isPasswordVisible;
                          setState(() {

                          });
                        },
                          child: isPasswordVisible ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off)),
                        hintText: " Password",
                        hintStyle: const TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 15,
                            color: Color(0xff4C4C4C))),
                  ),
                ),
              ),
              Container(
                height: 50,
                width: double.infinity,
                padding: const EdgeInsets.only(left: 21),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white,
                    boxShadow: [const BoxShadow(offset: Offset(0, 1), blurRadius: 2)]),
                child: Center(
                  child: TextFormField(
                    validator: (value){
                      if(value!.isEmpty){
                        return "Confirm Pass field cannot be empty!";
                      } else if(value != passController.text){
                        return "Password doesn't match!";
                      } else {
                        return null;
                      }
                    },
                    obscureText: !isConfirmPasswordVisible,
                    controller: confirmPassController,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                        suffixIcon: GestureDetector(
                          onTap: (){
                            isConfirmPasswordVisible = !isConfirmPasswordVisible;
                            setState(() {

                            });
                          },
                          child: isConfirmPasswordVisible ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
                        ),
                        hintText: " Confirm Password",
                        hintStyle: const TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 15,
                            color: Color(0xff4C4C4C))),
                  ),
                ),
              ),
              BlocListener<RegisterBloc, RegisterState>(
                listener: (context, state) {
                  if (state is RegisterLoadingState) {
                    isLoading = true;
                    setState(() {

                    });
                  }

                  if (state is RegisterFailureState) {
                    isLoading = false;
                    setState(() {

                    });
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(state.errorMsg)));
                  }

                  if (state is RegisterSuccessState) {
                    isLoading = false;
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Registered successfully!!")));
                  }
                },
                child: ElevatedButton(
                  onPressed: () async {
                    if(formKey.currentState!.validate()) {
                      context.read<RegisterBloc>().add(RegisterUserEvent(
                          newUser: UserModel(
                              name: nameController.text,
                              email: emailController.text,
                              password: passController.text,
                              mobNo: mobNoController.text,
                              createdAt: DateTime
                                  .now()
                                  .millisecondsSinceEpoch
                                  .toString())));
                    }

                  },
                  style: ElevatedButton.styleFrom(
                      elevation: 5,
                      minimumSize: const Size(140, 40),
                      backgroundColor: const Color(0xff6674D3),
                      foregroundColor: Colors.white),
                  child: isLoading ? const Row(
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(width: 11,),
                      Text('Registering...')
                    ],
                  ) : const Text(
                    "Sign Up",
                    style: TextStyle(
                        fontFamily: "Poppins", fontSize: 21, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontFamily: "Poppins",
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Log in',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: "Poppins",
                          fontSize: 15),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
