import 'package:flutter/material.dart';

class ChoiseCardDataScholl extends StatelessWidget {
  final String imageUrl ;
  final String text ;
  //final Widget route; // Accept a Widget as the route

  const ChoiseCardDataScholl({super.key, required this.imageUrl, required this.text});


  @override
  Widget build(BuildContext context) {
    return InkWell(
                  onTap: (){
                    print("object") ;

                    //  Navigator.push(
                    //     context,
                    //     MaterialPageRoute(builder: (context) => route),
                    //   );
                  },
                   child: Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.blue[50] ,
                      borderRadius: BorderRadius.circular(10)
                    ),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(imageUrl),
                        
                        Text(text, 
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold ,
                          
                        ),
                        ) ,
                      ] ,
                    ) ,
                   
                   
                   ),
                 ) ;
  }
}