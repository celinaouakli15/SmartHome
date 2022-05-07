import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



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
                     Text('${statusVolet['piece']}',),
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
               ), SizedBox(height: 10,) ],
   
                
                
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
                                Text('${statusVolet['piece']}',),
                Container(
                     margin: const EdgeInsets.fromLTRB(20,0,20,0),                 
                 decoration: BoxDecoration(border: Border.all(width: 3),
                                          borderRadius: BorderRadius.circular(15),
                                          
                                          
                  ),
            child: Container(
                 decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                            color: Colors.grey,
                                          
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
                    Text('${statusVolet['piece']}',),

               Column(
                 children: [
                 Container(
                     margin: const EdgeInsets.fromLTRB(20,0,20,0),                 
                 decoration: BoxDecoration(border: Border.all(width: 3),
                                          borderRadius: BorderRadius.circular(15),
                                          
                                          
                  ),
            child: Container(
                 decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                            color: Colors.blue,
                                          
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
                 SizedBox(height: 10,)],
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
                                      Text('${statusVolet['piece']}',),
               Container(
                     margin: const EdgeInsets.fromLTRB(20,0,20,0),                 
                 decoration: BoxDecoration(border: Border.all(width: 3),
                                          borderRadius: BorderRadius.circular(15),
                                          
                                          
                  ),
            child: Container(
                 decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                            color: Colors.purple,
                                          
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
          ), ),SizedBox(height: 10,)],

                  
                  
     
                    
                
                     ]
                  
                
                
              ),
            );
          }).toList(),
        );
      },
      
    );
  }
}


class allOffVolet extends StatefulWidget {
  const allOffVolet({ Key? key }) : super(key: key);

  @override
  State<allOffVolet> createState() => _allOffVoletState();
}

class _allOffVoletState extends State<allOffVolet> {
  List listId = [];
  
   Stream<QuerySnapshot> statusVolet = FirebaseFirestore.instance.collection('Volet').snapshots(includeMetadataChanges: true);

  get allOnrue => null;
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
         
            listId.add(document.id);
               bool allOff;
                    var allOn;
                   
            return Container(
              child: Column(
                children: [
                   if(document.id=="salon")...[
                   
                   RaisedButton(
                     
                     onPressed: (){
               
                
                     for (var i = 0; i < listId.length; i++) {
                       FirebaseFirestore.instance.collection('Volet').
                     doc(listId[i])
                    .update({'color': "noir",
                              "status": false
                               })
                    .then((value) => print("User Updated"))
                    .catchError((error) => print("Failed to update user: $error"));}
                    if (statusVolet['status']==true) {
                      allOff= true;
                      allOn = allOff;

                    }

            },
             child: Text('Tout éteindre',),
             color: Colors.green,
                
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