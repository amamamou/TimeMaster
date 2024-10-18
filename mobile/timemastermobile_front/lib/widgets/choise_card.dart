import 'package:flutter/material.dart';

class ChoiseCard extends StatelessWidget {
  final IconData icon ;
  final Widget route; // Accept a Widget as the route
  

  const ChoiseCard({super.key, required this.icon , required this.route});

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
      child: Container(
                      width : 50 ,
                      height: 999,
                      child: Card(            
                        color: Colors.blue[50],
                        child:  Icon(
                           icon, 
                           color: Color.fromRGBO(17, 55, 171, 1),
                           size: 55,
                        ),
                      ),
                    ),
    );
  }
}