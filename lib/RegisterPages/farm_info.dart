import "package:flutter/material.dart";
import "package:interenshala_assignment/RegisterPages/verification.dart";

class FarmInfo extends StatefulWidget {
  const FarmInfo({super.key});

  @override
  State<FarmInfo> createState() => _FarmInfoState();
}

class _FarmInfoState extends State<FarmInfo> {
  final _formKey = GlobalKey<FormState>();

  String businessName = " ";
  String informalName = " ";
  String streetAddress = " ";
  String city = " ";
  String zipcode = " ";

  final businessNameController = TextEditingController();
  final informalNameController = TextEditingController();
  final streetAddressController = TextEditingController();
  final cityController = TextEditingController();
  final zipcodeController = TextEditingController();

  // // Initial Selected Value
  // String dropdownvalue = 'Maharastra';

  // // List of items in our dropdown menu
  // var items = ['Maharastra', 'Madra pradesh', 'Gujrat', 'item4', 'item5'];
  String? dropdownvalue;
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
                "Signup 2 of 4",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 30.0),
              child: const Text(
                "Farm Info",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: TextFormField(
                decoration: const InputDecoration(
                  filled: true,
                  prefixIcon: Icon(Icons.account_circle),
                  labelText: "BusinessName",
                  hintText: "Enter the BusinessName",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter BusinessName";
                  }
                  return null;
                },
                controller: businessNameController,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: TextFormField(
                obscureText: true,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  filled: true,
                  prefixIcon: Icon(Icons.email),
                  labelText: "Informal Name",
                  hintText: "Enter the Informal Name ",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter Informal Name";
                  }
                  return null;
                },
                controller: informalNameController,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: TextFormField(
                decoration: const InputDecoration(
                  filled: true,
                  prefixIcon: Icon(Icons.phone),
                  labelText: "Street Address",
                  hintText: "Enter the Street Address",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter Street Address";
                  }
                  return null;
                },
                controller: streetAddressController,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  filled: true,
                  prefixIcon: Icon(Icons.lock),
                  labelText: "City",
                  hintText: "Enter the City",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter City";
                  }
                  return null;
                },
                controller: cityController,
              ),
            ),
            Expanded(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DropdownButton<String>(
                      value: dropdownvalue,
                      hint: const Text(
                        'State',
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 151, 150, 150)),
                      ),
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                        size: 40.0,
                      ),
                      items: <String>['Maharastra', 'Madya Pradesh', 'Gujrat']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                    ),
                    const Text(
                      "Enter Zipcode",
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
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
                                  builder: (context) => const Verification()),
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
