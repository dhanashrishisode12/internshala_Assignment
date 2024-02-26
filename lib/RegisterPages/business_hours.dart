import 'package:flutter/material.dart';
import 'package:interenshala_assignment/RegisterPages/verification_submit.dart';
import 'package:weekday_selector/weekday_selector.dart';

class BusinessHours extends StatefulWidget {
  const BusinessHours({super.key});

  @override
  State<BusinessHours> createState() => _BusinessHoursState();
}

class _BusinessHoursState extends State<BusinessHours> {
  final values = List.filled(7, true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
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
              "Signup 4 of 4",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 30.0),
            child: const Text(
              "Business Hours",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.only(left: 30, right: 10),
            child: const Text(
              "choose the hours your farm is open for pickups.this will allow custemers to order deliveries.",
              style: TextStyle(fontSize: 15, color: Colors.black45),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: WeekdaySelector(
                shape: const BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(6.0),
                  ),
                ),
                selectedFillColor: const Color.fromARGB(255, 201, 94, 61),
                fillColor: const Color.fromARGB(255, 216, 214, 214),
                onChanged: (int day) {
                  setState(() {
                    final index = day % 7;
                    values[index] = !values[index];
                  });
                },
                values: values),
          ),
          // GridView(
          //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: 2),
          //   children: [
          //     Container(
          //       margin: const EdgeInsets.all(100.0),
          //       child: const TextField(
          //         decoration: InputDecoration(
          //             hintText: "8.00am - 10.00am",
          //             border: OutlineInputBorder()),
          //       ),
          //     ),
          //   ],
          // ),
          const SizedBox(
            height: 100,
          ),
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
                    // if (_formKey.currentState!.validate())
                    {
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
                    "Signup",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
