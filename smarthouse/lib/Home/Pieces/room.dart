import 'package:flutter/material.dart';
import 'package:smarthouse/Home/Pieces/chambre.dart';
import 'package:smarthouse/Home/Pieces/cuisine.dart';
import 'package:smarthouse/Home/Pieces/garage.dart';
import 'package:smarthouse/Home/Pieces/salon.dart';

import '../../Widgets/widgets.dart';

class room extends StatefulWidget {
  const room({ Key? key }) : super(key: key);

  @override
  State<room> createState() => _roomState();
}

class _roomState extends State<room> {
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
                      
                     roomcategorie(context,"salon.jpeg",direction: (){   
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const salon()),
                      );} ),
                         SizedBox(height: 10,),
                      roomcategorie(context,"cuisine.jpeg",direction: (){   
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const cuisine()),
                      );} ),
                        
        
        
                         SizedBox(height: 10,),
                      
                     roomcategorie(context,"chambre.jpeg",direction: (){   
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const chambre()),
                      );} ),
                      SizedBox(height: 10,),
                      roomcategorie(context,"garage.jpeg",direction: (){   
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const garage()),
                      );} ),
                        
        
        
                         SizedBox(height: 20,),
       
        ]
        ),
                 ),
               ),
            
   
         
      
    
      
    );
  }
}