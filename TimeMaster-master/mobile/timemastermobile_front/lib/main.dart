import 'package:flutter/material.dart';
import 'package:timemastermobile_front/school_managment/Screen/School_list_screen.dart';
import 'package:timemastermobile_front/school_managment/Screen/add_name_school_screen.dart';
import 'package:timemastermobile_front/Screens/change_data_scholl_screen.dart';
import 'package:timemastermobile_front/Screens/dashbord_page_screen.dart';
import 'package:timemastermobile_front/Screens/login_screen.dart';
import 'package:timemastermobile_front/Screens/schedule_screen.dart';
import 'package:timemastermobile_front/Screens/slash_screen.dart';
import 'package:timemastermobile_front/Screens/tabs_screen.dart';
import 'package:timemastermobile_front/home-page.dart';
import 'package:timemastermobile_front/matiere/ajoutmatiere.dart';
import 'package:timemastermobile_front/school_managment/Screen/update_school_screen.dart';
import 'package:timemastermobile_front/school_managment/data/school_model.dart'; // Make sure you import the School model

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Time Master",
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(65, 105, 225, 100),
        colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: const Color.fromRGBO(183, 28, 28, 1)),
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
          color: Color.fromRGBO(65, 105, 225, 100),
          elevation: 4,
          centerTitle: true,
        ),
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/updateSchool') {
          final School school = settings.arguments as School;
          return MaterialPageRoute(
            builder: (context) => UpdateSchoolScreen(school: school),
          );
        }
        return null; // Add other routes here
      },
      routes: {
        '/': (context) => const SlashScreen(),
        '/tabBar': (context) => const TabBarScreen(),
        '/dashboard': (context) => const DashbordPageScreen(),
        '/schedule': (context) => const ScheduleScreen(),
        '/login': (context) => const LoginScreen(),
        '/changeDataSchool': (context) => const ChangeDataSchollScreen(),
        '/matieres': (context) => AjoutMatiereScreen(),
        '/addNameSchool': (contex) => const AddNameCollageScreen(),
        '/listSchoolName': (context) => SchoolListScreen(),
      },
    );
  }
}
