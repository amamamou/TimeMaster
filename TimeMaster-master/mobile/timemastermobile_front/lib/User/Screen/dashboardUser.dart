import 'package:flutter/material.dart';
import 'package:timemastermobile_front/User/Screen/app_drawer.dart';
import 'package:timemastermobile_front/User/Screen/discussion.dart';
import 'package:timemastermobile_front/User/Screen/emploi.dart';
import 'package:timemastermobile_front/widgets/card_dashboarduser.dart';
import 'package:timemastermobile_front/User/Screen/drawer_user.dart';

class Dashboarduser extends StatelessWidget {
  const Dashboarduser({super.key});
 
 
  @override
  Widget build(BuildContext context) {
    // Define a primary color for consistency
    final primaryColor = Color(0xFF4169E1);


    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Image.asset(
          "images/logos/appbar-logo.png",
          height: 40,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "Welcome ",
                        style: TextStyle(
                          color: Color.fromARGB(255, 4, 44, 242),
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),
                      TextSpan(
                        text: "Rayen",
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),
                    ],
                  ),
                ),
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('images/persons/rayen.jpg'),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Dashboard Header with Background Gradient
            Stack(
              alignment: Alignment.centerRight,
              children: [

                // Positioned(
                //     // right: -10,
                //     right: -10,
                //   child: Image.asset(                      
                //     "images/covers/left_dashbord.png",
                //     width: 150,
                //     height: 150,
                //   ),
                //   ),

                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(     
                      colors: [primaryColor.withOpacity(0.7), const Color.fromARGB(255, 4, 44, 242)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  //4169E1
                  
                    
                 child: const Center(
                    child: Text(
                      "User Dashboard",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                  ),
                  
                ),
                Positioned(
                  right: -10,
                  child: Image.asset(
                    "images/covers/right_dashbord.png",
                    width: 150,
                    height: 150,
                  ),
                ),

                 Positioned(
                    // right: -10,
                  left: -10,
                  child: Image.asset(
                    "images/covers/left_dashbord.png",
                    width: 150,
                    height: 150,
                  ),
                  ),
              ],
            ),

  //----------------------------------------------------------------          
            const SizedBox(height: 40),

            // Dashboard Cards
            Wrap(
              spacing: 20,
              runSpacing: 20,
              children: [
                CardDashboarduser(
                  imageUrl: "images/covers/timetable.jpg",
                  text: "Check Timetable",
                  route: const Emploi(),
             
                ),
                CardDashboarduser(
                  imageUrl: "images/covers/discussion.jpg",
                  text: "Discussion of Results",
                  route: const Discussion(),
         
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
