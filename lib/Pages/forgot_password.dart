import 'package:flutter/material.dart';
import 'package:interenshala_assignment/Pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();

 String phoneNumber = "";
  final phoneNumberController = TextEditingController();
  final otpController = TextEditingController();

  bool visible = false;
  var temp;
  String otp = " "; 

   @override
  void dispose() {
    phoneNumberController.dispose();
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            const SizedBox(
              height: 100,
            ),
            Container(
              margin: const EdgeInsets.only(left: 30.0),
              child: const Text(
                "Forgot Password ?",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text("Remember your password?"),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
                      );
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 201, 94, 61),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  inputTextField("Contact Number", phoneNumberController, context),
                  visible
                      ? inputTextField("OTP", otpController, context)
                      : const SizedBox(),
                  !visible
                      ? SendOTPButton("Send OTP")
                      : SubmitOTPButton("Submit"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget SendOTPButton(String text) => ElevatedButton(
        onPressed: () async {
          setState(() {
            visible = !visible;
          });
          temp = await FirebaseAuthentication().sendOTP(phoneNumberController.text);
        },
        child: Text(text),
      );

  Widget SubmitOTPButton(String text) => ElevatedButton(
        onPressed: () => FirebaseAuthentication().authenticate(temp, otpController.text),
        child: Text(text),
      );

  Widget inputTextField(String labelText,
          TextEditingController textEditingController, BuildContext context) =>
      Padding(
        padding:const EdgeInsets.all(10.00),
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 1.5,
          child: TextFormField(
            obscureText: labelText == "OTP" ? true : false,
            controller: textEditingController,
            decoration: InputDecoration(
              hintText: labelText,
              hintStyle:const TextStyle(color: Colors.blue),
              filled: true,
              fillColor: Colors.blue[100],
              enabledBorder: OutlineInputBorder(
                borderSide:const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(5.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(5.5),
              ),
            ),
          ),
        ),
      );
}

class FirebaseAuthentication { 
  String phoneNumber = ""; 
  
  sendOTP(String phoneNumber) async { 
    this.phoneNumber = phoneNumber; 
    FirebaseAuth auth = FirebaseAuth.instance; 
    ConfirmationResult result = await auth.signInWithPhoneNumber( 
      '+91$phoneNumber', 
    ); 
    printMessage("OTP Sent to +91 $phoneNumber"); 
    return result; 
  } 
  
  authenticate(ConfirmationResult confirmationResult, String otp) async { 
    UserCredential userCredential = await confirmationResult.confirm(otp); 
    userCredential.additionalUserInfo!.isNewUser 
        ? printMessage("Authentication Successful") 
        : printMessage("User already exists"); 
  } 
  
  printMessage(String msg) { 
    debugPrint(msg); 
  } 
}
