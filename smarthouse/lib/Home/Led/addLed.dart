import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:multiselect/multiselect.dart';

class addLed extends StatefulWidget {
  const addLed({ Key? key }) : super(key: key);

  @override
  State<addLed> createState() => _addLedState();
}

class _addLedState extends State<addLed> {
  final nameController = TextEditingController();
  final pieceController = TextEditingController();
  final posterController = TextEditingController();
  List<String> pieces = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajout Led'),
                   backgroundColor: Color.fromARGB(221, 23, 22, 22),

      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [ListTile(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(4),
    side: const BorderSide(color: Colors.white30, width: 1.5),
  ),
  title: Row(
    children: [
      const Text('Nom du capteur : '),
      Expanded(
        child: TextField(
  decoration: const InputDecoration(  
              border: InputBorder.none,
          ),
          controller: nameController,
        ),
      ),
    ],
  ),
),

DropDownMultiSelect(
  onChanged: (List<String> x) {
    setState(() {
      pieces = x;
    });
  },
  options: const [
    'salon',
    'cuisine',
    'chambre',
    'garage'
  ],
  selectedValues: pieces,
  whenEmpty: 'Pièces',
),

ElevatedButton(
  style: ElevatedButton.styleFrom(
    minimumSize: const Size.fromHeight(50),
  ),
  onPressed: () {
    String alors ="";
   alors = pieces[0] ;
   print(alors);
  
   
   
    if(pieceController!="" && nameController!=""){ 
      FirebaseFirestore.instance.collection('Led').
    add({
      'nom': nameController.value.text ,
      'status': false,
      'piece':alors,
      
    });
    Navigator.pop(context);
    }

    Text(" c   a mArCh    e   pPOs");
   
  },
  child: const Text('Ajouter'),
),

],
      ),
      ),
    );
  }
}