import 'package:flutter/material.dart';
import 'package:smarthouse/Home/Led/addLed.dart';
import 'package:smarthouse/Home/Led/delete.dart';

class modifier extends StatefulWidget {
  const modifier({ Key? key }) : super(key: key);

  @override
  State<modifier> createState() => _modifierState();
}

class _modifierState extends State<modifier> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Option Capteur'),
                   backgroundColor: Color.fromARGB(221, 23, 22, 22),

      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              children: [
              


ElevatedButton(
  style: ElevatedButton.styleFrom(
    minimumSize: const Size.fromHeight(50),
  ),
  onPressed: () {
      Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const addLed()));
  
  
  },
  child: const Text('Ajouter'),
),
SizedBox(height: 20,),



ElevatedButton(
  style: ElevatedButton.styleFrom(
    minimumSize: const Size.fromHeight(50),
  ),
  onPressed: () {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const delete()));
  
  },
  child: const Text('Suprimer'),
),

SizedBox(height: 20,),

],
        ),
          ),
        ),
      ),
    );
  }
}