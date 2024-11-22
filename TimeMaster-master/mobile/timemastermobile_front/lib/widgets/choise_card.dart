import 'package:flutter/material.dart';

class ChoiseCard extends StatelessWidget {
  final IconData icon ;
  final String title ;
  final Widget route; // Accept a Widget as the route
  

  const ChoiseCard({super.key, required this.icon , required this.title , required this.route});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
         // Navigate to the provided route (ChangeDataSchollScreen in your case)
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => route),
        );
      },
      child: SizedBox(
                      width : 50 ,
                      height: 999,
                      child: Card(            
                        color: Colors.blue[50],
                        child:  Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                               icon, 
                               color: const Color.fromRGBO(17, 55, 171, 1),
                               size: 55,
                            ),

                            Text(title ,
                                style: TextStyle(
                                  color: const Color.fromRGBO(17, 55, 171, 1) ,
                                  fontWeight: FontWeight.bold
                                ),
                                )
                          ],
                        ),
                      ),
                    ),
    );
  }
}