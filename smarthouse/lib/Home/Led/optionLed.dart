import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smarthouse/Home/Led/addLed.dart';

class optionLed extends StatefulWidget {
  const optionLed({ Key? key }) : super(key: key);

  @override
  State<optionLed> createState() => _optionLedState();
}

class _optionLedState extends State<optionLed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listLed(),
      
    );
  }
}


class listLed extends StatefulWidget {
  const listLed({ Key? key }) : super(key: key);

  @override
  State<listLed> createState() => _listLedState();
}

class _listLedState extends State<listLed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
   backgroundColor: Color.fromARGB(221, 23, 22, 22),
        
      ),
      body: supp()
    );
  }
}

class supp extends StatefulWidget {
  const supp({ Key? key }) : super(key: key);

  @override
  State<supp> createState() => _suppState();
}

class _suppState extends State<supp> {




  
 Stream<QuerySnapshot> statusLed = FirebaseFirestore.instance.collection('Led').snapshots(includeMetadataChanges: true);
  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<QuerySnapshot>(
      stream: statusLed,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView(
          
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
          Map<String, dynamic> ledStatus = document.data()! as Map<String, dynamic>;
   var collection = FirebaseFirestore.instance.collection('Led');
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
          Text("Led"),
          Text('Nom : ${ledStatus['nom']} ',),
          Text('Pièce :  ${ledStatus['piece']}',),
        ],),
       
    
ElevatedButton(
  
  onPressed: (){
    FirebaseFirestore.instance.collection('Led').doc(document.id).delete();



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
}class modifierLed extends StatefulWidget {
  const modifierLed({ Key? key }) : super(key: key);

  @override
  State<modifierLed> createState() => _modifierLedState();
}

class _modifierLedState extends State<modifierLed> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Option Capteur Led'),
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
    MaterialPageRoute(builder: (context) => const optionLed()));
  
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
//FirebaseFirestore.instance.collection('Led').doc(document.id).delete();