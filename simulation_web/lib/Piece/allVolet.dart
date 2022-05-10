import 'package:cloud_firestore/cloud_firestore.dart';
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
         
              var col;
         if (statusVolet['status']!=true) {
            col = Colors.red;
       
           
         }
          if (statusVolet['status']==true) {
          col = Colors.green;
           
         }
            return Container(
              child: Column(
                children: [
                
                  if(statusVolet['piece']=="salon")...[
              

                             Text('status : ${statusVolet['status']!=true?'off':'on'}', style: 
                     TextStyle(color: col),),
                    Text('nom : ${statusVolet['nom']}'),
                     Text('piece : ${statusVolet['piece']}'),
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
         
                var col;
         if (statusVolet['status']!=true) {
            col = Colors.red;
       
           
         }
          if (statusVolet['status']==true) {
          col = Colors.green;
           
         }
            return Container(
              child: Column(
                children: [
                  if(statusVolet['piece']=="cuisine")...[
                   

                             Text('status : ${statusVolet['status']!=true?'off':'on'}', style: 
                     TextStyle(color: col),),
                    Text('nom : ${statusVolet['nom']}'),
                     Text('piece : ${statusVolet['piece']}'),
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
              var col;
         if (statusVolet['status']!=true) {
            col = Colors.red;
       
           
         }
          if (statusVolet['status']==true) {
          col = Colors.green;
           
         }
           
            return Container(
              child: Column(
                children: [
    
                  if(statusVolet['piece']=="chambre")...[
              

                             Text('status : ${statusVolet['status']!=true?'off':'on'}', style: 
                     TextStyle(color: col),),
                    Text('nom : ${statusVolet['nom']}'),
                     Text('piece : ${statusVolet['piece']}'),
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
         
                var col;
         if (statusVolet['status']!=true) {
            col = Colors.red;
       
           
         }
          if (statusVolet['status']==true) {
          col = Colors.green;
           
         }
            return Container(
              child: Column(
                children: [
                 
                  if(statusVolet['piece']=="garage")...[
              

                             Text('status : ${statusVolet['status']!=true?'off':'on'}', style: 
                     TextStyle(color: col),),
                    Text('nom : ${statusVolet['nom']}'),
                     Text('piece : ${statusVolet['piece']}'),
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