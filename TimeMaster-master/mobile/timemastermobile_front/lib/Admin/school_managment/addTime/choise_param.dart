import 'package:flutter/material.dart';
import 'package:timemastermobile_front/Admin/school_managment/addTime/add_hours_screen.dart';
import 'package:timemastermobile_front/Admin/school_managment/addTime/days_week_screen.dart';
import 'package:timemastermobile_front/widgets/container_info.dart';


List<String> selectedDays = ['Lundi', 'Mardi', 'Mercredi'];  // Example selected days

class ChoiseParam extends StatelessWidget {
  const ChoiseParam({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("images/logos/appbar-logo.png"),
        backgroundColor: const Color.fromRGBO(65, 105, 225, 1),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          const ContainerInfo(
            titleContainer: "Jours et Heures",
            imageUrl: "images/graphic-icons/jour-heurs.png",
          ),
          const SizedBox(height: 50),
          const Center(
            child: Text(
              "Please enter your School Data!",
              style: TextStyle(
                color: Color.fromRGBO(65, 105, 225, 1),
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 30),
          // Option 1: Jours par semaine


          ListTile(
            title: const Text("Jours par semaine"),
            subtitle: const Text("Les jours ou ils étudient"),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DaysPerWeekScreen()),
              );
            },
          ),
          // const DrawerPopup(),
          // Option 2: Heures (périodes) par jour
          ListTile(
            title: const Text("Heures (périodes) par jour"),
            subtitle: const Text("Mettez les heures de travail par jour"),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HoursPerDayScreen(selectedDays: selectedDays),
              ),
            );
            },
          ),
        ],
      ),
    );
  }
}
