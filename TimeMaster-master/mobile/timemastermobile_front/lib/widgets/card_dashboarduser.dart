import 'package:flutter/material.dart';

class CardDashboarduser extends StatelessWidget {
   final String imageUrl ;
   final String text ;
   final Widget route;

  const CardDashboarduser({super.key, required this.imageUrl, required this.text, required this.route});
    // Accept a Widget as the route


  @override
  Widget build(BuildContext context) {
    return InkWell(
            onTap : ()=>{
               Navigator.push(context,MaterialPageRoute(builder: (context) => route)),
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
              ),
              elevation: 7,
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        child: Image.asset(
                          imageUrl ,
                          height: 250,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ) ,

                      Container(
                        height: 250,
                        alignment: Alignment.bottomCenter,
                        padding: EdgeInsets.symmetric(
                          vertical: 10 ,
                          horizontal: 20
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withOpacity(0) ,
                              Colors.black.withOpacity(0.8) ,
                            ] ,
                            stops: [
                              0.4 , 1 //men 60% lel 100%
                            ]
                          )
                        ),
                        child: Text(
                          text ,
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                            fontSize: 20 ,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),  
                         ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
  }
}