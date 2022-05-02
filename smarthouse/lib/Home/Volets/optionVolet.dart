import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smarthouse/Home/Led/addLed.dart';
import 'package:smarthouse/Home/Volets/addVolet.dart';

class deleteVolet extends StatefulWidget {
  const deleteVolet({ Key? key }) : super(key: key);

  @override
  State<deleteVolet> createState() => _deleteVoletState();
}

class _deleteVoletState extends State<deleteVolet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listVolet(),
      
    );
  }
}


class listVolet extends StatefulWidget {
  const listVolet({ Key? key }) : super(key: key);

  @override
  State<listVolet> createState() => _listVoletState();
}

class _listVoletState extends State<listVolet> {
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




  
 Stream<QuerySnapshot> statusVolet = FirebaseFirestore.instance.collection('Volet').snapshots(includeMetadataChanges: true);
  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<QuerySnapshot>(
      stream: statusVolet,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView(
          
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
          Map<String, dynamic> statusVolet = document.data()! as Map<String, dynamic>;
 
           
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
          Text("Volet"),
          Text('Nom : ${statusVolet['nom']} ',),
          Text('Pièce :  ${statusVolet['piece']}',),
        ],),
       
    
ElevatedButton(
  
  onPressed: (){
    FirebaseFirestore.instance.collection('Volet').doc(document.id).delete();



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
}class modifierVolet extends StatefulWidget {
  const modifierVolet({ Key? key }) : super(key: key);

  @override
  State<modifierVolet> createState() => _modifierVoletState();
}

class _modifierVoletState extends State<modifierVolet> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Option Capteur Volet'),
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
    MaterialPageRoute(builder: (context) => const addVolet()));
  
  
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
    MaterialPageRoute(builder: (context) => const deleteVolet()));
  
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