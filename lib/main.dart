import 'package:flutter/material.dart';
import 'lamp_room.dart';

void main() {
  runApp(const LampApp());
}

class LampApp extends StatelessWidget {
  const LampApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reading Lamp',
      debugShowCheckedModeBanner: false,
      home: LampRoom(),
    );
  }
}
