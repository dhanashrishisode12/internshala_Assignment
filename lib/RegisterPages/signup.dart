import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
import "package:interenshala_assignment/Pages/login.dart";
import "package:interenshala_assignment/RegisterPages/farm_info.dart";

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  String fullName = " ";
  String emailAddress = " ";
  String phoneNumber = " ";
  String password = " ";
  String reEnteredPassword = " ";

  final fullNameController = TextEditingController();
  final emailAddressController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final reEnteredPasswodController = TextEditingController();

  CollectionReference farmer = FirebaseFirestore.instance.collection('farmer');

  Future<void> addUser() {
    return farmer
        .add({
          'fullname': fullName,
          'emailAddress': emailAddress,
          'phoneNumber': phoneNumber,
          'password': password,
          'reEnteredPassword': reEnteredPassword,
        })
        .then((value) => print("New User Add"))
        .catchError(
          (error) => print("Failed to add User $error"),
        );
  }

  @override
  void dispose() {
    fullNameController.dispose();
    emailAddressController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    reEnteredPasswodController.dispose();
    super.dispose();
  }

  clearText() {
    fullNameController.clear();
    emailAddressController.clear();
    phoneNumberController.clear();
    passwordController.clear();
    reEnteredPasswodController.clear();
  }

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
              padding: const EdgeInsets.symmetric(vertical: 20),
              margin: const EdgeInsets.only(left: 30.0),
              child: const Text(
                "Signup 1 of 4",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 30.0),
              child: const Text(
                "Welcome!",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Login(),
                          ),
                        );
                      },
                      child: Image.network(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlhQWjHTppri9oBmtb8Vl5JlmYLt6nBzbQ5w&usqp=CAU"),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: Image.network(
                        "https://www.shutterstock.com/image-photo/valencia-spain-march-05-2017-600nw-593485994.jpg"),
                  ),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: Image.network(
                        "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Facebook_Logo_%282019%29.png/1024px-Facebook_Logo_%282019%29.png"),
                  ),
                ],
              ),
            ),
            const Center(
              child: Text(
                "or Signup with",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: TextFormField(
                autofocus: false,
                // initialValue: " ",
                decoration: const InputDecoration(
                  filled: true,
                  prefixIcon: Icon(Icons.account_circle),
                  labelText: "Full Name",
                  hintText: "Enter the Full Name",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter FullName";
                  }
                  return null;
                },
                controller: fullNameController,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: TextFormField(
                autofocus: false,
                // initialValue:" " ,
                decoration: const InputDecoration(
                  filled: true,
                  prefixIcon: Icon(Icons.email),
                  labelText: "Email Address",
                  hintText: "Enter the Email Address ",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter Email Address";
                  } else if (!value.contains('@')) {
                    return " please Enter valid Email Address";
                  }
                  return null;
                },
                controller: emailAddressController,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: TextFormField(
                autofocus: false,
                // initialValue:" " ,
                decoration: const InputDecoration(
                  filled: true,
                  prefixIcon: Icon(Icons.phone),
                  labelText: "Phone Number",
                  hintText: " please Enter the Phone Number",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter Phone Number";
                  } else if (value.length != 10) {
                    return "please Enter Phone Number";
                  }
                  return null;
                },
                controller: phoneNumberController,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: TextFormField(
                autofocus: false,
                // initialValue:" " ,
                obscureText: true,
                decoration: const InputDecoration(
                  filled: true,
                  prefixIcon: Icon(Icons.lock),
                  labelText: "Password",
                  hintText: "Enter the Password",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter Password";
                  } else if (value.length <= 6) {
                    return "Enter strong Password";
                  }
                  return null;
                },
                controller: passwordController,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: TextFormField(
                autofocus: false,
                // initialValue:" " ,
                obscureText: true,
                decoration: const InputDecoration(
                  filled: true,
                  prefixIcon: Icon(Icons.lock),
                  labelText: "Re-enter Password",
                  hintText: "Enter the Re-enter Password ",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter Re-enter Password";
                  } else if (value.length <= 6) {
                    return "Enter strong Re-enter Password";
                  }
                  return null;
                },
                controller: reEnteredPasswodController,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Login(),
                        ),
                      );
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(decoration: TextDecoration.underline),
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
                            fullName = fullNameController.text;
                            emailAddress = emailAddressController.text;
                            phoneNumber = phoneNumberController.text;
                            password = passwordController.text;
                            reEnteredPassword = reEnteredPasswodController.text;
                            addUser();
                            clearText();
                            ScaffoldMessenger.of(context).showSnackBar(
                             const SnackBar(content: 
                              Text("User Register Successfully"))
                            );
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const FarmInfo()),
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
