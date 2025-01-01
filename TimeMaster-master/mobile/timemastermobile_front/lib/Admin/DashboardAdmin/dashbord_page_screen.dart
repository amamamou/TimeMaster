import 'package:flutter/material.dart';

import 'package:timemastermobile_front/Screens/change_data_scholl_screen.dart';
import 'package:timemastermobile_front/students/student_list_screen.dart';
import 'package:timemastermobile_front/teachers/teacher_list_screen.dart';
import 'package:timemastermobile_front/widgets/drawer_popup.dart';

import 'package:timemastermobile_front/Admin/DashboardAdmin/change_data_scholl_screen.dart';
import 'package:timemastermobile_front/Admin/DashboardAdmin/drawer_admin.dart';
import 'package:timemastermobile_front/Admin/matiere/ajoutmatiere.dart';

import '../../widgets/choise_card.dart';
import '../../widgets/cover.dart';

class DashbordPageScreen extends StatelessWidget {
  const DashbordPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var title;
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("images/logos/appbar-logo.png"),
      ),
      drawer: const DrawerPopup(),
      body: Column(
        children: [
          const Cover(imagePath: "images/covers/home-cove-img.png"),
          const Text(
            "Choose your option",
            style: TextStyle(
                color: Color.fromRGBO(17, 55, 171, 1),
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 50,
          ),
          Expanded(
            // Wrap GridView with Expanded
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              children: [
                const ChoiseCard(
                    icon: Icons.business,
                    title :"School Data" ,
                    route: ChangeDataSchollScreen()),
                const ChoiseCard(
                    icon: Icons.file_copy_outlined,
                    title :"Matter" ,
                    route: ChangeDataSchollScreen()),
                ChoiseCard(
                    icon: Icons.manage_accounts,
                    title :"Students" ,
                    route: StudentListScreen()),

                   
                const ChoiseCard(
                    icon: Icons.menu_book_sharp,
                    title :"School Data" ,
                    route: ChangeDataSchollScreen()),
                const ChoiseCard(
                    icon: Icons.date_range_outlined,
                    title :"School Data" ,
                    route: ChangeDataSchollScreen()),
                ChoiseCard(
                    icon: Icons.supervised_user_circle_rounded,

                    title :"Teachers" ,
                    route: TeacherListScreen()),

                    title :"School Data" ,
                    route: ChangeDataSchollScreen()),
                const ChoiseCard(
                    icon: Icons.manage_accounts,
                    title :"School Data" ,
                    route: ChangeDataSchollScreen()),
                const ChoiseCard(
                    icon: Icons.filter_alt_rounded,
                    title :"School Data" ,
                    route: ChangeDataSchollScreen()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
