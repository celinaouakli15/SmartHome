import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:simulation_web/Piece/allAlarme.dart';
import 'package:simulation_web/Piece/allLed.dart';
import 'package:simulation_web/Piece/allPorte.dart';
import 'package:simulation_web/Piece/allVolet.dart';

class simulation extends StatefulWidget {
  const simulation({ Key? key }) : super(key: key);

  @override
  State<simulation> createState() => _simulationState();
}

class _simulationState extends State<simulation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                   backgroundColor: Color.fromARGB(221, 23, 22, 22),

          title: Text("Simulation"),

       
        
        
      ),
           body: Center (
             child: SingleChildScrollView(
               
               child: Column(
                 
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   
                 
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                   
                   children: [  
                      Column(
                     children: [
                       Text("Salon"), 
                       SizedBox(height: 50,),
                        Text("Led"),
                       ledSalon(),
                         Text("Volet"),
                       voletSalon(),
                           Text("Alarme"),alarmeSalon(), 
                           Text("Porte"),porteSalon()
                     ],
                   ),
                   SizedBox(width: 100,),

                    Column(
                     children: [
                       Text("Cuisine"), 
                       SizedBox(height: 50,),
                       Text("Led"),
                       ledCuisine(),
                       Text("Volet"),voletCuisine(),
                       Text("Alarme"),alarmeCuisine(),
                       Text("Porte"),porteCuisine()
                       
                     ],
                   ),
                   SizedBox(width: 100,),

                    Column(
                     children: [
                       Text("Garage"), 
                       SizedBox(height: 50,),
                        Text("Led"),
                       ledGarage(),
                       Text("Volet"),
                       voletGarage(),
                       
                       Text("Alarme"),
                       alarmeGarage(),
                       Text("Porte"),porteGarage()
                     ],
                   ),
                   SizedBox(width: 100,),

                    Column(
                     children: [
                       Text("Chambre"), 
                       SizedBox(height: 50,),
                        Text("Led"),
                       ledChambre(),
                       Text("Volet"),voletChambre(),

                       Text("Alarme"),
                       alarmeChambre(),
                       Text("Porte"),porteChambre()
                     ],
                   ),
],
                 ),
                     
                            

                 ])))
      
    );
  }
}


class simulationLed extends StatefulWidget {
  const simulationLed({ Key? key }) : super(key: key);

  @override
  State<simulationLed> createState() => _simulationLedState();
}

class _simulationLedState extends State<simulationLed> { 
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
                     
                return Container(
              child: Column(
                children: [Container(
                  //child:
                  //Image.asset('assets/images/${ledStatus['status']!=true?'off.png':'on.png'}'),
                  ),
                
                    
                 
                    
                Text('status : ${ledStatus['status']!=true?'off':'on'}'),
                Text('nom : ${ledStatus['nom']}'),
                     Text('piece : ${ledStatus['piece']}'),
                  
                ],
                
              ),
            );
          }).toList(),
        );
      },
    );
  }
}



class simulationtherm extends StatefulWidget {
  const simulationtherm({ Key? key }) : super(key: key);

  @override
  State<simulationtherm> createState() => _simulationthermState();
}

class _simulationthermState extends State<simulationtherm> {
  Stream<QuerySnapshot> statusLed = FirebaseFirestore.instance.collection('Volet').snapshots(includeMetadataChanges: true);
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
                     
                return Container(
              child: Column(
                children: [Container(
                  //child:
                  //Image.asset('assets/images/${ledStatus['status']!=true?'off.png':'on.png'}'),
                  ),
                
                    
                  ListTile(
                    
                    title:  Text('Volet ${ledStatus['status']!=true?'off':'on'}'),
           
                    subtitle: Text(ledStatus['nom'].toString()),
                    onTap:(){ 
                                     
                   
                  
                     }),
                  
                ],
                
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
