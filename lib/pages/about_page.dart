import 'package:flutter/material.dart';
import 'package:mortext/constants/Constants.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('About APP', style: Constants.titleTextFont),
              const SizedBox(height: 20),
              Text(
                "MORTEXT is a simple and easy to convert text to morse code which is displayed through torch of smart phone. It is not designed to be lightweight, fast and optimized. Just use it as a disco light IG. Just don't waste your time on this stupid app.",
                style: Constants.textFont,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 35),
              Text('How to use', style: Constants.titleTextFont),
              const SizedBox(height: 20),
              Text(
                "1. Enter the text you want to convert to morse code or press get sample text to get a sample text.\n"
                "2. Press play morse code button to start the disco light.\n"
                "3. The app will use the torch of your phone to display the morse code.\n"
                "4. Enjoy the disco light effect!",
                style: Constants.textFont,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 35),
              Text('Cons', style: Constants.titleTextFont),
              const SizedBox(height: 20),
              Text(
                "1. Not Practical on mobile fr.\n"
                "2. Not Optimised.\n"
                "3. I am broke.\n"
                "4. Donate me some money.\n",
                style: Constants.textFont,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 35),
              Text('Pros', style: Constants.titleTextFont),
              const SizedBox(height: 20),
              Text(
                "1. None\n",
                style: Constants.textFont,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 35),
              Text('More Ideas to improve it', style: Constants.titleTextFont),
              const SizedBox(height: 20),
              Text(
                "1. Add sound or vibration.\n"
                "2. Instead of torce use infrared.\n"
                "3. Make decoder for the morse code.\n"
                "4. Save the morse code text in a .txt file.\n"
                "5. Optimize the code probably.\n",
                style: Constants.textFont,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
