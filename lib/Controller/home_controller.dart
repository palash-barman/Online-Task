import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:test_project/Model/user_model.dart';
import 'package:test_project/Service/api_sevice.dart';

class HomeController extends GetxController{

  var isLoading =false.obs;
  late UserModel userModel;

  @override
  void onInit() {
     getUser();
    super.onInit();
  }
  getUser()async{
    isLoading(true);
    try {
      var result= await ApiService.fetchUser();
      if(result.runtimeType ==int){
        debugPrint("user fetch error $result");
      }else{
        userModel=result;
      }
    } on Exception catch (e) {
      debugPrint("user fetch error $e");
      // TODO
    }finally{
      isLoading(false);
    }

  }

}