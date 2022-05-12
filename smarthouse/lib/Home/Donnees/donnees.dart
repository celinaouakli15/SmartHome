import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../Temperature/allTemperature.dart';

class donnees extends StatefulWidget {
  const donnees({ Key? key }) : super(key: key);

  @override
  State<donnees> createState() => _donneesState();
}

class _donneesState extends State<donnees> {
   @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(

           automaticallyImplyLeading: false, 
         title: Text("Capteur Actif"),
         
       ),
       
     
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ 
        temperatureGlobal(),
                nbrLed(),
                nbrVolet(),
                nbrPorte(),
                nbrAlarme(),
               
        ],
        ),
        ),
      )
      
    );
  }
  
}







class nbrLed extends StatefulWidget {
  const nbrLed({ Key? key }) : super(key: key);

  @override
  State<nbrLed> createState() => _nbrLedState();
}

class _nbrLedState extends State<nbrLed> {
  
 List listId = [];
  List listOffLed = [];
  List listOnLed = [];
  int i= 0;
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
         i++;
          print(i.toString());

        return Column(
          
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> ledStatus = document.data()! as Map<String, dynamic>;
   
         listId.add(document.id);
            
        
                   



            return Container(
             
              child: Column(
                children: [

                   if(ledStatus['status']==true && ledStatus['nom']!="onoff")...[
                   Container(
                      margin: const EdgeInsets.all(20.0),
                 
                 decoration: BoxDecoration(border: Border.all(width: 2),
                                          borderRadius: BorderRadius.circular(15),
                                          
                                          color: Colors.red,
                  ),
                     child: Row(
                       
                       
                       children: [
                         SizedBox(width: 10,),
             Expanded( 
                    child:
                Text('Nom :',
           
                            style: TextStyle(fontSize: 20,fontWeight: 
                            FontWeight.w500,),),),
                  


                  Text(ledStatus['nom'],
           
                            style: TextStyle(fontSize: 20,fontWeight: 
                            FontWeight.w500,),),
                            SizedBox(width: 10,),
                  
                     ],
                     
                     
                     ),
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

class nbrVolet extends StatefulWidget {
  const nbrVolet({ Key? key }) : super(key: key);

  @override
  State<nbrVolet> createState() => _nbrVoletState();
}

class _nbrVoletState extends State<nbrVolet> {
   List listIdVolet = [];
  int i= 0;
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
         i++;
          print(i.toString());

        return Column(
          
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> statusVolet = document.data()! as Map<String, dynamic>;
               bool valeur = statusVolet['status'];
         
           
                   listIdVolet.add(document.id);
            return Container(
             
              child: Column(
                children: [

                   if(statusVolet['status']==true&& statusVolet['nom']!="onoff")...[
                   Container(
                      margin: const EdgeInsets.all(20.0),
                 
                 decoration: BoxDecoration(border: Border.all(width: 2),
                                          borderRadius: BorderRadius.circular(15),
                                          
                                          color: Colors.grey,
                  ),
                     child: Row(
                       
                       
                       children: [
                         SizedBox(width: 10,),
             Expanded( 
                    child:
                Text('Nom :',
           
                            style: TextStyle(fontSize: 20,fontWeight: 
                            FontWeight.w500,),),),
                  


                  Text(statusVolet['nom'],
           
                            style: TextStyle(fontSize: 20,fontWeight: 
                            FontWeight.w500,),),
                            SizedBox(width: 10,),
                  
                     ],
                     
                     
                     ),
                   ),
                    
                     ]
                  
                     ]
                  
                
                
              ),
            );
          }).toList(),
        );
      },
      
    );
  }
}

class nbrPorte extends StatefulWidget {
  const nbrPorte({ Key? key }) : super(key: key);

  @override
  State<nbrPorte> createState() => _nbrPorteState();
}

class _nbrPorteState extends State<nbrPorte> {
 List listIdPorte = [];
  List listOffLed = [];
  List listOnLed = [];
  int i= 0;
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
         i++;
          print(i.toString());

        return Column(
          
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> ledStatus = document.data()! as Map<String, dynamic>;
    
                   listIdPorte.add(document.id);

print("off:");
print(listOffLed.length);
print("list id");
print(listIdPorte.length);

            return Container(
             
              child: Column(
                children: [
                  

                   if(ledStatus['status']==true&& ledStatus['nom']!="onoff")...[
                   Container(
                      margin: const EdgeInsets.all(20.0),
                 
                 decoration: BoxDecoration(border: Border.all(width: 2),
                                          borderRadius: BorderRadius.circular(15),
                                          
                                          color: Colors.purple,
                  ),
                     child: Row(
                       
                       
                       children: [
                         SizedBox(width: 10,),
             Expanded( 
                    child:
                Text('Nom :',
           
                            style: TextStyle(fontSize: 20,fontWeight: 
                            FontWeight.w500,),),),
                  


                  Text(ledStatus['nom'],
           
                            style: TextStyle(fontSize: 20,fontWeight: 
                            FontWeight.w500,),),
                            SizedBox(width: 10,),
                  
                     ],
                     
                     
                     ),
                   )
                    
                   ]
                   
                   ]
                  
                
              ),
            );
          }).toList(),
        );
      },
      
    );
  }
}


