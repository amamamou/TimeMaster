import 'package:flutter/material.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title : Image.asset("images/logos/appbar-logo.png") ,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Icon(Icons.access_time_filled_sharp,
              color: Colors.red,
              size: 200,
            
              ),
            ),
            Image.asset("images/covers/emploi.jpg")
          ],
        ),
      ),
    );
  }
}