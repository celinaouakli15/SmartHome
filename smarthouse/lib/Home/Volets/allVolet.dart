import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smarthouse/Home/Volets/addVolet.dart';
import 'package:smarthouse/Home/Volets/optionVolet.dart';

import '../Led/addLed.dart';

class allVolet extends StatefulWidget {
  const allVolet({ Key? key }) : super(key: key);

  @override
  State<allVolet> createState() => _allVoletState();
}

class _allVoletState extends State<allVolet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      
           backgroundColor: Color.fromARGB(221, 23, 22, 22),

        title: Text("Volets"),
       
 
        
        actions: [
       
         IconButton(
            icon: Icon(Icons.add), onPressed: () { 
                   Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const modifierVolet(),
    fullscreenDialog: true,
    )
    );

             },
        )
        
        ],
      ),
     
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: [    
               Text("SALON"),voletSalon(),
                Text("CUISINE"),voletCuisine(),
                 Text("CHAMBRE"),voletChambre(),
                  Text("GARAGE"),voletGarage()
         
             
      
          
        ],
        ),
        ),
      )
      
    );
  }
  
}


class voletSalon extends StatefulWidget {
  const voletSalon({ Key? key }) : super(key: key);

  @override
  State<voletSalon> createState() => _voletSalonState();
}

class _voletSalonState extends State<voletSalon> {





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

        return Column(
          
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> statusVolet = document.data()! as Map<String, dynamic>;
               bool valeur = statusVolet['status'];
         
           
            return Container(
              child: Column(
                children: [
                
                  if(statusVolet['piece']=="salon")...[
               Container(color: Colors.red,
               child:  Container(
                 margin: const EdgeInsets.all(20.0),
                 
                 decoration: BoxDecoration(border: Border.all(width: 2),
                                          borderRadius: BorderRadius.circular(15),
                                          
                                          
                  ),
            child: Row(
              
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
        
              children: [ 
              IconButton(icon: Icon(Icons.lightbulb), onPressed: () {  },
        ),
                Expanded( 
                  child: Text('Volet ${statusVolet['nom']} : ${statusVolet['status']!=true?'fermer':'ouvert'}',
           
                        style: TextStyle(fontSize: 20,fontWeight: 
                        FontWeight.w500,),),
                ),
                
                     
                  CupertinoSwitch(
  value:statusVolet['status'],
  onChanged: (value){
    setState(() {

if(statusVolet['status']==true){
                      FirebaseFirestore.instance.collection('Volet').
                     doc(document.id)
                    .update({
                              "status": false
                               })
                    .then((value) => print("User Updated"))
                    .catchError((error) => print("Failed to update user: $error"));}
                    else{ FirebaseFirestore.instance.collection('Volet').
                     doc(document.id)
                    .update({
                    "status": true
                    })
                    .then((value) => print("User Updated"))
                    .catchError((error) => print("Failed to update user: $error"));}
                                  


    },
    );
  },                          
  thumbColor: Color.fromARGB(255, 255, 255, 255),
  activeColor: Colors.green,
  trackColor: Colors.orange,


),
              
              ],
            ),
          ), ),],
   
                
                
                     ]
                  
                
                
              ),
            );
          }).toList(),
        );
      },
      
    );
  }
}

class voletCuisine extends StatefulWidget {
  const voletCuisine({ Key? key }) : super(key: key);

  @override
  State<voletCuisine> createState() => _voletCuisineState();
}

class _voletCuisineState extends State<voletCuisine> {
 

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

        return Column(
          
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> statusVolet = document.data()! as Map<String, dynamic>;
               bool valeur = statusVolet['status'];
         
           
            return Container(
              child: Column(
                children: [
            if(statusVolet['piece']=="cuisine")...[
               Container(color: Colors.yellow,
               child:  Container(
                 margin: const EdgeInsets.all(20.0),
                 
                 decoration: BoxDecoration(border: Border.all(width: 2),
                                          borderRadius: BorderRadius.circular(15),
                                          
                                          
                  ),
            child: Row(
              
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
        
              children: [ 
              IconButton(icon: Icon(Icons.lightbulb), onPressed: () {  },
        ),
                Expanded( 
                  child: Text('Volet ${statusVolet['nom']} : ${statusVolet['status']!=true?'fermer':'ouvert'}',
           
                        style: TextStyle(fontSize: 20,fontWeight: 
                        FontWeight.w500,),),
                ),
                
                     
                  CupertinoSwitch(
  value:statusVolet['status'],
  onChanged: (value){
    setState(() {

if(statusVolet['status']==true){
                      FirebaseFirestore.instance.collection('Volet').
                     doc(document.id)
                    .update({
                              "status": false
                               })
                    .then((value) => print("User Updated"))
                    .catchError((error) => print("Failed to update user: $error"));}
                    else{ FirebaseFirestore.instance.collection('Volet').
                     doc(document.id)
                    .update({
                    "status": true
                    })
                    .then((value) => print("User Updated"))
                    .catchError((error) => print("Failed to update user: $error"));}
                                  


    },
    );
  },                          
  thumbColor: Color.fromARGB(255, 255, 255, 255),
  activeColor: Colors.green,
  trackColor: Colors.orange,


),
              
              ],
            ),
          ),
          ),
          ],             
                     ]                
              ),
            );
          }).toList(),
        );
      },
      
    );
  }
}

