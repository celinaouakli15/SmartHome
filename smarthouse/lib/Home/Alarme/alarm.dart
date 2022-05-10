import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smarthouse/Home/Alarme/optionAlarm.dart';
import 'package:smarthouse/Home/Led/optionLed.dart';


class allAlarme extends StatefulWidget {
  const allAlarme({ Key? key }) : super(key: key);

  @override
  State<allAlarme> createState() => _allAlarmeState();
}

class _allAlarmeState extends State<allAlarme> {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
               backgroundColor: Color.fromARGB(221, 23, 22, 22),

        title: Text("Alarme"),
       
 
        
        actions: [
       
         IconButton(
            icon: Icon(Icons.add), onPressed: () { 
                   Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const modifieralarme(),
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
                 alarmeSalon(),
                 alarmeCuisine(),
                 alarmeChambre(),
                 alarmeGarage(),
                 SizedBox(height: 20,),
                allOnAlarme(),
            allOffAlarm(),
            
               
        
            
          ],
          ),
          ),
        ),
      )
      
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
         Text(statusAlarme['piece']),            Container(
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
                    child: Text('Alarme ${statusAlarme['nom']} : ${statusAlarme['status']!=true?'off':'on'}',
           
                          style: TextStyle(fontSize: 20,fontWeight: 
                          FontWeight.w500,),),
                  ),
                  
                       
                    CupertinoSwitch(
  value:statusAlarme['status'],
  onChanged: (value){
    setState(() {

if(statusAlarme['status']==true){
                        FirebaseFirestore.instance.collection('alarm').
                       doc(document.id)
                      .update({
                                "status": false
                                 })
                      .then((value) => print("User Updated"))
                      .catchError((error) => print("Failed to update user: $error"));}
                      else{ FirebaseFirestore.instance.collection('alarm').
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
                children: [
            if(statusAlarme['piece']=="cuisine")...[
         Text(statusAlarme['piece']),             Container(
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
                    child: Text('Alarme ${statusAlarme['nom']} : ${statusAlarme['status']!=true?'off':'on'}',
           
                          style: TextStyle(fontSize: 20,fontWeight: 
                          FontWeight.w500,),),
                  ),
                  
                       
                    CupertinoSwitch(
  value:statusAlarme['status'],
  onChanged: (value){
    setState(() {

if(statusAlarme['status']==true){
                        FirebaseFirestore.instance.collection('alarm').
                       doc(document.id)
                      .update({
                                "status": false
                                 })
                      .then((value) => print("User Updated"))
                      .catchError((error) => print("Failed to update user: $error"));}
                      else{ FirebaseFirestore.instance.collection('alarm').
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
                children: [
                
if(statusAlarme['piece']=="chambre")...[
         Text(statusAlarme['piece']),
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
                        child: Text('Alarme ${statusAlarme['nom']} : ${statusAlarme['status']!=true?'off':'on'}',
           
                              style: TextStyle(fontSize: 20,fontWeight: 
                              FontWeight.w500,),),
                      ),
                      
                           
                        CupertinoSwitch(
  value:statusAlarme['status'],
  onChanged: (value){
    setState(() {

if(statusAlarme['status']==true){
                            FirebaseFirestore.instance.collection('alarm').
                           doc(document.id)
                          .update({
                                    "status": false
                                     })
                          .then((value) => print("User Updated"))
                          .catchError((error) => print("Failed to update user: $error"));}
                          else{ FirebaseFirestore.instance.collection('alarm').
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
                     Text(statusAlarme['piece']),
               Container(
                     margin: const EdgeInsets.fromLTRB(20,0,20,0),
                 
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
                    child: Text('Alarme ${statusAlarme['nom']} : ${statusAlarme['status']!=true?'off':'on'}',
           
                          style: TextStyle(fontSize: 20,fontWeight: 
                          FontWeight.w500,),),
                  ),
                  
                       
                    CupertinoSwitch(
  value:statusAlarme['status'],
  onChanged: (value){
    setState(() {

if(statusAlarme['status']==true){
                        FirebaseFirestore.instance.collection('alarm').
                       doc(document.id)
                      .update({
                                "status": false
                                 })
                      .then((value) => print("User Updated"))
                      .catchError((error) => print("Failed to update user: $error"));}
                      else{ FirebaseFirestore.instance.collection('alarm').
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
                   
           
            return Padding(
                padding: const EdgeInsets.all(20),
                
              child: Column(
                children: [
                   if(document.id=="alarm1")...[
           ElevatedButton(
  style: ElevatedButton.styleFrom(primary: Colors.green,
    minimumSize: const Size.fromHeight(50),
    
  ),
                     
                     onPressed: (){
               
                
                     for (int i = 0; i < 30; i++) {
                       FirebaseFirestore.instance.collection('alarm').
                     doc(listId[i])
                    .update({
                              "status": false
                               })
                    .then((value) => print("User Updated"))
                    .catchError((error) => print("Failed to update user: $error"));}
                   
            },
             child: Text('Tout éteindre',),

                
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
class allOnAlarme extends StatefulWidget {
  const allOnAlarme({ Key? key }) : super(key: key);

  @override
  State<allOnAlarme> createState() => _allOnAlarmeState();
}

class _allOnAlarmeState extends State<allOnAlarme> {
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
                   
           
            return Padding(
                   padding: const EdgeInsets.fromLTRB(20,0,20,0),
                
              child: Column(
                children: [
                   if(document.id=="alarm1")...[
           ElevatedButton(
  style: ElevatedButton.styleFrom(primary: Colors.green,
    minimumSize: const Size.fromHeight(50),
    
  ),
                     
                     onPressed: (){
               
                
                     for (int i = 0; i < 30; i++) {
                       FirebaseFirestore.instance.collection('alarm').
                     doc(listId[i])
                    .update({
                              "status": true
                               })
                    .then((value) => print("User Updated"))
                    .catchError((error) => print("Failed to update user: $error"));}
                   

            },
             child: Text('Tout allumer',),

                
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