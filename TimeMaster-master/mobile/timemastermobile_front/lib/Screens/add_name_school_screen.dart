import 'package:flutter/material.dart';
import 'package:timemastermobile_front/widgets/container_info.dart';


class AddNameCollageScreen extends StatelessWidget {
  const AddNameCollageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("images/logos/appbar-logo.png"),
      ),
      body: Column(
        children: [
          SizedBox(height: 15),
          
          
          //Card :
            ContainerInfo(titleContainer: "School Name" , imageUrl: "images/graphic-icons/university.png") ,

          //
          SizedBox(height: 100),
          Text("Choose your option" ,
          style: TextStyle(
            color: Color.fromRGBO(65, 105, 225, 1),
            fontSize: 17 ,
            fontWeight: FontWeight.bold
          ),
          ),
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Container(
              decoration: BoxDecoration(
              color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8)
              ),
      
              child: TextField(
                decoration: InputDecoration(
                  hintText: "EX : ISET Sousse",
                  iconColor: Colors.grey,
                  hoverColor: Colors.red,
                  icon: Icon(Icons.school),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10) ,
                  fillColor: Colors.blue ,
                  suffixIconColor: Colors.red,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Handle button press
            },
            
            style: ButtonStyle(
   
              backgroundColor: MaterialStateProperty.all(
                Color.fromRGBO(65, 105, 225, 1),
              ),

              padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(horizontal: 125)
              ) ,

              shape: MaterialStateProperty.all(
               RoundedRectangleBorder( borderRadius : BorderRadius.circular(8) ) ,
              ),

              elevation: MaterialStateProperty.all(15)
            ),
            child: Text(
              "Add Name",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
