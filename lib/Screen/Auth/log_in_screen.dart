import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_project/Controller/auth_controller.dart';
import 'package:test_project/Utils/image.dart';

class LogInScreen extends StatelessWidget {
   LogInScreen({Key? key}) : super(key: key);
  final _authController=Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      
      body: SafeArea(
        child: Stack(
          children: [

            _bgImage(context),
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal:29.w),
              child: Obx(()=>
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     SizedBox(height: 21.h,),
                    
                    Image.asset(_authController.isValid.value? AppImage.unDrawLogin:AppImage.loginImage,height:187.h,width: double.infinity,),
                    
                       SizedBox(height: 36.h,),
                        Text("Login Details",style:TextStyle(fontSize:24.sp,fontWeight: FontWeight.w500),),
                     SizedBox(height:18.h,),
              
              
                       TextFormField(
                        controller: _authController.emailTextController,
                      //  autofocus: true,
                        validator:(value){
                          if(value!.isEmpty){
                            return "Please enter your email !";
                          }else if(_authController.isValid.value){
                            return "Please enter valid email !";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                         
                        decoration: InputDecoration(
                          hintText: "Username , email & phone number",
              
              
                          hintStyle:TextStyle(fontSize:16.sp,fontWeight: FontWeight.w500),
                          enabledBorder:_outlineBorder(_authController.isValid.value?const Color(0xFFDA7676): const Color(0xFF887E7E)),
                          errorBorder: _outlineBorder(_authController.isValid.value?const Color(0xFFDA7676): const Color(0xFF887E7E)),
                          focusedBorder: _outlineBorder(_authController.isValid.value?const Color(0xFFDA7676): const Color(0xFF887E7E)),
                        ),
                      ),
                    _authController.isValid.value?Text("Please enter valid email !",style:TextStyle(fontSize:13.sp,fontWeight: FontWeight.w500,color: const Color(0xFFDA7676)),):const SizedBox(),
              
                    SizedBox(height: 11.h,),
              
                    TextFormField(
                      controller: _authController.passTextController,
                      keyboardType: TextInputType.emailAddress,
                    //  autofocus: true,
                      validator:(value){
                        if(value!.isEmpty){
                          return "Please enter your password !";
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText:"Password",
                          border:_outlineBorder( const Color(0xFF887E7E)),
                          enabledBorder:_outlineBorder( const Color(0xFF887E7E)),
                          errorBorder: _outlineBorder(const Color(0xFFDA7676)),
                          focusedBorder: _outlineBorder(const Color(0xFF887E7E))
                      ),
                    ),
                      SizedBox(height: 6.h,),
                     Row(
                      children: [
                        const Spacer(),
                        Text("Forgot Password ?",style:TextStyle(fontWeight: FontWeight.w500,fontSize:16.sp),),
                      ],
                    ),
                    SizedBox(height:34.h,),
              
                    _loginButton(),
              
                     SizedBox(height:33.h,),
                    _sign_up_with(),
                   SizedBox(height:32.h,),
                    _otherLogin()
              
              
              
                  ],
                ),
              ),
            )



          ],
        ),
      ),



    );
  }

   _otherLogin() {
    return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _socialButton(AppImage.google),
                      _socialButton(AppImage.facebook),
                      _socialButton(AppImage.ios),

                    ],
                  );
  }

    _socialButton(String image ) {
     return Container(
                      height:52.h,
                      width: 52.h,
                      padding: EdgeInsets.all(11.h),
                      margin: EdgeInsets.symmetric(horizontal:8.w),
                      decoration: BoxDecoration(
                        shape:BoxShape.circle,
                        color:const Color(0xFFECE9EC),
                        border: Border.all(
                          color:const Color(0xFFF89AEE),
                          width:0.4
                        )
                      ),
                      child: Image.asset(image,fit: BoxFit.fill,height:double.infinity,width: double.infinity,),
                    );
   }

   _loginButton() {
    return InkWell(
                    onTap: (){


                        _authController.logIn();




                    },
                    child: Obx(()=>
                       Container(
                        height: 60.h,
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          color: _authController.isValid.value?const Color(0xFF0B6EFE).withOpacity(0.3): const Color(0xFF0B6EFE)
                        ),
                        child: Text("Login",style:TextStyle(fontWeight: FontWeight.w700,fontSize:24.sp,color: Colors.white),),
                      ),
                    ),
                  );
  }

   _sign_up_with() {
    return Row(
                  children: [
                    Expanded(
                      child: Container(
                        height:3.h,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              const    Color(0xFFC4C4C400).withOpacity(0.0),

                              const   Color(0xFF0B6EFE),

                            ])
                        ),
                      ),
                    ),

                    Text(" Or Sign up With ",style:TextStyle(fontSize:12.sp,fontWeight: FontWeight.w500),),

                    Expanded(
                      child: Container(
                        height:3.h,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              const   Color(0xFF0B6EFE),
                              const    Color(0xFFC4C4C400).withOpacity(0.0),

                            ])
                        ),
                      ),
                    )
                  ],
                );
  }

   _outlineBorder(Color color) {
    return OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.r),
                      borderSide: BorderSide(
                        color:color,
                        width: 1
                      )
                    );
  }

   _bgImage(BuildContext context) {
    return SizedBox(
          height:MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
           const   SizedBox(),

              Image.asset(AppImage.authBgImage,height:212.h,width: double.infinity,fit: BoxFit.fill,)
               ],
          ),
        );
  }
}
