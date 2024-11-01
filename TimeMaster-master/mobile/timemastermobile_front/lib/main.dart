import 'package:flutter/material.dart';
import 'package:timemastermobile_front/Screens/add_name_school_screen.dart';
import 'package:timemastermobile_front/Screens/change_data_scholl_screen.dart';
import 'package:timemastermobile_front/Screens/dashbord_page_screen.dart';
import 'package:timemastermobile_front/Screens/login_screen.dart';
import 'package:timemastermobile_front/Screens/schedule_screen.dart';
import 'package:timemastermobile_front/Screens/slash_screen.dart';
import 'package:timemastermobile_front/Screens/tabs_screen.dart';
import 'package:timemastermobile_front/home-page.dart';
import 'package:timemastermobile_front/matiere/ajoutmatiere.dart';
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
      // home: TabBarScreen() ,

      initialRoute: '/' ,
      routes: {
        '/': (context) => const SlashScreen(),
        '/tabBar': (context) => const TabBarScreen(),
        '/dashboard' : (context) => const DashbordPageScreen() ,
        '/schedule': (context) => const ScheduleScreen(),
        '/login': (context) => const LoginScreen(),
        '/changeDataSchool': (context) => const ChangeDataSchollScreen(),
<<<<<<< HEAD:TimeMaster-master/mobile/timemastermobile_front/lib/main.dart
         '/matieres': (context) => AjoutMatiereScreen(),
=======
        '/addNameSchool' : (contex) => const AddNameCollageScreen()
>>>>>>> 558f2c8 (add page name school (frentend)):mobile/timemastermobile_front/lib/main.dart
        
      },
    );
  }
}


