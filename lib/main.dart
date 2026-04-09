import "package:flutter/cupertino.dart";
import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";
import "Myhomepage.dart";
import "Login.dart";
import "dart:ui";
import 'package:glassmorphism/glassmorphism.dart';

//
void main() {
  runApp(const Myapp());
}

class Myapp extends StatefulWidget{
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> with SingleTickerProviderStateMixin{

  @override
  Widget build(context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(




          body: Stack(
            children: [Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: RadialGradient(

                  colors: [Color.fromARGB(255, 56, 82, 180),Colors.white],
                  radius: 1.5,
                  center: Alignment.topCenter,


                ),

              ),
              child: SafeArea(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,

                    ),
                    Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                            image: NetworkImage("https://aiwc.org.au/wp-content/uploads/2022/06/IIIT-Dharwad-logo.webp"

                            ),
                        fit: BoxFit.cover,
                        )
                      ),
                    ),
                    Container(
                      height: 100,
                      width: 300,
                      color: Colors.transparent,
                      child: CupertinoButton(onPressed: () {  },

                          pressedOpacity: 0.1,

                          sizeStyle: CupertinoButtonSize.small,
                      child: Text("IIIT DHARWAD",
                      style: GoogleFonts.aboreto(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),)),
                    ),


                        Builder(
                          builder: (context) {
                            return TextButton(onPressed: (){

                              Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                            }, child: Text("GET STARTED"));
                          }
                        ),
                    Container(
                      height: 100, width: 300,
                      color: Colors.deepPurple,
                      child: PageView(
                        children: const [
                          Center(child: Text('Page 1')),
                          Center(child: Text('Page 2')),
                          Center(child: Text('Page 3')),
                        ],
                      ),
                    )






                            ]
                          ),
              ),
          ),],),),);
  }
}