class voletChambre extends StatefulWidget {
  const voletChambre({ Key? key }) : super(key: key);

  @override
  State<voletChambre> createState() => _voletChambreState();
}

class _voletChambreState extends State<voletChambre> {
 

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

        return Column(
          
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> statusVolet = document.data()! as Map<String, dynamic>;
               bool valeur = statusVolet['status'];
         
           
            return Container(
              child: Column(
                children: [
                
if(statusVolet['piece']=="chambre")...[

               Column(
                 children: [
                
                   Container(color: Colors.green,
                   child:  Container(
                     margin: const EdgeInsets.all(20.0),
                     
                     decoration: BoxDecoration(border: Border.all(width: 2),
                                              borderRadius: BorderRadius.circular(15),
                                              
                                              
                      ),
            child: Row(
              
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
        
              children: [ 
              IconButton(icon: Icon(Icons.lightbulb), onPressed: () {  },
        ),
                    Expanded( 
                  child: Text('Volet ${statusVolet['nom']} : ${statusVolet['status']!=true?'fermer':'ouvert'}',
           
                            style: TextStyle(fontSize: 20,fontWeight: 
                            FontWeight.w500,),),
                    ),
                    
                         
                      CupertinoSwitch(
  value:statusVolet['status'],
  onChanged: (value){
    setState(() {

if(statusVolet['status']==true){
                          FirebaseFirestore.instance.collection('Volet').
                         doc(document.id)
                        .update({
                                  "status": false
                                   })
                        .then((value) => print("User Updated"))
                        .catchError((error) => print("Failed to update user: $error"));}
                        else{ FirebaseFirestore.instance.collection('Volet').
                         doc(document.id)
                        .update({
                        "status": true
                        })
                        .then((value) => print("User Updated"))
                        .catchError((error) => print("Failed to update user: $error"));}
                                      


    },
    );
  },                          
  thumbColor: Color.fromARGB(255, 255, 255, 255),
  activeColor: Colors.green,
  trackColor: Colors.orange,


),
              
              ],
            ),
          ), ),
                 ],
               )




                ],
                           
                  
                  
     
                    
                
                     ]
                  
                
                
              ),
            );
          }).toList(),
        );
      },
      
    );
  }
}

class voletGarage extends StatefulWidget {
  const voletGarage({ Key? key }) : super(key: key);

  @override
  State<voletGarage> createState() => _voletGarageState();
}

class _voletGarageState extends State<voletGarage> {
  

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

        return Column(
          
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> statusVolet = document.data()! as Map<String, dynamic>;
               bool valeur = statusVolet['status'];
         
           
            return Container(
              child: Column(
                children: [
                
                  if(statusVolet['piece']=="garage")...[
               Container(color: Colors.purple,
               child:  Container(
                 margin: const EdgeInsets.all(20.0),
                 
                 decoration: BoxDecoration(border: Border.all(width: 2),
                                          borderRadius: BorderRadius.circular(15),
                                          
                                          
                  ),
            child: Row(
              
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
        
              children: [ 
              IconButton(icon: Icon(Icons.lightbulb), onPressed: () {  },
        ),
                Expanded( 
                  child: Text('Volet ${statusVolet['nom']} : ${statusVolet['status']!=true?'fermer':'ouvert'}',
           
                        style: TextStyle(fontSize: 20,fontWeight: 
                        FontWeight.w500,),),
                ),
                
                     
                  CupertinoSwitch(
  value:statusVolet['status'],
  onChanged: (value){
    setState(() {

if(statusVolet['status']==true){
                      FirebaseFirestore.instance.collection('Volet').
                     doc(document.id)
                    .update({
                              "status": false
                               })
                    .then((value) => print("User Updated"))
                    .catchError((error) => print("Failed to update user: $error"));}
                    else{ FirebaseFirestore.instance.collection('Volet').
                     doc(document.id)
                    .update({
                    "status": true
                    })
                    .then((value) => print("User Updated"))
                    .catchError((error) => print("Failed to update user: $error"));}
                                  


    },
    );
  },                          
  thumbColor: Color.fromARGB(255, 255, 255, 255),
  activeColor: Colors.green,
  trackColor: Colors.orange,


),
              
              ],
            ),
          ), ),],

                  
                  
     
                    
                
                     ]
                  
                
                
              ),
            );
          }).toList(),
        );
      },
      
    );
  }
}

