import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../Led/addLed.dart';

class allTemperature extends StatefulWidget {
  const allTemperature({ Key? key }) : super(key: key);

  @override
  State<allTemperature> createState() => _allTemperatureState();
}

class _allTemperatureState extends State<allTemperature> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
        appBar: AppBar(
               backgroundColor: Color.fromARGB(221, 23, 22, 22),

        title: Text("Température"),
       
 
        /*
        actions: [
       
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
        */
      ),
     
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: [   
             
               
               temperatureGlobal(),
               
            
              
         
             
      
          
        ],
        ),
        ),
      )
      
    );
  }
  
}

class temperatureGlobal extends StatefulWidget {
  const temperatureGlobal({ Key? key }) : super(key: key);

  @override
  State<temperatureGlobal> createState() => _temperatureGlobalState();
}

class _temperatureGlobalState extends State<temperatureGlobal> {
  Stream<QuerySnapshot> tempsStatus = FirebaseFirestore.instance.collection('temps').snapshots(includeMetadataChanges: true);
  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<QuerySnapshot>(
      stream: tempsStatus,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return Column(
          
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> tempsStatus = document.data()! as Map<String, dynamic>;
          
         
           
            return Column(
              children: [
              
                          Text("${tempsStatus['piece'].toString()} ",),
                Container(
                  alignment: Alignment.center,
                      decoration: BoxDecoration(
                         border: Border.all(width: 2,color: Color.fromARGB(255, 255, 255, 255)),
   
                        shape: BoxShape.rectangle,
                        
                        borderRadius: BorderRadius.circular(30),
                          color:Color.fromARGB(255, 159, 119, 51),
                          ),
                       width:(MediaQuery.of(context).size.width)-100 ,
                  child: Column(
                    children: [

                        Text("Température degres",
                           style: TextStyle(
                             fontSize: 20,
                             fontFamily: "Popins",
                             color: Color.fromARGB(255, 255, 255, 255),
                             
                             
                              ),),
                           Text("${tempsStatus['temperature_c']} ",
                           style: TextStyle(
                             fontSize: 50,
                             fontFamily: "Popins",
                             color: Color.fromARGB(255, 255, 255, 255),
                             
                             
                              ),
                              textAlign: TextAlign.center,),



                        Text("Température f",
                           style: TextStyle(
                             fontSize: 20,
                             fontFamily: "Popins",
                             color: Color.fromARGB(255, 255, 255, 255),
                             
                             
                              ),),
                           Text("${tempsStatus['temperature_f']}",
                           style: TextStyle(
                             fontSize: 50,
                             fontFamily: "Popins",
                             color: Color.fromARGB(255, 255, 255, 255),
                             
                             
                              ),
                              textAlign: TextAlign.center,),
                              Text("Humidité",
                           style: TextStyle(
                             fontSize: 20,
                             fontFamily: "Popins",
                             color: Color.fromARGB(255, 255, 255, 255),
                             
                             
                              ),),
                           Text("${tempsStatus['humidity']}",
                           style: TextStyle(
                             fontSize: 50,
                             fontFamily: "Popins",
                             color: Color.fromARGB(255, 255, 255, 255),
                             
                             
                              ),
                              textAlign: TextAlign.center,),
                              
       ]
                      
                    
                    
                  ),
                ),
              ],
            );
          }).toList(),
        );
      },
      
    );
  }
}