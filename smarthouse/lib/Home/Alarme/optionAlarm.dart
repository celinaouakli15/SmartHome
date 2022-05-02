import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smarthouse/Home/Alarme/addAlarme.dart';

class optionAlarme extends StatefulWidget {
  const optionAlarme({ Key? key }) : super(key: key);

  @override
  State<optionAlarme> createState() => _optionAlarmeState();
}

class _optionAlarmeState extends State<optionAlarme> {
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listAlarme(),
      
    );
  }
}


class listAlarme extends StatefulWidget {
  const listAlarme({ Key? key }) : super(key: key);

  @override
  State<listAlarme> createState() => _listAlarmeState();
}

class _listAlarmeState extends State<listAlarme> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
   backgroundColor: Color.fromARGB(221, 23, 22, 22),
        
      ),
      body: suppAlarme()
    );
  }
}

class suppAlarme extends StatefulWidget {
  const suppAlarme({ Key? key }) : super(key: key);

  @override
  State<suppAlarme> createState() => _suppAlarmeState();
}

class _suppAlarmeState extends State<suppAlarme> {




  
 Stream<QuerySnapshot> statusAlarme = FirebaseFirestore.instance.collection('alarm').snapshots(includeMetadataChanges: true);
  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<QuerySnapshot>(
      stream: statusAlarme,
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
   var collection = FirebaseFirestore.instance.collection('alarm');
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
          Text("Alarme"),
          Text('Nom : ${ledStatus['nom']} ',),
          Text('Pièce :  ${ledStatus['piece']}',),
        ],),
       
    
ElevatedButton(
  
  onPressed: (){
    FirebaseFirestore.instance.collection('alarm').doc(document.id).delete();



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
}class modifieralarme extends StatefulWidget {
  const modifieralarme({ Key? key }) : super(key: key);

  @override
  State<modifieralarme> createState() => _modifieralarmeState();
}

class _modifieralarmeState extends State<modifieralarme> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Option Capteur Alarme'),
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
    MaterialPageRoute(builder: (context) => const addAlarme()));
  
  
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
    MaterialPageRoute(builder: (context) => const optionAlarme()));
  
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