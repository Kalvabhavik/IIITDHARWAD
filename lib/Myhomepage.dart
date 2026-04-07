import 'package:flutter/material.dart';
import 'package:hydro_glass_nav_bar/hydro_glass_nav_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabcontorller;

  @override
  void initState() {
    super.initState();
    _tabcontorller = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabcontorller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 37, 38, 54),

      body: SafeArea(
        child: Stack(
          children: [
            TabBarView(
              controller: _tabcontorller,
              children: [
                Scaffold(
                  body: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.cyan, Colors.transparent],
                            begin: AlignmentGeometry.bottomCenter,
                            end: AlignmentGeometry.topCenter,
                          ),
                        ),
                      ),
                      CustomScrollView(
                        slivers: [
                          SliverAppBar(
                            expandedHeight: 50,
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(40)
                            ),
                            flexibleSpace: Row(

                              children: [
                                SizedBox(width: 50,),
                                Image.network("https://aiwc.org.au/wp-content/uploads/2022/06/IIIT-Dharwad-logo.webp"),
                                Text("        Home"
                                ,style: GoogleFonts.aBeeZee(
                                    textStyle: TextStyle(
                                      fontSize: 30,
                                    )
                                  ),),
                              ],
                            ),
                            actions: [
                              IconButton(onPressed: (){
                                _tabcontorller.animateTo(3);
                              }, icon: Icon(Icons.settings))
                            ],


                          )
                          ]
                      )
                    ],
                  ),
                ),

                Container(
                  color: Color.fromARGB(200, 37, 38, 54),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigator.push(context, MaterialPageRoute(builder: //)
                      },
                      child: Text("child"),
                    ),
                  ),
                ),
                Container(
                  color: Color.fromARGB(200, 37, 38, 54),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigator.push(context, MaterialPageRoute(builder: //)
                      },
                      child: Text("child"),
                    ),
                  ),
                ),
                Container(
                  color: Color.fromARGB(200, 37, 38, 54),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigator.push(context, MaterialPageRoute(builder: //)
                      },
                      child: Text("child"),
                    ),
                  ),
                ),
              ],
            ),

            HydroGlassNavBar(
              controller: _tabcontorller,
              child: [
                HydroGlassNavItem(
                  label: "Home",
                  icon: Icons.home_outlined,
                  selectedIcon: Icons.home,
                ),
                HydroGlassNavItem(
                  label: "Academics",
                  icon: Icons.book_outlined,
                  selectedIcon: Icons.book,
                ),
                HydroGlassNavItem(
                  label: "Events",
                  icon: Icons.emoji_nature_rounded,
                  selectedIcon: Icons.emoji_nature,
                ),
                HydroGlassNavItem(
                  label: "Settings",
                  icon: Icons.settings_applications_outlined,
                  selectedIcon: Icons.settings_applications,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
