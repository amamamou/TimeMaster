import 'package:flutter/material.dart';

class DaysPerWeekScreen extends StatefulWidget {
  const DaysPerWeekScreen({super.key});

  @override
  _DaysPerWeekScreenState createState() => _DaysPerWeekScreenState();
}

class _DaysPerWeekScreenState extends State<DaysPerWeekScreen> {
  // Liste des jours de la semaine
  final List<String> days = [
    "Lundi",
    "Mardi",
    "Mercredi",
    "Jeudi",
    "Vendredi",
    "Samedi",
    "Dimanche",
  ];

  // État de sélection pour chaque jour
  List<bool> selectedDays = [false, false, false, false, false, false, false];

  // Fonction pour sélectionner ou désélectionner tous les jours
  void toggleAllDays(bool selectAll) {
    setState(() {
      selectedDays = List<bool>.filled(days.length, selectAll);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(65, 105, 225, 1),
        title: const Text(
          "Jours par semaine",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Titre principal
            const Text(
              "Sélectionnez les jours de travail",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(65, 105, 225, 1),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Choisissez les jours où vous travaillez dans la semaine :",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 20),
            // Liste des jours avec boutons individuels
            Expanded(
              child: ListView.builder(
                itemCount: days.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 16,
                      ),
                      title: Text(
                        days[index],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: Switch(
                        value: selectedDays[index],
                        onChanged: (value) {
                          setState(() {
                            selectedDays[index] = value;
                          });
                        },
                        activeColor: const Color.fromRGBO(65, 105, 225, 1),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          bool allSelected = selectedDays.every((day) => day);
          toggleAllDays(!allSelected);
        },
        label: Text(
          selectedDays.every((day) => day)
              ? "Désélectionner tous"
              : "Sélectionner tous",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        icon: Icon(
          selectedDays.every((day) => day) ? Icons.remove_done : Icons.done_all,
        ),
        backgroundColor: const Color.fromRGBO(65, 105, 225, 1),
      ),
    );
  }
}
