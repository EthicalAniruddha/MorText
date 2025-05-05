import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mortext/constants/Constants.dart';
import 'package:mortext/constants/ScreenRoute.dart';
import 'package:mortext/screens/main_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: Padding(
          padding: EdgeInsets.only(top: 10, bottom: 5),
          child: Text(
            Constants.appTitle,
            style: Constants.titleFont,
            textAlign: TextAlign.center,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black38,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Welcome to Mortext!', style: Constants.textFont),
            const SizedBox(height: 20),
            Lottie.asset('assets/lotties/torch2.json', width: 200, height: 200),
            ElevatedButton(
              onPressed: () {
                MaterialPageRoute(builder: (context) => const WelcomeScreen());
                Navigator.of(
                  context,
                ).pushReplacement(ScreenRoute(child: const MainScreen()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade900,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                elevation: 2.5,
                shadowColor: Colors.redAccent,
                textStyle: Constants.buttonFont,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text('       Get Started       '),
            ),
          ],
        ),
      ),
    );
  }
}
