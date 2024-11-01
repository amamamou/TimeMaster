import 'package:flutter/material.dart';

class DrawerPopup extends StatelessWidget {
  const DrawerPopup({super.key});


    // This is a helper method inside the class to create a ListTile widget
  ListTile listTileWidget(String title, IconData icon, Function() onTapLink) {
    return ListTile(
      leading: Icon(icon, size: 30, color: Colors.blue),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTapLink,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Drawer(
          child: Column(
            children: [
              Container(
                height: 100,
                width: double.infinity,

                padding: const EdgeInsets.only(top: 40),
                alignment: Alignment.center,
                color: const Color.fromRGBO(65, 105, 225, 100),
                child: const Text("Menu" , 
                style: TextStyle(
                  color: Colors.white ,
                  fontSize: 25 ,
                  fontWeight: FontWeight.bold
                ),
                ),
              ),

              const SizedBox(height: 20,),

              listTileWidget("School Data" , Icons.business ,
               (){
                 Navigator.pop(context , '/addNameSchool') ;              
               }
              ),


              listTileWidget("Activite " , Icons.filter_alt_rounded ,
               (){
                   print("click 2") ;            
                }
              ),

              listTileWidget("matter  " , Icons.menu_book_sharp ,
               (){
                   print("click 2") ;            
                }
              ),

              listTileWidget("class management " , Icons.filter_alt_rounded ,
               (){
                   print("click 2") ;            
                }
              ),

              listTileWidget("User managment " , Icons.supervised_user_circle_rounded ,
               (){
                   print("click 2") ;            
                }
              ),


      
            ],
          ),
        );
  }
}

