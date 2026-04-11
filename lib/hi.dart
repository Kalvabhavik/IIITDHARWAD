import 'package:flutter/material.dart';
import 'package:panorama_image/panorama_image.dart';

void main() {
  runApp(const MyApps());
}

class MyApps extends StatelessWidget {
  const MyApps({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Panorama Example',
    );
  }
}