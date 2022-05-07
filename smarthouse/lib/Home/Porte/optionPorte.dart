import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:multiselect/multiselect.dart';

class optionPorte extends StatefulWidget {
  const optionPorte({ Key? key }) : super(key: key);

  @override
  State<optionPorte> createState() => _optionPorteState();
}

class _optionPorteState extends State<optionPorte> {
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listPorte (),
      
    );
  }
}



class listPorte extends StatefulWidget {
  const listPorte({ Key? key }) : super(key: key);

  @override
  State<listPorte> createState() => _listPorteState();
}

class _listPorteState extends State<listPorte> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
   backgroundColor: Color.fromARGB(221, 23, 22, 22),
        
      ),
      body: suppPorte()
    );
  }
}

class suppPorte extends StatefulWidget {
  const suppPorte({ Key? key }) : super(key: key);

  @override
  State<suppPorte> createState() => _suppPorteState();
}

class _suppPorteState extends State<suppPorte> {




  
 Stream<QuerySnapshot> statusPorte = FirebaseFirestore.instance.collection('Porte').snapshots(includeMetadataChanges: true);
  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<QuerySnapshot>(
      stream: statusPorte,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView(
          
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
          Map<String, dynamic> statusPorte = document.data()! as Map<String, dynamic>;
List<String> deleted = [];
 bool test =  false;
           
            return Container(
              child: Column(
                children: [Container(
                  //child:
                  //Image.asset('assets/images/${ledStatus['status']!=true?'off.png':'on.png'}'),
                  ),
                SizedBox(height: 10,),
      Row(
        
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Column
        
        (
          children: [ 
          Text("Porte"),
          Text('Nom : ${statusPorte['nom']} ',),
          Text('Pièce :  ${statusPorte['piece']}',),
        ],),
       
    
ElevatedButton(
  
  onPressed: (){
    FirebaseFirestore.instance.collection('Porte').doc(document.id).delete();



}, child: Text("Supprimer")),

      ],),
              
                  
                ],
                
              ),
            );
          }).toList(),
        );
      },
    );
  }
}class modifierPorte extends StatefulWidget {
  const modifierPorte({ Key? key }) : super(key: key);

  @override
  State<modifierPorte> createState() => _modifierPorteState();
}

class _modifierPorteState extends State<modifierPorte> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Option Capteur Porte'),
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
    MaterialPageRoute(builder: (context) => const addPorte()));
  
  
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
    MaterialPageRoute(builder: (context) => const optionPorte()));
  
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


class addPorte extends StatefulWidget {
  const addPorte({ Key? key }) : super(key: key);

  @override
  State<addPorte> createState() => _addPorteState();
}

class _addPorteState extends State<addPorte> {
  final nameController = TextEditingController();
  final pieceController = TextEditingController();
  final posterController = TextEditingController();
  List<String> pieces = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajout Porte'),
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
      FirebaseFirestore.instance.collection('Porte').
      doc(nameController.value.text).
      set
    ({
      'nom': nameController.value.text ,
      'status': false,
      'piece':alors,
      
    });
    Navigator.pop(context);
    }

  },
  child: const Text('Ajouter'),
),

],
      ),
      ),
    );
  }
}
//FirebaseFirestore.instance.collection('Led').doc(document.id).delete();