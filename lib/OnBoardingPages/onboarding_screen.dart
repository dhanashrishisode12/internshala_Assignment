import 'package:flutter/material.dart';
import 'package:interenshala_assignment/Pages/login.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final List<PageViewModel> pages = [
    PageViewModel(
      title: "Quality",
      body:
          "sell your farm fresh product directaly to consumers, cutting out the middleman  and reducing emissions of the global supply chain.",
      footer: ElevatedButton(
        style: const ButtonStyle(
          backgroundColor:
              MaterialStatePropertyAll(Color.fromARGB(255, 117, 179, 119)),
        ),
        onPressed: () {},
        child: const Text(
          "Join the movement!",
          style: TextStyle(color: Colors.black),
        ),
      ),
      image: Center(
        child: Image.asset("assets/login_page.png"),
      ),
      decoration: const PageDecoration(
        bodyPadding: EdgeInsets.all(10.0),
        footerPadding: EdgeInsets.symmetric(vertical: 50),
        titleTextStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
    ),
    PageViewModel(
      title: "Convenient",
      body:
          "out team of delivery drivers make sure your orders picked up on time and promptly delivered to your customers.",
      footer: ElevatedButton(
        style: const ButtonStyle(
          backgroundColor:
              MaterialStatePropertyAll(Color.fromARGB(255, 179, 125, 121)),
        ),
        onPressed: () {},
        child: const Text(
          "Join the movement!",
          style: TextStyle(color: Colors.black),
        ),
      ),
      image: Center(
        child: Image.asset("assets/nature.png"),
      ),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
    ),
    PageViewModel(
      title: "Local",
      body:
          "out team of delivery drivers make sure your orders picked up on time and promptly delivered to your customers.",
      footer: ElevatedButton(
        style: const ButtonStyle(
          backgroundColor:
              MaterialStatePropertyAll(Color.fromARGB(255, 232, 222, 129)),
        ),
        onPressed: () {},
        child: const Text(
          "Join the movement!",
          style: TextStyle(color: Colors.black),
        ),
      ),
      image: Center(
        child: Image.asset("assets/tree.png"),
      ),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: IntroductionScreen(
          pages: pages,
          dotsDecorator: const DotsDecorator(
            color: Color.fromARGB(255, 88, 87, 87),
            size: Size(10, 10),
            activeColor: Colors.black,
            activeSize: Size.square(15),
          ),
          showDoneButton: true,
          done: const Text(
            "Login",
            style: TextStyle(fontSize: 20),
          ),
          showSkipButton: true,
          skip: const Text(
            "Skip",
            style: TextStyle(fontSize: 20),
          ),
          showNextButton: true,
          next: const Icon(Icons.arrow_forward, size: 25),
          onDone: () => onDone(context),
          curve: Curves.linear,
        ),
      ),
    );
  }

  void onDone(context) {
    // Navigate to a new screen when onboarding is finished
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const Login(),
      ),
    );
  }
}
