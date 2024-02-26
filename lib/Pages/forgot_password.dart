import 'package:flutter/material.dart';
import 'package:interenshala_assignment/Pages/verify_otp.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();

  var phoneNumber = " ";

  final phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.deepPurple,
      //   title: const Text(
      //     "User LogIn",
      //     style: TextStyle(color: Colors.white),
      //   ),
      // ),
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
                      // Navigator.pushReplacement(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => const ForgotPassword(),
                      //       ),
                      // );
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
            const SizedBox(
              height: 40,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.call),
                  labelText: "Phone Number",
                  hintText: "Enter the phone number",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter PhoneNumber";
                  } else if (value.length != 10) {
                    return "Enter Valid phoneNumber";
                  }
                  return null;
                },
                controller: phoneNumberController,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Color.fromARGB(255, 201, 94, 61),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    setState(
                      () {
                        phoneNumber = phoneNumberController.text;
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const VerifyOtp()),
                        );
                      },
                    );
                  }
                },
                child: const Text(
                  "Send Code",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
