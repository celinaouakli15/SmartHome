

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          
       
      
         print((((listId.length)/i)).toString());
            return Container(
              child: Column(
                children: [ 
  
               if(ledStatus['piece']=="salon")...[ 
                     
                     Text('status : ${ledStatus['status']!=true?'off':'on'}'),
                    Text('nom : ${ledStatus['nom']}'),
                     Text('piece : ${ledStatus['piece']}'),
         SizedBox(height: 50,)],
  
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
                     
                     Text('status : ${ledStatus['status']!=true?'off':'on'}'),
                    Text('nom : ${ledStatus['nom']}'),
                     Text('piece : ${ledStatus['piece']}'),
         SizedBox(height: 50,)],
  
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
                     
                     Text('status : ${ledStatus['status']!=true?'off':'on'}'),
                    Text('nom : ${ledStatus['nom']}'),
                     Text('piece : ${ledStatus['piece']}'),
         SizedBox(height: 50,)],
  
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
                     
                     Text('status : ${ledStatus['status']!=true?'off':'on'}'),
                    Text('nom : ${ledStatus['nom']}'),
                     Text('piece : ${ledStatus['piece']}'),
         SizedBox(height: 50,)],
  
                                
               
                     ]
                
              ),
            
            );
        
        
          }).toList(),
        ); 
      },
       
    );
  }
}



class allOff extends StatefulWidget {
  const allOff({ Key? key }) : super(key: key);

  @override
  State<allOff> createState() => _allOffState();
}

class _allOffState extends State<allOff> {
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
               bool allOff;
                    var allOn;
                   
            return Container(
              child: Column(
                children: [
                   if(document.id=="led1")...[
                   
                   RaisedButton(
                     
                     onPressed: (){
               
                
                     for (var i = 0; i < listId.length; i++) {
                       FirebaseFirestore.instance.collection('Led').
                     doc(listId[i])
                    .update({'color': "noir",
                              "status": false
                               })
                    .then((value) => print("User Updated"))
                    .catchError((error) => print("Failed to update user: $error"));}
                    if (ledStatus['status']==true) {
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