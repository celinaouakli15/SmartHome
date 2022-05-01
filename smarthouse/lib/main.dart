import 'dart:convert';
import 'dart:ffi';

import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:smarthouse/Home/navBar.dart';
import 'package:smarthouse/Home/Led/addLed.dart';
import 'package:smarthouse/tessst.dart';
import 'package:http/http.dart' as http;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseDatabase database = FirebaseDatabase.instance;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); 

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SmartHouse',
      theme: ThemeData.dark(),
      darkTheme: ThemeData.dark(),
      home: const MyHomePage(title: 'SmartHouse '),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

 
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


Future<String> getEmail() async {

  String result = (await FirebaseDatabase.instance.reference().child("rules/.read").once()).toString();
  print(result);
  return result.toString();
}
class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
                   backgroundColor: Color.fromARGB(221, 23, 22, 22),

          
   automaticallyImplyLeading: false,
        
        actions: [
          IconButton(
            icon: Icon(Icons.menu), onPressed: () { 
                   Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const navBar()));

             },
        ),
         IconButton(
            icon: Icon(Icons.add), onPressed: () { 
                   Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const addLed(),
    fullscreenDialog: true,
    )
    );

             },
        )
        
        ],
      ),
           body: SingleChildScrollView(
             child: Center(child: Column(children: [
               Text("Tout les Volets"),
               volet(),
              Text("Toutes les Leds"), 
              led(),
              Text("Ttemperature"), temperature(),
          onoff(),
             
             
              
              ],),),
           ) 
      
            
        
        
      
     
     );
  }
}

class led extends StatefulWidget {
  const led({ Key? key }) : super(key: key);

  @override
  State<led> createState() => _ledState();
}

class _ledState extends State<led> {





   Stream<QuerySnapshot> statusVolet = FirebaseFirestore.instance.collection('Volet').snapshots(includeMetadataChanges: true);
 
   Stream<QuerySnapshot> statusLed = FirebaseFirestore.instance.collection('Led').snapshots(includeMetadataChanges: true);
  DatabaseReference ref = FirebaseDatabase.instance.ref("volet");
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
               
          Stream<DatabaseEvent> stream = ref.onValue;

// Subscribe to the stream!
stream.listen((DatabaseEvent event) {
  print('Event Type: ${event.type}'); // DatabaseEventType.value;
  print('Snapshot: ${event.snapshot}'); // DataSnapshot
});
           
           
            return Container(
              child: Column(
                children: [Container(
                  //child:
                  //Image.asset('assets/images/${ledStatus['status']!=true?'off.png':'on.png'}'),
                  ),
                
                    if(ledStatus['piece']=="salon")...[
                  ListTile(
                    title:  Text('Led ${ledStatus['status']!=true?'off':'on'}'),
           
                    subtitle: Text(document.id.toString()),
                    onTap:(){ 
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
                                      
                   
                  
                     }),]
                  
                ],
                
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

class volet extends StatefulWidget {
  const volet({ Key? key }) : super(key: key);

  @override
  State<volet> createState() => _voletState();
}

class _voletState extends State<volet> {
 
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
                Map<String, dynamic> VoletStatus = document.data()! as Map<String, dynamic>;
      var collectionVolet = FirebaseFirestore.instance.collection('Volet');


// Subscribe to the stream!

           
           
            return Container(
              child: Column(
                children: [if(document.id=="chambre")...[
                   Text("data"),
                ],
                         
                      
                  
                  Container(
                  //child:
                  //Image.asset('assets/images/${ledStatus['status']!=true?'off.png':'on.png'}'),
                  ),
                
                
                      
               ListTile(
                    title:  Text('Volet ${VoletStatus['status']!=true?'Fermer':'ouvert'}'),
            subtitle: Text(document.id.toString()),
                    
                    onTap:(){ 

                      
                      if(VoletStatus['status']==true){
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


                    }
                     ),
                  
                ],
                
              ),
            );
          }).toList(),
        );
      },
    );
  }
}






class temperature extends StatefulWidget {
  const temperature({ Key? key }) : super(key: key);

  @override
  State<temperature> createState() => _temperatureState();
}

class _temperatureState extends State<temperature> {
   Stream<QuerySnapshot> statustemps = FirebaseFirestore.instance.collection('temps').snapshots(includeMetadataChanges: true);
  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<QuerySnapshot>(
      stream: statustemps,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return Column(
          
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> statustemps = document.data()! as Map<String, dynamic>;
      var collectiontemps = FirebaseFirestore.instance.collection('temps');


// Subscribe to the stream!

           
           
            return Container(
              child: Column(
                children: [Container(
                 child:Text(statustemps['temperature_c'].toString()) ,
                  ),
                  Container(
                 child:Text(statustemps['humidity'].toString()) ,
                  ),
                  Container(
                 child:Text(statustemps['temperature_f'].toString()) ,
                  ),
                
                
               /*      
               ListTile(
                    title: Text(statustemps['temperature_c'].toString()) ,
           subtitle:Text(statustemps['temperature_c'].toString()) ,
                    
                    onTap:(){ 
                      
                    }
                                      
                     ),
                     */
                  
                ],
                
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

class onoff extends StatefulWidget {
  const onoff({ Key? key }) : super(key: key);

  @override
  State<onoff> createState() => _onoffState();
}

class _onoffState extends State<onoff> {


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
                listId.add(document.id);
          


         
       

            return Container(
              child:Column(
                children: [
                  if(document.id=="led1")...[
                   RaisedButton(onPressed: (){

              
                     for (var i = 0; i < listId.length; i++) {
                       FirebaseFirestore.instance.collection('Led').
                     doc(listId[i])
                    .update({'color': "noir",
                              "status": false
                               })
                    .then((value) => print("User Updated"))
                    .catchError((error) => print("Failed to update user: $error"));}
                    
                     
            })
                ],
                ],
                ) 
  
   
                  );

          },
          
          ).toList(),
 
          
        );
      },
    );
    
 
  }
   
  
}

/*

  
          RaisedButton(onPressed: (){

              
                     for (var i = 0; i < listId.length; i++) {
                       FirebaseFirestore.instance.collection('Led').
                     doc(listId[i])
                    .update({'color': "noir",
                              "status": false
                               })
                    .then((value) => print("User Updated"))
                    .catchError((error) => print("Failed to update user: $error"));}
                    
                     
            });

            */