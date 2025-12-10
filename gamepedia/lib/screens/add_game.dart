import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class AddGameScreen extends StatefulWidget {
  const AddGameScreen({super.key});

  @override
  State<AddGameScreen> createState() => _AddGameScreen();
}

class _AddGameScreen extends State<AddGameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
    body: Container(
      child: Text('Add Game',
      ),
    ),);
  }
}
