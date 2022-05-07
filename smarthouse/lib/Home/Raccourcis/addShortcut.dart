import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:multiselect/multiselect.dart';

class addShortcut extends StatefulWidget {
  const addShortcut({ Key? key }) : super(key: key);

  @override
  State<addShortcut> createState() => _addShortcutState();
}

class _addShortcutState extends State<addShortcut> {
  final nameController = TextEditingController();
  final pieceController = TextEditingController();
  final posterController = TextEditingController();
  bool suivant = false;
  List<String> pieces = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajout Shortcut'),
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
      const Text('Nom du shortcut : '),
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
    setState(() {
      suivant = true;
    });
    
  },
  child: const Text('Suivant'),
),

   if(suivant== true)...[

ListTile(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(4),
    side: const BorderSide(color: Colors.white30, width: 1.5),
  ),
  title: Row(
    children: [
      const Text('capteur : '),
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
     
       FirebaseFirestore.instance.collection('Shortcut').
    add({
      'nom': nameController.value.text ,
      'status': false,
      
      
    });
    Navigator.pop(context);
      

    }
  },
  child: const Text('Ajouter'),
),



],//if

],
      ),
      ),
    );
  }
}