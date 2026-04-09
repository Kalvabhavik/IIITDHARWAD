import "package:flutter/cupertino.dart";
import 'package:flutter/material.dart';
import "Myhomepage.dart";
import "Login.dart";
import "dart:ui";
import 'package:glassmorphism/glassmorphism.dart';

//
void main() {
  runApp(const Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  List<bool> fav=[true,true];
  double _val=0;
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
                gradient: LinearGradient(

                  colors: [Colors.deepPurple,Color.fromARGB(255, 241, 233, 224)],
                  begin: AlignmentGeometry.topCenter,
                  end: AlignmentGeometry.bottomCenter,


                ),

              ),
              child: Column(
                children: [

                  Container(
                    height: 300,
                    width: 200,
                    color: Colors.transparent,
                    child: CupertinoButton(onPressed: () {  },

                        pressedOpacity: 0.1,

                        sizeStyle: CupertinoButtonSize.small,
                    child: Text("IIIT DHARWAD",
                    style: TextStyle(
                      fontSize: 30.0,
                    ),)),
                  ),

                      Builder(
                        builder: (context) {
                          return TextButton(onPressed: (){

                            Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                          }, child: Text("GET STARTED"));
                        }
                      ),






            ]
          ),
          ),],),),);
  }
}

