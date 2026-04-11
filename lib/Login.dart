import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import "Myhomepage.dart";
import "hi.dart";


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});


  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool fav=true;

  List<String> L=[];



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
            child: Stack(
              children: [
                Container(
                    height:double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color.fromARGB(255,207, 236, 243),Colors.white],
                          begin: AlignmentGeometry.bottomEnd,
                          end: AlignmentGeometry.topStart,


                        )
                    )


                ),

                Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        IconButton.outlined(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back)),
                      ],
                    ),



                    Container(
                      height: 68,
                      width:330,
                      decoration: BoxDecoration(
                        color: CupertinoColors.systemCyan,
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
                            style: GoogleFonts.aBeeZee(
                              color: Colors.white,
                              fontSize: 18,
                            ),




                            controller: TextEditingController(),
                            autocorrect: true,

                            decoration: InputDecoration(
                              hintText: "Enter The Email ID",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),



                            ),
                            onChanged: (val){
                              if(val=="Secret"){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApps()));

                              }
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
              ),]
            )
        ),
      ),
    );
  }
}


