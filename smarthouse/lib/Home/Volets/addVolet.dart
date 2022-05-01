import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class addVolet extends StatefulWidget {
  const addVolet({ Key? key }) : super(key: key);

  @override
  State<addVolet> createState() => _addVoletState();
}

class _addVoletState extends State<addVolet> {
  final nameController = TextEditingController();
  final pieceController = TextEditingController();
  final posterController = TextEditingController();
  List<String> categories = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajout Capteur'),
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


ListTile(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(4),
    side: const BorderSide(color: Colors.white30, width: 1.5),
  ),
  title: Row(
    children: [
      const Text('Piece du capteur: '),
      Expanded(
        child: TextField(
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          controller: pieceController,
        ),
      ),
    ],
  ),
),

ElevatedButton(
  style: ElevatedButton.styleFrom(
    minimumSize: const Size.fromHeight(50),
  ),
  onPressed: () {
    if(pieceController!="" && nameController!=""){ 
      FirebaseFirestore.instance.collection('Volet').
    add({
      'nom': nameController.value.text ,
      'status': false,
      'piece': pieceController.value.text,
      
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