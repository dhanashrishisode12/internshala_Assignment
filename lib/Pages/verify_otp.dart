import 'package:flutter/material.dart';
import 'package:interenshala_assignment/Pages/reset_password.dart';
import 'package:pinput/pinput.dart';

class VerifyOtp extends StatefulWidget {
  const VerifyOtp({super.key});

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final defautlPinTheme = PinTheme(
        width: 58,
        height: 59,
        textStyle: const TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 219, 220, 220),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.transparent),
        ));
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
                "Verify OTP",
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
                        MaterialPageRoute(
                            builder: (context) => const ResetPassword()),
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
            const SizedBox(
              height: 40,
            ),
            Container(
              child: Pinput(
                length: 5,
                defaultPinTheme: defautlPinTheme,
                focusedPinTheme: defautlPinTheme.copyWith(
                  decoration: defautlPinTheme.decoration!.copyWith(
                    border: Border.all(color: Colors.red),
                  ),
                ),
                onCompleted: (pin) => debugPrint(pin),
              ),
            ),
            const SizedBox(
              height: 20,
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
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ResetPassword()),
                        );
                      },
                    );
                  }
                },
                child: const Text(
                  "Submit",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
            const Center(
              child: Text(
                "Resend Code",
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
