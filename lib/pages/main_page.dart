import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mortext/constants/Constants.dart';
import 'package:torch_light/torch_light.dart';
import 'dart:async';

TextEditingController textEditingController = TextEditingController();

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Future<void> _torchOn() async {
    try {
      await TorchLight.enableTorch();
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error turning on the torch: $e')));
    }
  }

  Future<void> _torchOff() async {
    try {
      await TorchLight.disableTorch();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error turning off the torch: $e')),
      );
    }
  }

  bool _isMorseBlinking = false;
  Timer? _morseTimer;

  // Define Morse code mapping
  final Map<String, String> morseCodeMap = {
    'a': '.-',
    'b': '-...',
    'c': '-.-.',
    'd': '-..',
    'e': '.',
    'f': '..-.',
    'g': '--.',
    'h': '....',
    'i': '..',
    'j': '.---',
    'k': '-.-',
    'l': '.-..',
    'm': '--',
    'n': '-.',
    'o': '---',
    'p': '.--.',
    'q': '--.-',
    'r': '.-.',
    's': '...',
    't': '-',
    'u': '..-',
    'v': '...-',
    'w': '.--',
    'x': '-..-',
    'y': '-.--',
    'z': '--..',
    '0': '-----',
    '1': '.----',
    '2': '..---',
    '3': '...--',
    '4': '....-',
    '5': '.....',
    '6': '-....',
    '7': '--...',
    '8': '---..',
    '9': '----.',
    '.': '.-.-.-',
    ',': '--..--',
    '?': '..--..',
    "'": '.----.',
    '!': '-.-.--',
    '/': '-..-.-',
    '(': '-.--.',
    ')': '-.--.-',
    '&': '.-...',
    ':': '---...',
    ';': '-.-.-.',
    '=': '-...-',
    '+': '.-.-.',
    '-': '-....-',
    '_': '..--.-',
    '"': '.-..-.-',
    '\$': '...-..-',
    '@': '.--.-.',
    ' ': ' ', // Space between words
  };

  Future<void> _playMorseCode(String text) async {
    if (_isMorseBlinking) {
      _stopMorseBlinking();
      return;
    }

    _isMorseBlinking = true;
    String morse = '';
    text.toLowerCase().split('').forEach((char) {
      if (morseCodeMap.containsKey(char)) {
        morse += '${morseCodeMap[char]!} '; // Add space between letters
      }
    });
    morse = morse.trim(); // Remove trailing space

    final dotDuration = Duration(milliseconds: 1000);
    final dashDuration = Duration(milliseconds: dotDuration.inMilliseconds * 3);
    final symbolPause = Duration(milliseconds: dotDuration.inMilliseconds);
    final wordPause = Duration(milliseconds: dotDuration.inMilliseconds * 7);

    List<Future<void>> actions = [];
    int morseIndex = 0;

    void processNextSignal() async {
      if (!_isMorseBlinking || morseIndex >= morse.length) {
        _stopMorseBlinking();
        return;
      }

      String signal = morse[morseIndex];
      morseIndex++;

      if (signal == '.') {
        actions.add(_torchOn());
        actions.add(Future.delayed(dotDuration));
        actions.add(_torchOff());
        if (morseIndex < morse.length && morse[morseIndex] != ' ') {
          actions.add(Future.delayed(symbolPause));
        }
      } else if (signal == '-') {
        actions.add(_torchOn());
        actions.add(Future.delayed(dashDuration));
        actions.add(_torchOff());
        if (morseIndex < morse.length && morse[morseIndex] != ' ') {
          actions.add(Future.delayed(symbolPause));
        }
      } else if (signal == ' ') {
        actions.add(Future.delayed(wordPause)); // Using wordPause here
      }

      await Future.delayed(Duration.zero); // Allow UI to update
      if (_isMorseBlinking) {
        processNextSignal();
      }
    }

    processNextSignal();
  }

  void _stopMorseBlinking() {
    _isMorseBlinking = false;
    if (mounted) {
      _torchOff();
    }
  }

  @override
  void dispose() {
    _morseTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Lottie.asset('assets/lotties/fire.json', width: 200, height: 200),
              TextField(
                controller: textEditingController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  labelText: 'Enter text for Morse code',
                  labelStyle: Constants.buttonFont,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: Constants.primaryColor,
                      width: 2.0,
                    ),
                  ),
                ),
                style: Constants.textFont,
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  textEditingController.text =
                      'This is a sample text from me.. thanks for testing my application love love you sweetieeee.'; // Sample text
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Constants.secondaryColor,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  textStyle: Constants.buttonFont,
                ),
                child: Text("Get Sample Text"),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _playMorseCode(textEditingController.text);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      _isMorseBlinking ? Colors.red : Constants.primaryColor,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  textStyle: Constants.buttonFont,
                ),
                child: Text(
                  _isMorseBlinking ? "Stop Morse" : "Play Morse Code",
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  textEditingController.clear();
                  _stopMorseBlinking();
                  _torchOff();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      _isMorseBlinking ? Colors.red : Constants.primaryColor,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  textStyle: Constants.buttonFont,
                ),
                child: Text("Clear Text"),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Constants.primaryColor,
    );
  }
}
