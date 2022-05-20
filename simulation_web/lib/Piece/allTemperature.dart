import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



class temperatureSalon extends StatefulWidget {
  const temperatureSalon({ Key? key }) : super(key: key);

  @override
  State<temperatureSalon> createState() => _temperatureSalonState();
}

class _temperatureSalonState extends State<temperatureSalon> {
int i = 0;
 List listId = [];

  
compteur(i){

  i= 0;
}
   Stream<QuerySnapshot> statusTemp = FirebaseFirestore.instance.collection('temps').snapshots(includeMetadataChanges: true);
  @override
  Widget build(BuildContext context) {
    
    return  StreamBuilder<QuerySnapshot>(
      stream: statusTemp,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
   i++;
   

        return Column(
          
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> statusTemp = document.data()! as Map<String, dynamic>;
       

       
      
            return Container(
              child: Column(
                children: [ 
                      
               if(statusTemp['piece']=="salon")...[ 
                                
                       
                      Text("Temperature",
                      style: TextStyle(fontSize: 20,color: Colors.yellow),), 
           
                          Text('humidity : ${statusTemp['humidity']}'),
                               Text('temperature_c : ${statusTemp['temperature_c']}'),
                                    Text('temperature_f : ${statusTemp['temperature_f']}'),
                     
                                    
                       
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



class tempCuisine extends StatefulWidget {
  const tempCuisine({ Key? key }) : super(key: key);

  @override
  State<tempCuisine> createState() => _tempCuisineState();
}

class _tempCuisineState extends State<tempCuisine> {
int i = 0;
 List listId = [];

  
compteur(i){

  i= 0;
}
   Stream<QuerySnapshot> statusTemp = FirebaseFirestore.instance.collection('temps').snapshots(includeMetadataChanges: true);
  @override
  Widget build(BuildContext context) {
    
    return  StreamBuilder<QuerySnapshot>(
      stream: statusTemp,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
   i++;
   

        return Column(
          
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> statusTemp = document.data()! as Map<String, dynamic>;
       

       
      
            return Container(
              child: Column(
                children: [ 

               if(statusTemp['piece']=="cuisine")...[ 
                                
                       
            
                        
                      Text("Temperature",
                      style: TextStyle(fontSize: 20,color: Colors.yellow),), 
           
                          Text('humidity : ${statusTemp['humidity']}'),
                               Text('temperature_c : ${statusTemp['temperature_c']}'),
                                    Text('temperature_f : ${statusTemp['temperature_f']}'),
                     
                       
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

class tempgarage extends StatefulWidget {
  const tempgarage({ Key? key }) : super(key: key);

  @override
  State<tempgarage> createState() => _tempgarageState();
}

class _tempgarageState extends State<tempgarage> {
 int i = 0;
 List listId = [];

  
compteur(i){

  i= 0;
}
   Stream<QuerySnapshot> statusTemp = FirebaseFirestore.instance.collection('temps').snapshots(includeMetadataChanges: true);
  @override
  Widget build(BuildContext context) {
    
    return  StreamBuilder<QuerySnapshot>(
      stream: statusTemp,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
   i++;
   

        return Column(
          
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> statusTemp = document.data()! as Map<String, dynamic>;
       

       
      
            return Container(
              child: Column(
                children: [ 

               if(statusTemp['piece']=="garage")...[ 
                                
                       
            
                        
                      Text("Temperature",
                      style: TextStyle(fontSize: 20,color: Colors.yellow),), 
           
                          Text('humidity : ${statusTemp['humidity']}'),
                               Text('temperature_c : ${statusTemp['temperature_c']}'),
                                    Text('temperature_f : ${statusTemp['temperature_f']}'),
                     
                       
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

class chambre extends StatefulWidget {
  const chambre({ Key? key }) : super(key: key);

  @override
  State<chambre> createState() => _chambreState();
}

class _chambreState extends State<chambre> {
 int i = 0;
 List listId = [];

  
compteur(i){

  i= 0;
}
   Stream<QuerySnapshot> statusTemp = FirebaseFirestore.instance.collection('temps').snapshots(includeMetadataChanges: true);
  @override
  Widget build(BuildContext context) {
    
    return  StreamBuilder<QuerySnapshot>(
      stream: statusTemp,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
   i++;
   

        return Column(
          
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> statusTemp = document.data()! as Map<String, dynamic>;
       

       
      
            return Container(
              child: Column(
                children: [ 

               if(statusTemp['piece']=="chambre")...[ 
                                
                       
            
                        
                      Text("Temperature",
                      style: TextStyle(fontSize: 20,color: Colors.yellow),), 
           
                          Text('humidity : ${statusTemp['humidity']}'),
                               Text('temperature_c : ${statusTemp['temperature_c']}'),
                                    Text('temperature_f : ${statusTemp['temperature_f']}'),
                     
                       
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

