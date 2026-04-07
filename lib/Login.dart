import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "Myhomepage.dart";


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});


  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool fav=true;

  List<String> L=[];
  void initState() {
    super.initState();
    for (int i = 0; i < 214; i++) {
       L.add("25BCS$i@iiitdwd.ac.in");
    }
  }
  List<Container> C=[];


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
            child: Center(
              child: Column(
                children: [


                  Container(
                    height: 68,
                    width:250,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 81, 84, 101),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10.0,
                          color: Colors.white10,



                        ),
                        BoxShadow(
                            blurRadius: 10.0,
                            color: Colors.white

                        )

                      ]
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: TextField(
                          obscureText: fav,
                          controller: TextEditingController(),
                          autocorrect: true,
                          autofillHints: L,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(onPressed: (){
                              setState(() {
                                fav=!fav;
                              });
                            }, icon: Icon(fav?Icons.visibility_outlined:Icons.visibility_off_outlined)),


                            hintText: "example@iiitdwd.ac.in",
                            labelText: "EMAIL",


                          ),
                          onChanged: (val){
                            print(val);
                          },
                          onSubmitted: (val){
                            setState(() {
                              if(val.endsWith("@iiitdwd.ac.in") || val=="00"){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage()));}
                              else{
                                Navigator.pop(context);
                              }


                            });
                          },

                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
        ),
      ),
    );
  }
}

class AnimatedGlassCard extends StatefulWidget {
  final Widget child;
  final double width;
  final double height;

  const AnimatedGlassCard({
    Key? key,
    required this.child,
    this.width = 300,
    this.height = 60,
  }) : super(key: key);

  @override
  State<AnimatedGlassCard> createState() => _AnimatedGlassCardState();
}

class _AnimatedGlassCardState extends State<AnimatedGlassCard>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _floatAnimation;

  @override
  void initState() {
    super.initState();
    // 1. Setup the controller to loop continuously back and forth
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3), // 3 seconds per cycle
    )..repeat(reverse: true);

    // 2. Setup the floating movement (0 to -15 pixels up)
    _floatAnimation = Tween<double>(begin: 0, end: -15).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutSine),
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Always dispose of controllers to prevent memory leaks!
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // AnimatedBuilder rebuilds this specific widget every frame of the animation
    return AnimatedBuilder(
      animation: _floatAnimation,
      builder: (context, child) {
        return Transform.translate(
          // Applies the up/down movement
          offset: Offset(0, _floatAnimation.value),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
              child: Container(
                width: widget.width,
                height: widget.height,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20.0),
                    // Animate the border opacity to simulate a shifting light reflection
                    border: Border.all(
                      color: Colors.white.withOpacity(0.15 + (_controller.value * 0.15)),
                      width: 1.5,
                    ),
                    // Animate the shadow to grow as the card "lifts" off the background
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 20,
                        offset: Offset(0, 10 - (_floatAnimation.value / 2)),
                      )
                    ]
                ),
                child: widget.child,
              ),
            ),
          ),
        );
      },
    );
  }
}