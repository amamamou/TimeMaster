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
                 Navigator.pushNamed(context , '/addNameSchool') ;              
               }
              ),


              listTileWidget("Managment Time " , Icons.av_timer_rounded ,
               (){
                  Navigator.pushNamed(context , '/choiseParam') ;          
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

                const Spacer(), // Pushes the logout option to the bottom
          listTileWidget("Logout", Icons.logout, () {
            // Implement logout functionality
            Navigator.pop(context); // Close the drawer
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Logout"),
                  content: const Text("Are you sure you want to logout?"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context); // Close the dialog
                      },
                      child: const Text("Cancel"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context); // Close the dialog
                        Navigator.pushReplacementNamed(context, '/login'); // Navigate to login
                      },
                      child: const Text("Logout"),
                    ),
                  ],
                );
              },
            );
          }),
      
            ],
          ),
        );
  }
}

