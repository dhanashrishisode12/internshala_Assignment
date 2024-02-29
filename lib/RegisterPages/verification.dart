import 'package:flutter/material.dart';
import 'package:interenshala_assignment/RegisterPages/verification_submit.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.only(left: 30.0),
              child: const Text(
                "FarmerEats",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              margin: const EdgeInsets.only(left: 30.0),
              child: const Text(
                "Signup 3 of 4",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 30.0),
              child: const Text(
                "Verification",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.only(left: 30),
              child: const Text(
                "Attached proof of department of Agriculture registration i.e. Florida Fresh , USDA Approved, USDA Organic",
                style: TextStyle(fontSize: 20, color: Colors.black45),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "Attach proof of registration",
                  style: TextStyle(fontSize: 20),
                ),
                IconButton(
                  style: const ButtonStyle(
                    iconSize: MaterialStatePropertyAll(40),
                    iconColor: MaterialStatePropertyAll(
                      Color.fromARGB(255, 201, 94, 61),
                    ),
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.camera_alt),
                ),
              ],
            ),
            const SizedBox(height: 180),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 30,
                    ),
                  ),
                  ElevatedButton(
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
                                  builder: (context) =>
                                      const VerificationSubmit()),
                            );
                          },
                        );
                      }
                    },
                    child: const Text(
                      "Continue",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
