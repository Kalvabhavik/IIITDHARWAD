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
  @override
  Widget build(context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          drawer: Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255,241, 233, 224),
              borderRadius: BorderRadius.only(topRight: Radius.circular(70),bottomRight: Radius.circular(70))
            ),

            width:200,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20,10),
                  child: Container(
                    height: 170,
                    width: 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(50),bottomRight: Radius.circular(50),bottomLeft: Radius.circular(50)),
                      image: DecorationImage(

                          image:

                          NetworkImage("https://aiwc.org.au/wp-content/uploads/2022/06/IIIT-Dharwad-logo.webp"
                          ,),
                              fit: BoxFit.fill,

                      )

                    ),

                  ),
                ),
                Builder(
                  builder: (context) {
                    return ListTile(
                      title: Text("Home",
                      style: TextStyle(
                        color: fav[0]?Color.fromARGB(255,198, 182, 173):Color.fromARGB(100,198, 182, 173),
                      ),),

                     leading: Icon(fav[0]?Icons.home_outlined:Icons.home
                     ,color: Color.fromARGB(255, 37, 38, 5),),
                      onTap: (){


                        setState(() {
                          fav[0]=!fav[0];
                        });
                      },

                    );
                  }
                ),
                Builder(
                    builder: (context) {
                      return ListTile(
                        title: Text("Info",
                          style: TextStyle(
                            color: fav[1]?Color.fromARGB(255,198, 182, 173):Color.fromARGB(100,198, 182, 173),
                          ),),

                        leading: Icon(fav[1]?Icons.info:Icons.info_outline
                          ,color: Colors.white,),
                        onTap: (){


                          setState(() {
                            fav[1]=!fav[1];
                          });
                        },

                      );
                    }
                )
              ],

            ),
          ),

          appBar: AppBar(

          ),

          body: Container(
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
                  child: Center(child: Text("IIIT DHARWAD",
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
                GlassmorphicContainer(
                  width: 100,
                  height: 100,
                  borderRadius: 20,
                  linearGradient: LinearGradient(colors: [Colors.transparent]),
                  border: 2,
                  blur: 5,
                  borderGradient: LinearGradient(colors: [Colors.transparent,Colors.white]),
                child: Center(child: Text("Hello")),),

              ],
            ),
          ),
        ) );
  }
}

