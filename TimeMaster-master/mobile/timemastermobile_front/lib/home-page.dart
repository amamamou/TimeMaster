import 'dart:async';
import 'package:flutter/material.dart';
import 'package:timemastermobile_front/Authentification/loginPage.dart';
import 'package:timemastermobile_front/matiere/ajoutmatiere.dart';
import 'package:timemastermobile_front/matiere/matiere.dart';
import 'package:timemastermobile_front/matiere/matiere_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> messages = [
    {'photo': 'images/persons/rayen.jpg', 'message': 'Rayen: Great app!'},
    {'photo': 'images/persons/marama.jpg', 'message': 'Maram: Very helpful!'},
    {'photo': 'images/persons/sarrah.jpg', 'message': 'Sarra: Love the interface!'},
    {'photo': 'images/persons/roua.png', 'message': 'Roua: Well Structured!'},
    {'photo': 'images/persons/maraw.png', 'message': 'Maram: Useful Schedule For Student!'},
  ];

  int _currentMessageIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        _currentMessageIndex = (_currentMessageIndex + 1) % messages.length;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
       
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color.fromRGBO(65, 105, 225, 0.14),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
              
                Image.asset(
                  'images/covers/home-image.png',
                  width: 300,
                  height: 400,
                  fit: BoxFit.cover,
                ),

            //message anime
                Positioned(
                  bottom: 80, // Position du message sur l'image
                  left: 10,
                  right: 10,
                  child: AnimatedSwitcher(
                    duration: Duration(seconds: 1),
                    transitionBuilder: (Widget child, Animation<double> animation) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                    child: Container(
                      key: ValueKey<int>(_currentMessageIndex),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8), // Fond transparent
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          
                          CircleAvatar(
                            backgroundImage: AssetImage(messages[_currentMessageIndex]['photo']!),
                            radius: 20,
                          ),
                          SizedBox(width: 10), 
                          Expanded(
                            child: Text(
                              messages[_currentMessageIndex]['message']!,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

               
                Positioned(
                  bottom: 30,
                  child:Text(
                  '25K+ STUDENTS'
                             ,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(65, 105, 225, 1), 
                  ),
                  textAlign: TextAlign.center,
                ),
                
                ),
                Positioned(
                  bottom: 1, 
                  child:Text(
                  
                             'TRUST US',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(65, 105, 225, 1), 
                  ),
                  textAlign: TextAlign.center,
                ),
                
                ),
              ],
            ),
          ),

          SizedBox(height: 50), 

       
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>LoginPage()),
              );
            },
            icon: Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
            label: Text(
              'Login',
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            ),
          ),

          Spacer(),

          Container(
            width: double.infinity,
            color: Color.fromRGBO(65, 105, 225, 0.14),
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                Text(
                  'Find the right instructor for you from over 10,000 teachers',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/covers/loading-logo.png',
                      width: 50,
                      height: 50,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Time Master',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