class nbrAlarme extends StatefulWidget {
  const nbrAlarme({ Key? key }) : super(key: key);

  @override
  State<nbrAlarme> createState() => _nbrAlarmeState();
}

class _nbrAlarmeState extends State<nbrAlarme> {
 List listIdAlarme = [];
  List listOffLed = [];
  List listOnLed = [];
  int i= 0;
   Stream<QuerySnapshot> statusLed = FirebaseFirestore.instance.collection('alarm').snapshots(includeMetadataChanges: true);

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
         i++;
          print(i.toString());

        return Column(
          
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> ledStatus = document.data()! as Map<String, dynamic>;
               bool valeur = ledStatus['status'];
         
            
               bool allOff;
                    var allOn;
                   listIdAlarme.add(document.id);

print("off:");
print(listOffLed.length);
print("list id");
print(listIdAlarme.length);

            return Container(
             
              child: Column(
                children: [         

                   if(ledStatus['status']==true&& ledStatus['nom']!="onoff")...[
                   Container(
                      margin: const EdgeInsets.all(20.0),
                 
                 decoration: BoxDecoration(border: Border.all(width: 2),
                                          borderRadius: BorderRadius.circular(15),
                                          
                                          color: Colors.blue,
                  ),
                     child: Row(
                       
                       
                       children: [
                         SizedBox(width: 10,),
             Expanded( 
                    child:
                Text('Nom :',
           
                            style: TextStyle(fontSize: 20,fontWeight: 
                            FontWeight.w500,),),),
                  


                  Text(ledStatus['nom'],
           
                            style: TextStyle(fontSize: 20,fontWeight: 
                            FontWeight.w500,),),
                            SizedBox(width: 10,),
                  
                     ],
                     
                     
                     ),
                   )
                    
                   ]]
                   
        
                       
                
              ),
            );
          }).toList(),
        );
      },
      
    );
  }
}


class dddd extends StatefulWidget {
  const dddd({ Key? key }) : super(key: key);

  @override
  State<dddd> createState() => _ddddState();
}

class _ddddState extends State<dddd> {
  List listId = [];
  List listOffLed = [];
  List listOnLed = [];
  int i= 0;
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
         i++;
          print(i.toString());

        return Column(
          
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> ledStatus = document.data()! as Map<String, dynamic>;
               bool valeur = ledStatus['status'];
         
            
               bool allOff;
                    var allOn;
                   listId.add(document.id);
if (ledStatus['status']== true && (((listId.length+1)/i)< listOnLed.length)) {
  listOnLed.add(document.id);
}

if (ledStatus['status']== false) {
  listOffLed.add(document.id);
}
print("off:");
print(listOffLed.length);
print("list id");
print(listId.length);

            return Container(
             
              child: Column(
                children: [
                   if(document.id=="salon")...[
                   Container(
                      margin: const EdgeInsets.all(20.0),
                 
                 decoration: BoxDecoration(border: Border.all(width: 2),
                                          borderRadius: BorderRadius.circular(15),
                                          
                                          color: Colors.grey,
                  ),
                     child: Row(
                       
                       
                       children: [
                         SizedBox(width: 10,),
             Expanded( 
                    child:
                Text('Nombre de Volet :',
           
                            style: TextStyle(fontSize: 20,fontWeight: 
                            FontWeight.w500,),),),
                  


                  Text(((listId.length+1)/i).toString(),
           
                            style: TextStyle(fontSize: 20,fontWeight: 
                            FontWeight.w500,),),
                            SizedBox(width: 10,),
                  
                     ],
                     
                     
                     ),
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
