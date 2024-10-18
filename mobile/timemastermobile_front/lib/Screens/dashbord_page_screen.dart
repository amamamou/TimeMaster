import 'package:flutter/material.dart';
import 'package:timemastermobile_front/Screens/change_data_scholl_screen.dart';
import 'package:timemastermobile_front/widgets/drawer_popup.dart';

import '../widgets/choise_card.dart';
import '../widgets/cover.dart';

class DashbordPageScreen extends StatelessWidget {
  const DashbordPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("images/logos/appbar-logo.png"),
      ),
      drawer: DrawerPopup(),
      body: Column(
        children: [
          Cover(imagePath: "images/covers/home-cove-img.png"),
          Text(
            "Choose your option",
            style: TextStyle(
                color: Color.fromRGBO(17, 55, 171, 1),
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 50,
          ),
          Expanded(
            // Wrap GridView with Expanded
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              children: [
                ChoiseCard(
                    icon: Icons.business, route: ChangeDataSchollScreen()),
                ChoiseCard(
                    icon: Icons.file_copy_outlined,
                    route: ChangeDataSchollScreen()),
                ChoiseCard(
                    icon: Icons.insert_drive_file_outlined,
                    route: ChangeDataSchollScreen()),
                ChoiseCard(
                    icon: Icons.menu_book_sharp,
                    route: ChangeDataSchollScreen()),
                ChoiseCard(
                    icon: Icons.date_range_outlined,
                    route: ChangeDataSchollScreen()),
                ChoiseCard(
                    icon: Icons.supervised_user_circle_rounded,
                    route: ChangeDataSchollScreen()),
                ChoiseCard(
                    icon: Icons.manage_accounts,
                    route: ChangeDataSchollScreen()),
                ChoiseCard(
                    icon: Icons.filter_alt_rounded,
                    route: ChangeDataSchollScreen()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
