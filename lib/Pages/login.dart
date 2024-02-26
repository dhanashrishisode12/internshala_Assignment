import "package:flutter/material.dart";
import "package:interenshala_assignment/Pages/forgot_password.dart";
import "package:interenshala_assignment/RegisterPages/signup.dart";

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  var email = " ";
  var password = " ";

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
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
                "Welcome back!",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text("New here?"),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        //Default page transition of android
                        MaterialPageRoute(
                          builder: (context) => const SignUp(),
                        ),
                      );
                    },
                    child: const Text(
                      "Create account",
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
                  prefixIcon: Icon(Icons.email_sharp),
                  labelText: "Enter Email",
                  hintText: "Enter the Email id",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter emailId";
                  } else if (!value.contains('@')) {
                    return "Enter Valid EmailId";
                  }
                  return null;
                },
                controller: emailController,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  suffixText: 'Forgot?',
                  suffixStyle: TextStyle(
                    color: Color.fromARGB(255, 201, 94, 61),
                  ),
                  labelText: "Enter Password",
                  hintText: "Enter the Password",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.visiblePassword,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter Password";
                  } else if (value.length <= 6) {
                    return "Enter Strong Password";
                  }
                  return null;
                },
                controller: passwordController,
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
                        email = emailController.text;
                        password = passwordController.text;
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ForgotPassword()),
                        );
                      },
                    );
                  }
                },
                child: const Text(
                  "Login",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text(
                "or login with",
                style: TextStyle(color: Colors.grey),
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
                            builder: (context) => const ForgotPassword(),
                          ),
                        );
                      },
                      child: Image.network(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlhQWjHTppri9oBmtb8Vl5JlmYLt6nBzbQ5w&usqp=CAU"),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                    width: 80,
                    child: Image.network(
                        "https://1000logos.net/wp-content/uploads/2016/10/Apple-Logo.png"),
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
          ],
        ),
      ),
    );
  }
}
