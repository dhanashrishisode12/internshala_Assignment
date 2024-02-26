import 'package:flutter/material.dart';

class DoneScreen extends StatefulWidget {
  const DoneScreen({super.key});

  @override
  State<DoneScreen> createState() => _DoneScreenState();
}

class _DoneScreenState extends State<DoneScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 50,
          ),
          Image.network(
              "https://cdn-icons-png.flaticon.com/512/8683/8683794.png"),
          Container(
            child: const Center(
              child: Text(
                "You're all done!",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.only(left: 30),
            child: const Text(
              "Attached proof of department of Agriculture registration i.e. Florida Fresh , USDA Approved, USDA Organic",
              style: TextStyle(fontSize: 15, color: Colors.black45),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 100),
            child: ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                  Color.fromARGB(255, 201, 94, 61),
                ),
              ),
              onPressed: () {},
              child: const Text(
                "Got it!",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
