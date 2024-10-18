import 'package:flutter/material.dart';
import 'package:timemastermobile_front/widgets/cover.dart';
import 'package:timemastermobile_front/widgets/drawer_popup.dart';

import '../widgets/choise_card_data_scholl.dart';


class ChangeDataSchollScreen extends StatelessWidget {
  const ChangeDataSchollScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Image.asset("images/logos/appbar-logo.png"),
          ),
       
        drawer:  DrawerPopup() ,

        body: Column(
          children: [
            Cover(imagePath:"images/covers/cover2.png") ,
            Text("Choose your option" , 
            style: TextStyle(
              color: Color.fromRGBO(17, 55, 171, 1),
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),
            ) ,

            SizedBox(width: 50,) ,

            
            Expanded( // Wrap GridView with Expanded
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),

                children: [

                    ChoiseCardDataScholl(imageUrl: "images/graphic-icons/university.png", text: "Information establishment"),
                    ChoiseCardDataScholl(imageUrl: "images/graphic-icons/jour-heurs.png", text: "Days and Hours"),   

                ],
              ),
            ),



          ],
        ),
       
      );
  }
}