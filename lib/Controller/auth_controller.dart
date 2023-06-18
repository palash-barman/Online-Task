import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:test_project/Screen/HomeScreen/home_screen.dart';
import 'package:test_project/Service/api_sevice.dart';

class AuthController extends GetxController{

  final emailTextController =TextEditingController();
  final passTextController =TextEditingController();

  var isValid=false.obs;


  logIn()async{
      try {
        Map<String,dynamic> body= {
          "email": emailTextController.text,
          "password":passTextController.text,
        };
        var result= await ApiService.handleLogin(body);
        if(result.runtimeType==int){
          isValid.value=true;
        }else{
          debugPrint("Login Successful");
          isValid.value=false;
          Get.off( HomeScreen());
        }
      } on Exception catch (e) {
        debugPrint("Login error $e");
       
      }



  }






}