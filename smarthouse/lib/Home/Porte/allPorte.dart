import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smarthouse/Home/Porte/optionPorte.dart';

class allPorte extends StatefulWidget {
  const allPorte({ Key? key }) : super(key: key);

  @override
  State<allPorte> createState() => _allPorteState();
}

class _allPorteState extends State<allPorte> {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
               backgroundColor: Color.fromARGB(221, 23, 22, 22),

        title: Text("Portes"),
       
 
        
        actions: [
       
         IconButton(
            icon: Icon(Icons.add), onPressed: () { 
                   Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const modifierPorte(),
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
              porteSalon(),
              porteCuisine(),
               porteChambre(),
               porteGarage(),
           
           
            allOffPorte(),  
              SizedBox(height: 20,),
              allOnPorte(),
            
          ],
          ),
          ),
        ),
      )
      
    );
  }
  
}




class porteSalon extends StatefulWidget {
  const porteSalon({ Key? key }) : super(key: key);

  @override
  State<porteSalon> createState() => _porteSalonState();
}

class _porteSalonState extends State<porteSalon> {

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

        return Column(
          
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> statusPorte = document.data()! as Map<String, dynamic>;
               bool valeur = statusPorte['status'];
         int i = 0;
        
    
           
            return Container(
              child: Column(
                children: [
                      
                          
                

                        
                  if(statusPorte['piece']=="salon")...[
                     Text('${statusPorte['piece']}',),
                  
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
                    child: Text('Porte ${statusPorte['nom']} : ${statusPorte['status']!=true?'off':'on'}',
           
                          style: TextStyle(fontSize: 20,fontWeight: 
                          FontWeight.w500,),),
                  ),
                  
                       
                    CupertinoSwitch(
  value:statusPorte['status'],
  onChanged: (value){
    setState(() {


if(statusPorte['status']==true){
                        FirebaseFirestore.instance.collection('Porte').
                       doc(document.id)
                      .update({
                                "status": false
                                 })
                      .then((value) => print("User Updated"))
                      .catchError((error) => print("Failed to update user: $error"));}
                      else{ FirebaseFirestore.instance.collection('Porte').
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
         SizedBox(height: 10,)
          
                
                     ]
                  
                
                
              ),
            
            );
            
          }).toList(),
        ); 
      },
       
    );
  }
}

class porteCuisine extends StatefulWidget {
  const porteCuisine({ Key? key }) : super(key: key);

  @override
  State<porteCuisine> createState() => _porteCuisineState();
}

class _porteCuisineState extends State<porteCuisine> {
 

 
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

