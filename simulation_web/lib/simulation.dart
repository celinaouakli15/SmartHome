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
                       Text("Lien apk de l'application en date du 10/05/2022  :  "),
                         Text("https://www.swisstransfer.com/d/92d435cc-7a23-473a-9061-51dda3025ee9"),
                 ],),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                   
                   children: [  
                      Column(
                        
                     children: [
                       Text("Salon",
                       style: TextStyle(fontSize: 30,color: Color.fromARGB(255, 255, 255, 255)),), 
                       SizedBox(height: 50,),
                        Text("Led",
                       style: TextStyle(fontSize: 20,color: Colors.pink),), 
                       ledSalon(),
                         Text("Volet",
                       style: TextStyle(fontSize: 20,color: Colors.pink),), 
                       voletSalon(),
                           Text("Alarme",
                       style: TextStyle(fontSize: 20,color: Colors.pink),), alarmeSalon(), 
                           Text("Porte",
                       style: TextStyle(fontSize: 20,color: Colors.pink),), porteSalon()
                     ],
                   ),
                   SizedBox(width: 100,),

                    Column(
                     children: [
                       Text("Cuisine",
                       style: TextStyle(fontSize: 30,color: Color.fromARGB(255, 255, 255, 255)),),  
                       SizedBox(height: 50,),
                       Text("Led",
                       style: TextStyle(fontSize: 20,color: Colors.blue),),  
                       ledCuisine(),
                       Text("Volet",
                       style: TextStyle(fontSize: 20,color: Colors.blue),), 
                       voletCuisine(),
                       Text("Alarme",
                       style: TextStyle(fontSize: 20,color: Colors.blue),), 
                       alarmeCuisine(),
                       Text("Porte",
                       style: TextStyle(fontSize: 20,color: Colors.blue),), 
                       porteCuisine()
                       
                     ],
                   ),
                   SizedBox(width: 100,),

                    Column(
                     children: [
                       Text("Garage",
                       style: TextStyle(fontSize: 30,color: Color.fromARGB(255, 255, 255, 255)),),  
                       SizedBox(height: 50,),
                        Text("Led",
                       style: TextStyle(fontSize: 20,color: Colors.purple),),  
                       ledGarage(),
                       Text("Volet",
                       style: TextStyle(fontSize: 20,color: Colors.purple),),  
                       voletGarage(),
                       
                       Text("Alarme",
                       style: TextStyle(fontSize: 20,color: Colors.purple),),  
                       alarmeGarage(),
                       Text("Porte",
                       style: TextStyle(fontSize: 20,color: Colors.purple),),  
                       porteGarage(),
                 
                     ],
                   ),
                   SizedBox(width: 100,),

                    Column(
                     children: [
                       Text("Chambre",
                       style: TextStyle(fontSize: 30,color: Color.fromARGB(255, 255, 255, 255)),), 
                       SizedBox(height: 50,),
                        Text("Led",
                       style: TextStyle(fontSize: 20,color: Colors.grey),),  
                       ledChambre(),
                       Text("Volet",
                       style: TextStyle(fontSize: 20,color: Colors.grey),),
                         voletChambre(),

                       Text("Alarme",
                       style: TextStyle(fontSize: 20,color: Colors.grey),),  
                       alarmeChambre(),
                       Text("Porte",
                       style: TextStyle(fontSize: 20,color: Colors.grey),),  
                       porteChambre()
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
