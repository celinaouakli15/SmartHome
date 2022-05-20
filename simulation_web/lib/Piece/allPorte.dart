import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class allPorte extends StatefulWidget {
  const allPorte({ Key? key }) : super(key: key);

  @override
  State<allPorte> createState() => _allPorteState();
}

class _allPorteState extends State<allPorte> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
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
              var col;
         if (statusPorte['status']!=true) {
            col = Colors.red;
       
           
         }
          if (statusPorte['status']==true) {
          col = Colors.green;
           
         }
    
           
            return Container(
              child: Column(
                children: [
                      
                          
                
 if(statusPorte['piece']=="salon")...[
                    Text("Porte",
                       style: TextStyle(fontSize: 20,color: Colors.green),), 

                             Text('status : ${statusPorte['status']!=true?'off':'on'}', style: 
                     TextStyle(color: col),),
                    Text('nom : ${statusPorte['nom']}'),
                     Text('piece : ${statusPorte['piece']}'),
         SizedBox(height: 50,),
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
             var col;
         if (statusPorte['status']!=true) {
            col = Colors.red;
       
           
         }
          if (statusPorte['status']==true) {
          col = Colors.green;
           
         }
           
            return Container(
              child: Column(
                children: [               
 if(statusPorte['piece']=="cuisine")...[
                   
 Text("Porte",
                       style: TextStyle(fontSize: 20,color: Colors.green),), 
                             Text('status : ${statusPorte['status']!=true?'off':'on'}', style: 
                     TextStyle(color: col),),
                    Text('nom : ${statusPorte['nom']}'),
                     Text('piece : ${statusPorte['piece']}'),
         SizedBox(height: 50,),
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
             var col;
         if (statusPorte['status']!=true) {
            col = Colors.red;
       
           
         }
          if (statusPorte['status']==true) {
          col = Colors.green;
           
         }
           
            return Container(
              child: Column(
                children: [
                   
 if(statusPorte['piece']=="chambre")...[
                   
 Text("Porte",
                       style: TextStyle(fontSize: 20,color: Colors.green),), 
                             Text('status : ${statusPorte['status']!=true?'off':'on'}', style: 
                     TextStyle(color: col),),
                    Text('nom : ${statusPorte['nom']}'),
                     Text('piece : ${statusPorte['piece']}'),
         SizedBox(height: 50,),
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
         
               var col;
         if (statusPorte['status']!=true) {
            col = Colors.red;
       
           
         }
          if (statusPorte['status']==true) {
          col = Colors.green;
           
         }
            return Container(
              child: Column(
                children: [
                     
 if(statusPorte['piece']=="garage")...[
                   
 Text("Porte",
                       style: TextStyle(fontSize: 20,color: Colors.green),), 
                             Text('status : ${statusPorte['status']!=true?'off':'on'}', style: 
                     TextStyle(color: col),),
                    Text('nom : ${statusPorte['nom']}'),
                     Text('piece : ${statusPorte['piece']}'),
         SizedBox(height: 50,),
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
                   
            return Container(
              child: Column(
                children: [
                   if(document.id=="PorteGarage")...[
                   
                   RaisedButton(
                     
                     onPressed: (){
               
                
                     for (var i = 0; i < listId.length; i++) {
                       FirebaseFirestore.instance.collection('Porte').
                     doc(listId[i])
                    .update({'color': "noir",
                              "status": false
                               })
                    .then((value) => print("User Updated"))
                    .catchError((error) => print("Failed to update user: $error"));}
                    if (statusPorte['status']==true) {
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