        return Column(
          
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> statusPorte = document.data()! as Map<String, dynamic>;
               bool valeur = statusPorte['status'];
         
           
            return Container(
              child: Column(
                children: [
            if(statusPorte['piece']=="cuisine")...[
                    Text('${statusPorte['piece']}',),
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
                    child: Text('Porte ${statusPorte['nom']} : ${statusPorte['status']!=true?'off':'on'}',
           
                          style: TextStyle(fontSize: 20,fontWeight: 
                          FontWeight.w500,),),
                  ),
                  
                       
                    CupertinoSwitch(
  value:statusPorte['status'],
  onChanged: (value){
    setState(() {

if(statusPorte['status']==true){
                        FirebaseFirestore.instance.collection('Porte').
                       doc(document.id)
                      .update({
                                "status": false
                                 })
                      .then((value) => print("User Updated"))
                      .catchError((error) => print("Failed to update user: $error"));}
                      else{ FirebaseFirestore.instance.collection('Porte').
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

class porteChambre extends StatefulWidget {
  const porteChambre({ Key? key }) : super(key: key);

  @override
  State<porteChambre> createState() => _porteChambreState();
}

class _porteChambreState extends State<porteChambre> {
 

 
   Stream<QuerySnapshot> statusLed = FirebaseFirestore.instance.collection('Porte').snapshots(includeMetadataChanges: true);
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
                Map<String, dynamic> statusPorte = document.data()! as Map<String, dynamic>;
               bool valeur = statusPorte['status'];
         
           
            return Container(
              child: Column(
                children: [
                
if(statusPorte['piece']=="chambre")...[
      Text('${statusPorte['piece']}',),
               Column(
                 children: [
                
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
                        child: Text('Porte ${statusPorte['nom']} : ${statusPorte['status']!=true?'off':'on'}',
           
                              style: TextStyle(fontSize: 20,fontWeight: 
                              FontWeight.w500,),),
                      ),
                      
                           
                        CupertinoSwitch(
  value:statusPorte['status'],
  onChanged: (value){
    setState(() {

if(statusPorte['status']==true){
                            FirebaseFirestore.instance.collection('Porte').
                           doc(document.id)
                          .update({
                                    "status": false
                                     })
                          .then((value) => print("User Updated"))
                          .catchError((error) => print("Failed to update user: $error"));}
                          else{ FirebaseFirestore.instance.collection('Porte').
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

class porteGarage extends StatefulWidget {
  const porteGarage({ Key? key }) : super(key: key);

  @override
  State<porteGarage> createState() => _porteGarageState();
}

class _porteGarageState extends State<porteGarage> {
  
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

        return Column(
          
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> statusPorte = document.data()! as Map<String, dynamic>;
               bool valeur = statusPorte['status'];
         
           
            return Container(
              child: Column(
                children: [
                
                  if(statusPorte['piece']=="garage")...[
                    if(statusPorte['nom']!="porteGarage")...[
                            Text('${statusPorte['piece']}',),
               Container(
                 margin: const EdgeInsets.all(20.0),
                 
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
                    child: Text('Porte ${statusPorte['nom']} : ${statusPorte['status']!=true?'off':'on'}',
           
                          style: TextStyle(fontSize: 20,fontWeight: 
                          FontWeight.w500,),),
                  ),
                  
                       
                    CupertinoSwitch(
  value:statusPorte['status'],
  onChanged: (value){
    setState(() {

if(statusPorte['status']==true){
                        FirebaseFirestore.instance.collection('Porte').
                       doc(document.id)
                      .update({
                                "status": false
                                 })
                      .then((value) => print("User Updated"))
                      .catchError((error) => print("Failed to update user: $error"));}
                      else{ FirebaseFirestore.instance.collection('Porte').
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
          ), ], ],

                  
                  
     
                    
                
                     ]
                  
                
                
              ),
            );
          }).toList(),
        );
      },
      
    );
  }
}




class allOffPorte extends StatefulWidget {
  const allOffPorte({ Key? key }) : super(key: key);

  @override
  State<allOffPorte> createState() => _allOffPorteState();
}

class _allOffPorteState extends State<allOffPorte> {
  List listId = [];
  
   Stream<QuerySnapshot> statusPorte = FirebaseFirestore.instance.collection('Porte').snapshots(includeMetadataChanges: true);

  get allOnrue => null;
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

        return Column(
          
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> statusPorte = document.data()! as Map<String, dynamic>;
               bool valeur = statusPorte['status'];
         
            listId.add(document.id);
               bool allOff;
                    var allOn;
                   

            return Padding(
   padding: const EdgeInsets.fromLTRB(20,0,20,0),                  
              child: Column(
                children: [
                   if(document.id=="bouton")...[
             
                ElevatedButton(
  style: ElevatedButton.styleFrom(primary: Colors.green,
    minimumSize: const Size.fromHeight(50),
    
  ),
                     
                     onPressed: (){
               
                
                     for (var i = 0; i < 30; i++) {
                       FirebaseFirestore.instance.collection('Porte').
                     doc(listId[i])
                    .update({
                              "status": false
                               })
                    .then((value) => print("User Updated"))
                    .catchError((error) => print("Failed to update user: $error"));}
                    if (statusPorte['status']==true) {
                      allOff= true;
                      allOn = allOff;

                    }

            },
             child: Text('Tout ouvrir',),
          
                
            ),
                
         
                
                     ]]
                  
                
                
              ),
            );
          }).toList(),
        );
      },
      
    );
  }
}class allOnPorte extends StatefulWidget {
  const allOnPorte({ Key? key }) : super(key: key);

  @override
  State<allOnPorte> createState() => _allOnPorteState();
}

class _allOnPorteState extends State<allOnPorte> {
  List listId = [];
  
   Stream<QuerySnapshot> statusPorte = FirebaseFirestore.instance.collection('Porte').snapshots(includeMetadataChanges: true);

  get allOnrue => null;
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

        return Column(
          
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> statusPorte = document.data()! as Map<String, dynamic>;
               bool valeur = statusPorte['status'];
         
            listId.add(document.id);
               bool allOff;
                    var allOn;
                   

            return Padding(
                padding: const EdgeInsets.fromLTRB(20,0,20,0),
                
              child: Column(
                children: [
                   if(document.id=="bouton")...[
             
                ElevatedButton(
  style: ElevatedButton.styleFrom(primary: Colors.green,
    minimumSize: const Size.fromHeight(50),
    
  ),
                     
                     onPressed: (){
               
                
                     for (var i = 0; i < 30; i++) {
                       FirebaseFirestore.instance.collection('Porte').
                     doc(listId[i])
                    .update({
                              "status": true
                               })
                    .then((value) => print("User Updated"))
                    .catchError((error) => print("Failed to update user: $error"));}
                   
            },
             child: Text('Tout fermer',),
          
                
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