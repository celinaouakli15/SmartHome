import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class allAlarme extends StatefulWidget {
  const allAlarme({ Key? key }) : super(key: key);

  @override
  State<allAlarme> createState() => _allAlarmeState();
}

class _allAlarmeState extends State<allAlarme> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}




class alarmeSalon extends StatefulWidget {
  const alarmeSalon({ Key? key }) : super(key: key);

  @override
  State<alarmeSalon> createState() => _alarmeSalonState();
}

class _alarmeSalonState extends State<alarmeSalon> {
 
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

        return Column(
          
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> statusAlarme = document.data()! as Map<String, dynamic>;
               bool valeur = statusAlarme['status'];
         
           
            return Container(
              child: Column(
                children: [
                    if(statusAlarme['piece']=="salon")...[
                   

                             Text('status : ${statusAlarme['status']!=true?'off':'on'}'),
                    Text('nom : ${statusAlarme['nom']}'),
                     Text('piece : ${statusAlarme['piece']}'),
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

class alarmeCuisine extends StatefulWidget {
  const alarmeCuisine({ Key? key }) : super(key: key);

  @override
  State<alarmeCuisine> createState() => _alarmeCuisineState();
}

class _alarmeCuisineState extends State<alarmeCuisine> {
 

 
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

        return Column(
          
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> statusAlarme = document.data()! as Map<String, dynamic>;
               bool valeur = statusAlarme['status'];
         
           
            return Container(
              child: Column(
                children: [if(statusAlarme['piece']=="cuisine")...[
                   

                             Text('status : ${statusAlarme['status']!=true?'off':'on'}'),
                    Text('nom : ${statusAlarme['nom']}'),
                     Text('piece : ${statusAlarme['piece']}'),
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

class alarmeChambre extends StatefulWidget {
  const alarmeChambre({ Key? key }) : super(key: key);

  @override
  State<alarmeChambre> createState() => _alarmeChambreState();
}

class _alarmeChambreState extends State<alarmeChambre> {
 

 
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

        return Column(
          
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> statusAlarme = document.data()! as Map<String, dynamic>;
               bool valeur = statusAlarme['status'];
         
           
            return Container(
              child: Column(
                children: [if(statusAlarme['piece']=="chambre")...[
                   

                             Text('status : ${statusAlarme['status']!=true?'off':'on'}'),
                    Text('nom : ${statusAlarme['nom']}'),
                     Text('piece : ${statusAlarme['piece']}'),
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

class alarmeGarage extends StatefulWidget {
  const alarmeGarage({ Key? key }) : super(key: key);

  @override
  State<alarmeGarage> createState() => _alarmeGarageState();
}

class _alarmeGarageState extends State<alarmeGarage> {
  
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

        return Column(
          
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> statusAlarme = document.data()! as Map<String, dynamic>;
               bool valeur = statusAlarme['status'];
         
           
            return Container(
              child: Column(
                children: [
                  if(statusAlarme['piece']=="garage")...[
                   

                             Text('status : ${statusAlarme['status']!=true?'off':'on'}'),
                    Text('nom : ${statusAlarme['nom']}'),
                     Text('piece : ${statusAlarme['piece']}'),
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



class allOffAlarm extends StatefulWidget {
  const allOffAlarm({ Key? key }) : super(key: key);

  @override
  State<allOffAlarm> createState() => _allOffAlarmState();
}

class _allOffAlarmState extends State<allOffAlarm> {
  List listId = [];
  
   Stream<QuerySnapshot> statusAlarm = FirebaseFirestore.instance.collection('alarm').snapshots(includeMetadataChanges: true);

  get allOnrue => null;
  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<QuerySnapshot>(
      stream: statusAlarm,
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
                   if(document.id=="alarm1")...[
                    Text('Tout Éteindre'),
                   RaisedButton(
                     
                     onPressed: (){
               
                
                     for (var i = 0; i < listId.length; i++) {
                       FirebaseFirestore.instance.collection('alarm').
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