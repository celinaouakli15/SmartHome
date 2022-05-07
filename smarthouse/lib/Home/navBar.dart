import 'package:flutter/material.dart';
import 'package:smarthouse/Home/Donnees/donnees.dart';
import 'package:smarthouse/Home/Maison.dart';
import 'package:smarthouse/Home/Pieces/room.dart';
import 'package:smarthouse/Home/Led/addLed.dart';
import 'package:smarthouse/Home/Raccourcis/raccourcis.dart';
import 'package:smarthouse/Home/enConstruction.dart';

class navBar extends StatefulWidget {
  const navBar({ Key? key }) : super(key: key);

  @override
  State<navBar> createState() => _navBarState();
}

class _navBarState extends State<navBar> {
   int selection= 0;
   PageController pageController = PageController();
void ontapped(int index){
  setState(() {
    selection = index;

  });
  pageController.jumpToPage(index);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         
   automaticallyImplyLeading: false, 
     backgroundColor: Color.fromARGB(221, 23, 22, 22),
          actions: [
          //IconButton(
           // icon: Icon(Icons.menu), onPressed: () {  },
       // )
        ],
      ),
          
      body: 
             PageView(
               controller: pageController,
               children:[ 
                 Home(),
                donnees(),
                 room(),
               //  raccourcis(),
                 construction()
                 
               ],
             ),
   
         
       bottomNavigationBar: BottomNavigationBar(
         fixedColor: Color.fromARGB(255, 255, 255, 255),
        elevation: 10,
       currentIndex: selection, // this will be set when a new tab is tapped
       items: [
         BottomNavigationBarItem(
           icon: new Icon(Icons.home),
           label:  'Maison',
         backgroundColor: Color.fromARGB(221, 23, 22, 22),
         ),
         BottomNavigationBarItem(
           icon: new Icon(Icons.analytics),
           label: 'Données',
       backgroundColor: Color.fromARGB(221, 16, 15, 15)
         ),
         BottomNavigationBarItem(
           icon: Icon(Icons.bedroom_parent_rounded
           ),
           label: 'Pièces',
              backgroundColor: Color.fromARGB(221, 16, 15, 15)
),             

     /*   
         BottomNavigationBarItem(
           icon: new Icon(Icons.play_circle),
           label: 'Raccourcis',
              backgroundColor: Color.fromARGB(221, 16, 15, 15)
       ),
       */
        BottomNavigationBarItem(
           icon: new Icon(Icons.settings),
           label: 'Parametre',
              backgroundColor: Color.fromARGB(221, 16, 15, 15)
           ),
       
       ],
       onTap: ontapped,
     ),
    
    );

  }
  
}