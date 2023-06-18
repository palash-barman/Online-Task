import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_project/Controller/home_controller.dart';
import 'package:test_project/Utils/image.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);
    final _homeController =Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 5,
        title:const Text("User List"),
      ),
      body: Obx(()=>_homeController.isLoading.value?const Center(child:CircularProgressIndicator()):
         SafeArea(
          child: GridView.builder(
            padding:EdgeInsets.symmetric(horizontal:10.w,vertical: 20.h),
              itemCount:_homeController.userModel.data.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.w,
            mainAxisSpacing: 10.h
          ), itemBuilder:(context,index){
              var data=_homeController.userModel.data[index];
            return Card(
              elevation: 5,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color:Colors.white
                ),
                padding: EdgeInsets.symmetric(horizontal:5.w,vertical: 5.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(5.r),topRight: Radius.circular(5.r)),
                        child: Image.network(data.avatar,height:100.h,width:double.infinity,fit: BoxFit.fill,)),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(data.firstName,style:TextStyle(fontSize:18.sp,fontWeight: FontWeight.w500),maxLines:1,overflow: TextOverflow.ellipsis,),
                    Text(data.lastName,style:TextStyle(fontSize:16.sp,fontWeight: FontWeight.w500),maxLines:1,overflow:TextOverflow.ellipsis,),

                  ],
                ),
              ),
            );

          }),
        ),
      ),
    );
  }
}
