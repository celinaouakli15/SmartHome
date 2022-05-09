import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smarthouse/Home/Led/optionLed.dart';
import 'package:smarthouse/Home/Porte/optionPorte.dart';


class porteGarages extends StatefulWidget {
  const porteGarages({ Key? key }) : super(key: key);

  @override
  State<porteGarages> createState() => _porteGaragesState();
}

class _porteGaragesState extends State<porteGarages> {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
               backgroundColor: Color.fromARGB(221, 23, 22, 22),

        title: Text("Porte Garage"),
       
 
        
        actions: [
       
         IconButton(
            icon: Icon(Icons.add), onPressed: () { 
                   Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const modifierPorte(),
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
                 Text("Porte Garage"),voiture()
               
               
        
            
          ],
          ),
          ),
        ),
      )
      
    );
  }
  
}



class voiture extends StatefulWidget {
  const voiture({ Key? key }) : super(key: key);

  @override
  State<voiture> createState() => _voitureState();
}

class _voitureState extends State<voiture> {
 
   Stream<QuerySnapshot> voiture = FirebaseFirestore.instance.collection('Porte').snapshots(includeMetadataChanges: true);
  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<QuerySnapshot>(
      stream: voiture,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return Column(
          
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> voiture = document.data()! as Map<String, dynamic>;
               bool valeur = voiture['status'];
         
           
            return Container(
              child: Column(
                children: [
                      
                  if(voiture['piece']=="garage")...[
            Container(
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
                    child: Text('Porte ${voiture['nom']} : ${voiture['status']!=true?'off':'on'}',
           
                          style: TextStyle(fontSize: 20,fontWeight: 
                          FontWeight.w500,),),
                  ),
                  
                       
                    CupertinoSwitch(
  value:voiture['status'],
  onChanged: (value){
    setState(() {

if(voiture['status']==true){
                        FirebaseFirestore.instance.collection('Porte').
                       doc(document.id)
                      .update({
                                "status": false
                                 })
                      .then((value) => print("User Updated"))
                      .catchError((error) => print("Failed to update user: $error"));}
                      else{ FirebaseFirestore.instance.collection('Porte').
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
