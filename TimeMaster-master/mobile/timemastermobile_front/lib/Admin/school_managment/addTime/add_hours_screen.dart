import 'package:flutter/material.dart';

class HoursPerDayScreen extends StatefulWidget {
  final List<String> selectedDays; // Jours sélectionnés

  const HoursPerDayScreen({Key? key, required this.selectedDays})
      : super(key: key);

  @override
  _HoursPerDayScreenState createState() => _HoursPerDayScreenState();
}

class _HoursPerDayScreenState extends State<HoursPerDayScreen> {
  // Map pour stocker les heures de début et de fin pour chaque jour
  final Map<String, TimeOfDayRange> dayTimeRanges = {};

  @override
  void initState() {
    super.initState();
    // Initialiser les heures de chaque jour avec des valeurs par défaut
    for (var day in widget.selectedDays) {
      dayTimeRanges[day] = TimeOfDayRange(
        start: const TimeOfDay(hour: 8, minute: 0),
        end: const TimeOfDay(hour: 17, minute: 0),
      );
    }
  }

  // Fonction pour choisir une heure
  Future<TimeOfDay?> pickTime(BuildContext context, TimeOfDay initialTime) async {
    return showTimePicker(
      context: context,
      initialTime: initialTime,
    );
  }

  // Widget de ligne pour afficher les horaires
  Widget _buildTimePickerRow(String day, TimeOfDayRange range) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              day,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Heure de début
                GestureDetector(
                  onTap: () async {
                    final newTime = await pickTime(context, range.start);
                    if (newTime != null) {
                      setState(() {
                        dayTimeRanges[day] =
                            range.copyWith(start: newTime);
                      });
                    }
                  },
                  child: Row(
                    children: [
                      const Icon(Icons.access_time, color: Colors.blue),
                      const SizedBox(width: 8),
                      Text(
                        range.start.format(context),
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                const Text("à", style: TextStyle(fontSize: 16)),
                // Heure de fin
                GestureDetector(
                  onTap: () async {
                    final newTime = await pickTime(context, range.end);
                    if (newTime != null) {
                      setState(() {
                        dayTimeRanges[day] =
                            range.copyWith(end: newTime);
                      });
                    }
                  },
                  child: Row(
                    children: [
                      const Icon(Icons.access_time, color: Colors.blue),
                      const SizedBox(width: 8),
                      Text(
                        range.end.format(context),
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ajouter les heures"),
        backgroundColor: const Color.fromRGBO(65, 105, 225, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Définissez les horaires pour chaque jour sélectionné",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: widget.selectedDays.length,
                itemBuilder: (context, index) {
                  final day = widget.selectedDays[index];
                  return _buildTimePickerRow(day, dayTimeRanges[day]!);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Retourner les données ou les envoyer à une autre page
          Navigator.pop(context, dayTimeRanges);
        },
        label: const Text("Enregistrer"),
        icon: const Icon(Icons.save),
        backgroundColor: const Color.fromRGBO(65, 105, 225, 1),
      ),
    );
  }
}

// Classe pour gérer une plage horaire
class TimeOfDayRange {
  final TimeOfDay start;
  final TimeOfDay end;

  TimeOfDayRange({required this.start, required this.end});

  TimeOfDayRange copyWith({TimeOfDay? start, TimeOfDay? end}) {
    return TimeOfDayRange(
      start: start ?? this.start,
      end: end ?? this.end,
    );
  }
}
