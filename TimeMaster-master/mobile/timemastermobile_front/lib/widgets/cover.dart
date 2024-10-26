import 'package:flutter/material.dart';

class Cover extends StatelessWidget {
  final String imagePath ;

  const Cover({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue[50],
              ),
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(2),

              width :500 ,
              height: 300,

                child: SizedBox(
                    width: 200, // Set the desired width for the image
                    height: 500, // Set the desired height for the image
                    child: Image.asset(
                      imagePath
                    ),
                  ),
         
            );
  }
}