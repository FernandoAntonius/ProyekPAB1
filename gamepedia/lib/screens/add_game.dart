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
    
    body: SingleChildScrollView(
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text('Add Game', style: TextStyle(fontFamily: 'Quicksand', fontSize: 20, color: Colors.white)),
             SizedBox(height: 12,),
             

          ],),
        
        
       
      
    ),);
  }
}
