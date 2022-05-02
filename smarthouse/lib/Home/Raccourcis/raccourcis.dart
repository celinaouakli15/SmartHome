import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smarthouse/Home/Led/allLed.dart';
import 'package:smarthouse/Home/Raccourcis/addShortcut.dart';
import 'package:smarthouse/Home/Raccourcis/exit.dart';
import 'package:smarthouse/Home/Volets/allVolet.dart';
import 'package:smarthouse/Widgets/widgets.dart';

class raccourcis extends StatefulWidget {
  const raccourcis({ Key? key }) : super(key: key);

  @override
  State<raccourcis> createState() => _raccourcisState();
}

class _raccourcisState extends State<raccourcis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
            Center(
                 child: SingleChildScrollView(
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                      
    SizedBox(height: 20,),
                         shortcut(),

                         RaisedButton(onPressed: (){

                            Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const addShortcut(),
    fullscreenDialog: true,
    )
    );
                         })
       
        ]
        ),
                 ),
               ),
            
      
    );
  }
}

class shortcut extends StatefulWidget {
  const shortcut({ Key? key }) : super(key: key);

  @override
  State<shortcut> createState() => _shortcutState();
}

class _shortcutState extends State<shortcut> {
 
   Stream<QuerySnapshot> shortcut = FirebaseFirestore.instance.collection('Shortcut').snapshots(includeMetadataChanges: true);
  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<QuerySnapshot>(
      stream: shortcut,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return Column(
          
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> shortcut = document.data()! as Map<String, dynamic>;
               bool valeur = shortcut['status'];
         
           
            return Container(
              child: Column(
                children: [
                
          

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
              child:  Column(
                children: [
                  Row(
                    
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
        
                    children: [ 
                    IconButton(icon: Icon(Icons.lightbulb), onPressed: () {  },
        ),
                          Expanded( 
                            child: Text('${shortcut['nom']} : ${shortcut['status']!=true?'off':'on'}',
           
                                  style: TextStyle(fontSize: 20,fontWeight: 
                                  FontWeight.w500,),),
                          ),
                          
                               
                            CupertinoSwitch(
  value:shortcut['status'],
  onChanged: (value){
    setState(() {

if(shortcut['status']==true){
                                FirebaseFirestore.instance.collection('Shortcut').
                               doc(document.id)
                              .update({
                                        "status": false
                                         })
                              .then((value) => print("User Updated"))
                              .catchError((error) => print("Failed to update user: $error"));
                              
                              
                              
                              
                              }
                              else{ FirebaseFirestore.instance.collection('Shortcut').
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
                  Row(
                
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
                children: [ 
                IconButton(icon: Icon(Icons.door_back_door), onPressed: () {  },
          ),
                  Expanded(
                    child: Text('Issues',
                          style: TextStyle(fontSize: 20,fontWeight: 
                          FontWeight.w500,),),
                  ),
                   Expanded(
                    child: Text('${shortcut['status']!=true?'Ouvert':'Fermer'}',
                          style: TextStyle(fontSize: 20,fontWeight: 
                          FontWeight.w500,color: Color.fromARGB(255, 0, 0, 0)),),
                  ),
               
                ],
              ),
                ],
              ),
            ),
          ),  
          
                SizedBox(height: 10,)
                 ],
               )




                ],
                           
                  
                  
     
                    
                
                     
                  
                
                
              ),
            );
          }).toList(),
        );
      },
      
    );
  }
}

