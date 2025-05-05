import 'package:flutter/material.dart';
import 'package:mortext/constants/Constants.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('About Me', style: Constants.titleTextFont),
            const SizedBox(height: 20),
            Text(
              "Donate me some money. I am a student and I am not rich. I am just a student who is trying to make some money. If you want to donate me, please send me some money. I will be very grateful.",
              style: Constants.textFont,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 35),
            Text('Contacts', style: Constants.titleTextFont),
            const SizedBox(height: 20),
            Text(
              "Instagram: _ethical._.aniruddha_\n"
              "Github: EthicalAniruddha\n"
              "LinkedIn: ethical-aniruddha-b59702255\n"
              "X: @EAniruddha\n",
              style: Constants.textFont,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 35),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Constants.secondaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () async {
                String url = 'https://github.com/EthicalAniruddha';
                try {
                  if (await canLaunchUrl(Uri.parse(url))) {
                    await launchUrl(
                      Uri.parse(url),
                      mode: LaunchMode.inAppBrowserView,
                    );
                  }
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Error launching URL: $e'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
              },
              child: Text('      GitHub      ', style: Constants.buttonFont),
            ),
          ],
        ),
      ),
    );
  }
}
