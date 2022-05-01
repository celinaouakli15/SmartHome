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
       
     
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: [   
             
               Text("SALON"),
               temperatureGlobal(),
               
            
                Text("CUISINE"),
                 Text("CHAMBRE"),
                  Text("GARAGE"),
         
             
      
          
        ],
        ),
        ),
      )
      
    );
  }
  
}
