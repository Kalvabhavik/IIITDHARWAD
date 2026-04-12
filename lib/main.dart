import "package:flutter/cupertino.dart";
import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";
import "package:url_launcher/url_launcher.dart";
import "Myhomepage.dart";
import "Login.dart";
import "dart:ui";
import 'package:glassmorphism/glassmorphism.dart';
import 'package:just_audio/just_audio.dart';

//
void main() {
  runApp(const Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> with SingleTickerProviderStateMixin {
  final player=AudioPlayer();


  Future<void> _launchfacebook() async {
    final Uri url = Uri.parse(
      'https://www.facebook.com/people/IIIT-Dharwad/100064315712672/',
    );

    // learned from gemini
    await launchUrl(url, mode: LaunchMode.externalApplication);
  }

  @override
  void initState() {

    super.initState();
    player.setAsset("assets/iiit.mp3");
    player.play();

  }

  Future<void> _launchlinkedin() async {
    final Uri url = Uri.parse(
      'https://in.linkedin.com/company/indian-institute-of-information-technology-dharwad-karnataka',
    );

    // learned from gemini
    await launchUrl(url, mode: LaunchMode.externalApplication);
  }

  Future<void> _launchiiit() async {
    final Uri url = Uri.parse('https://www.iiitdwd.ac.in/');

    // learned from gemini
    await launchUrl(url, mode: LaunchMode.platformDefault);
  }

  Future<void> _launchfeed() async {
    final Uri url = Uri.parse(
      "https://docs.google.com/forms/d/e/1FAIpQLSdW7sGSH5s5l9H8_2mn2I8VSvotO6J95c0_rZiKRm9QxLLrSw/viewform?usp=publish-editor",
    );

    // learned from gemini
    await launchUrl(url, mode: LaunchMode.inAppWebView);
  }

  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [Color.fromARGB(255, 56, 82, 180), Colors.white],
                  radius: 1.5,
                  center: Alignment.topCenter,
                ),
              ),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: _launchiiit,
                        child: Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: DecorationImage(
                              image: AssetImage(
                                "assets/iiit.png",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 100,
                        width: 300,
                        color: Colors.transparent,
                        child: CupertinoButton(
                          onPressed: _launchiiit,

                          pressedOpacity: 0.1,

                          sizeStyle: CupertinoButtonSize.small,
                          child: Text(
                            "IIIT DHARWAD",
                            style: GoogleFonts.aboreto(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      Builder(
                        builder: (context) {
                          return TextButton(
                            onPressed: () {
                              player.pause();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ),
                              );
                            },
                            child: Text("GET STARTED"),
                          );
                        },
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        height: 200,
                        width: 350,
                        child: PageView(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: DecorationImage(
                                  image: AssetImage("assets/iiit1.jpeg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: DecorationImage(
                                  image: AssetImage("assets/iiit2.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: DecorationImage(
                                  image: AssetImage("assets/iiit3.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            child: CupertinoButton(
                              sizeStyle: CupertinoButtonSize.large,
                              pressedOpacity: 0.2,
                              onPressed: () {
                                launchUrl(
                                  Uri.parse(
                                    'https://www.instagram.com/iiit.dharwad/',
                                  ),
                                  mode: LaunchMode.externalApplication,
                                );
                              },
                              child: Image.asset("assets/iiitdwdinsta.png"),
                            ),
                          ),
                          Container(
                            height: 150,
                            width: 150,
                            child: CupertinoButton(
                              sizeStyle: CupertinoButtonSize.large,
                              pressedOpacity: 0.2,
                              onPressed: _launchfacebook,
                              child: Image.asset("assets/iiitdwdfacebook.png"),
                            ),
                          ),
                          Container(
                            height: 100,
                            width: 100,
                            child: CupertinoButton(
                              sizeStyle: CupertinoButtonSize.large,
                              pressedOpacity: 0.2,
                              onPressed: _launchlinkedin,
                              child: Image.asset("assets/iiitdwdlinkedin.png"),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.feedback),
                          TextButton(
                            onPressed: _launchfeed,
                            child: Text("Feedback"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
