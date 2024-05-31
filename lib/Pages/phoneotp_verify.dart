import 'package:flutter/material.dart';

class PhoneOTPVerify extends StatefulWidget {
  const PhoneOTPVerify({super.key});

  @override
  State<PhoneOTPVerify> createState() => _PhoneOTPVerifyState();
}

class _PhoneOTPVerifyState extends State<PhoneOTPVerify> {

   TextEditingController phoneNumber = TextEditingController();
   TextEditingController otp = TextEditingController();
   bool visible = false;
   var temp;

    @override 
  void dispose() { 
    phoneNumber.dispose(); 
    otp.dispose(); 
    super.dispose(); 
  } 
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("phoneNumber"),
      ),
      body: SizedBox(
         width: MediaQuery.of(context).size.width, 
        child:  const Column(
             mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            
          ],
        ),
      ),
    );
  }

  
}