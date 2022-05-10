import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smarthouse/Home/Led/optionLed.dart';

import 'addLed.dart';

class allLed extends StatefulWidget {
  const allLed({ Key? key }) : super(key: key);

  @override
  State<allLed> createState() => _allLedState();
}

class _allLedState extends State<allLed> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
               backgroundColor: Color.fromARGB(221, 23, 22, 22),

        title: Text("Lumières"),
       
 
        
        actions: [
       
         IconButton(
            icon: Icon(Icons.add), onPressed: () { 
                   Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const modifierLed(),
    fullscreenDialog: true,
    )
    );

             },
        )
        
        ],
      ),
     
      body: Center(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              
              mainAxisAlignment: MainAxisAlignment.center,
              children: [ 
              
                ledSalon(),
                  ledCuisine(),
                 ledChambre(),
                   ledGarage(),
          SizedBox(height: 20,),
            allOnLed(),
               allOffLed(),  
          
            
          ],
          ),
          ),
        ),
      )
      
    );
  }
  
}




class ledSalon extends StatefulWidget {
  const ledSalon({ Key? key }) : super(key: key);

  @override
  State<ledSalon> createState() => _ledSalonState();
}

class _ledSalonState extends State<ledSalon> {
int i = 0;
 List listId = [];
compteur(i){

  i= 0;
}
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
   i++;
        return Column(
          
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> ledStatus = document.data()! as Map<String, dynamic>;
               bool valeur = ledStatus['status'];
         listId.add(document.id);
          
       
      
            return Container(
              child: Column(
                children: [ 
  
                          
                

                         
                  if(ledStatus['piece']=="salon")...[
                   Text("Salon"),
                  
            Container(
                     margin: const EdgeInsets.fromLTRB(20,0,20,0),                 
                 decoration: BoxDecoration(border: Border.all(width: 3),
                                          borderRadius: BorderRadius.circular(15),
                                          
                                          
                  ),
            child: Container(
            
                decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                            color: Colors.red,
                                          
                  ),
              
              child: Row(
                
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
        
                children: [ 
                IconButton(icon: Icon(Icons.lightbulb), onPressed: () {  },
        ),
                  Expanded( 
                    child: Text('Led ${ledStatus['nom']} : ${ledStatus['status']!=true?'off':'on'}',
           
                          style: TextStyle(fontSize: 20,fontWeight: 
                          FontWeight.w500,),),
                  ),
                  
                       
                    CupertinoSwitch(
  value:ledStatus['status'],
  onChanged: (value){
    setState(() {


if(ledStatus['status']==true){
                        FirebaseFirestore.instance.collection('Led').
                       doc(document.id)
                      .update({
                                "status": false
                                 })
                      .then((value) => print("User Updated"))
                      .catchError((error) => print("Failed to update user: $error"));}
                      else{ FirebaseFirestore.instance.collection('Led').
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
          
          ),SizedBox(height: 10,)
                
          
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

class ledCuisine extends StatefulWidget {
  const ledCuisine({ Key? key }) : super(key: key);

  @override
  State<ledCuisine> createState() => _ledCuisineState();
}

class _ledCuisineState extends State<ledCuisine> {
 
int i = 0;
 
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

        return Column(
          
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> ledStatus = document.data()! as Map<String, dynamic>;
               bool valeur = ledStatus['status'];
         
           i++;
            return Container(
              child: Column(
                children: [
               



            if(ledStatus['piece']=="cuisine")...[
                  Text("Cuisine"),
             Container(
                     margin: const EdgeInsets.fromLTRB(20,0,20,0),                 
                 decoration: BoxDecoration(border: Border.all(width: 3),
                                          borderRadius: BorderRadius.circular(15),
                                          
                                          
                  ),
            child: Container(
                 decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                            color: Color.fromARGB(255, 116, 112, 112),
                                          
                  ),
              child: Row(
                
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
        
                children: [ 
                IconButton(icon: Icon(Icons.lightbulb), onPressed: () {  },
        ),
                  Expanded( 
                    child: Text('Led ${ledStatus['nom']} : ${ledStatus['status']!=true?'off':'on'}',
           
                          style: TextStyle(fontSize: 20,fontWeight: 
                          FontWeight.w500,),),
                  ),
                  
                       
                    CupertinoSwitch(
  value:ledStatus['status'],
  onChanged: (value){
    setState(() {

if(ledStatus['status']==true){
                        FirebaseFirestore.instance.collection('Led').
                       doc(document.id)
                      .update({
                                "status": false
                                 })
                      .then((value) => print("User Updated"))
                      .catchError((error) => print("Failed to update user: $error"));}
                      else{ FirebaseFirestore.instance.collection('Led').
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
          ),       SizedBox(height: 10,)],
      
     
                    
                
                     ]
                  
                
                
              ),
            );
          }).toList(),
        );
      },
      
    );
  }
}

class ledChambre extends StatefulWidget {
  const ledChambre({ Key? key }) : super(key: key);

  @override
  State<ledChambre> createState() => _ledChambreState();
}

class _ledChambreState extends State<ledChambre> {
 

   Stream<QuerySnapshot> statusVolet = FirebaseFirestore.instance.collection('Volet').snapshots(includeMetadataChanges: true);
 
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

        return Column(
          
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> ledStatus = document.data()! as Map<String, dynamic>;
               bool valeur = ledStatus['status'];
         
           
            return Container(
              child: Column(
                children: [
                
if(ledStatus['piece']=="chambre")...[

               Column(
                 children: [
                 Text("Chambre"),
                    Container(
                     margin: const EdgeInsets.fromLTRB(20,0,20,0),
                     
                     decoration: BoxDecoration(border: Border.all(width: 2),
                                              borderRadius: BorderRadius.circular(15),
                                              
                                              
                      ),
            child: Container(
              decoration: BoxDecoration(color: Colors.blue,
                                              borderRadius: BorderRadius.circular(15),
                                              
                                              
                      ),
              child: Row(
                
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
        
                children: [ 
                IconButton(icon: Icon(Icons.lightbulb), onPressed: () {  },
        ),
                      Expanded( 
                        child: Text('Led ${ledStatus['nom']} : ${ledStatus['status']!=true?'off':'on'}',
           
                              style: TextStyle(fontSize: 20,fontWeight: 
                              FontWeight.w500,),),
                      ),
                      
                           
                        CupertinoSwitch(
  value:ledStatus['status'],
  onChanged: (value){
    setState(() {

if(ledStatus['status']==true){
                            FirebaseFirestore.instance.collection('Led').
                           doc(document.id)
                          .update({
                                    "status": false
                                     })
                          .then((value) => print("User Updated"))
                          .catchError((error) => print("Failed to update user: $error"));}
                          else{ FirebaseFirestore.instance.collection('Led').
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
                SizedBox(height: 10,)
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

class ledGarage extends StatefulWidget {
  const ledGarage({ Key? key }) : super(key: key);

  @override
  State<ledGarage> createState() => _ledGarageState();
}

class _ledGarageState extends State<ledGarage> {
  
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

        return Column(
          
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> ledStatus = document.data()! as Map<String, dynamic>;
               bool valeur = ledStatus['status'];
         
           
            return Container(
              child: Column(
                children: [
          
                  if(ledStatus['piece']=="garage")...[
                           Text("Garage"),
               Container(
                 margin: EdgeInsets.fromLTRB(20, 0, 20, 0)  , //EdgeInsets.all(20.0),
                 
                 decoration: BoxDecoration(border: Border.all(width: 2),
                                          borderRadius: BorderRadius.circular(15),
                                          
                                          
                  ),
            child: Container(
              decoration: BoxDecoration(color: Colors.purple,
                                          borderRadius: BorderRadius.circular(15),
                                          
                                          
                  ),
              child: Row(
                
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
        
                children: [ 
                IconButton(icon: Icon(Icons.lightbulb), onPressed: () {  },
        ),
                  Expanded( 
                    child: Text('Led ${ledStatus['nom']} : ${ledStatus['status']!=true?'off':'on'}',
           
                          style: TextStyle(fontSize: 20,fontWeight: 
                          FontWeight.w500,),),
                  ),
                  
                       
                    CupertinoSwitch(
  value:ledStatus['status'],
  onChanged: (value){
    setState(() {

if(ledStatus['status']==true){
                        FirebaseFirestore.instance.collection('Led').
                       doc(document.id)
                      .update({
                                "status": false
                                 })
                      .then((value) => print("User Updated"))
                      .catchError((error) => print("Failed to update user: $error"));}
                      else{ FirebaseFirestore.instance.collection('Led').
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
          ), ],

                  
                  
     
                    
                
                     ]
                  
                
                
              ),
            );
          }).toList(),
        );
      },
      
    );
  }
}

class allOffLed extends StatefulWidget {
  const allOffLed({ Key? key }) : super(key: key);

  @override
  State<allOffLed> createState() => _allOffLedState();
}

class _allOffLedState extends State<allOffLed> {
  List listId = [];
  
   Stream<QuerySnapshot> statusLed = FirebaseFirestore.instance.collection('Led').snapshots(includeMetadataChanges: true);

  get allOnrue => null;
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

        return Column(
          
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> ledStatus = document.data()! as Map<String, dynamic>;
               bool valeur = ledStatus['status'];
         
            listId.add(document.id);
          
                   
            return Padding(
                padding: const EdgeInsets.all(20),
                
              child: Column(
                children: [
                   if(document.id=="led1")...[
                   
                   
ElevatedButton(
  style: ElevatedButton.styleFrom(primary: Colors.green,
    minimumSize: const Size.fromHeight(50),
    
  ),

                     
                     onPressed: (){
               
                
                     for (var i = 0; i < 40; i++) {
                       FirebaseFirestore.instance.collection('Led').
                     doc(listId[i])
                    .update({
                              "status": false
                               })
                    .then((value) => print("User Updated"))
                    .catchError((error) => print("Failed to update user: $error"));}
                    if (ledStatus['status']==true) {
                

                    }

            },
             child: Text('Tout éteindre',style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),),
             
                
            ),
                
         
                
                     ]]
                  
                
                
              ),
            );
          }).toList(),
        );
      },
      
    );
  }
}

class allOnLed extends StatefulWidget {
  const allOnLed({ Key? key }) : super(key: key);

  @override
  State<allOnLed> createState() => _allOnLedState();
}

class _allOnLedState extends State<allOnLed> {
   List listId = [];
  
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

        return Column(
          
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> ledStatus = document.data()! as Map<String, dynamic>;
               bool valeur = ledStatus['status'];
         
            listId.add(document.id);
             
                   
            return Padding(
                padding: const EdgeInsets.fromLTRB(20,0,20,0),
                
              child: Column(
                children: [
                
                   if(document.id=="led2")...[
                   
                   
ElevatedButton(
  style: ElevatedButton.styleFrom(primary: Colors.green,
    minimumSize: const Size.fromHeight(50),
    
  ),

                     
                     onPressed: (){
               
                
                     for (var i = 0; i < 20; i++) {
                       FirebaseFirestore.instance.collection('Led').
                     doc(listId[i])
                    .update({
                              "status": true
                               })
                    .then((value) => print("User Updated"))
                    .catchError((error) => print("Failed to update user: $error"));}
                   

            },
             child: Text('Tout allumer',style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),),
             
                
            ),
                
         
                
                     ]]
                  
                
                
              ),
            );
          }).toList(),
        );
      },
      
    );
  }
}