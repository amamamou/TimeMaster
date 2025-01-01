import 'package:flutter/material.dart';
import 'matiere.dart';
import 'matiere_service.dart';


class AjoutMatiereScreen extends StatefulWidget {
  @override
  _AjoutMatiereScreenState createState() => _AjoutMatiereScreenState();
}

class _AjoutMatiereScreenState extends State<AjoutMatiereScreen> {
  final MatiereService matiereService = MatiereService();
  final TextEditingController nomController = TextEditingController();
  List<Matiere> matieres = [];

  @override
  void initState() {
    super.initState();
    _loadMatieres();
  }

  Future<void> _loadMatieres() async {
    try {
      List<Matiere> loadedMatieres = await matiereService.fetchMatieres();
      setState(() {
        matieres = loadedMatieres;
      });
    } catch (e) {
      print('Erreur lors du chargement des matières : $e');
    }
  }

  Future<void> _addMatiere() async {
    String nom = nomController.text;
    if (nom.isNotEmpty) {
      try {
        await matiereService.addMatiere(Matiere(nom: nom));
        nomController.clear();
        _loadMatieres();
      } catch (e) {
        print('Erreur lors de l\'ajout de la matière : $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(65, 105, 225, 1),
        title: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'images/covers/loading-logo.png',
                width: 30,
                height: 30,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 10),
              Text(
                "TimeMaster",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(65, 105, 225, 1),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Image.asset(
                    'images/covers/loading-logo.png',
                    width: 30,
                    height: 30,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Ajouter une matière",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  SizedBox(width: 10),
                 
                  Image.asset(
                    'images/graphic-icons/books.png',
                    width: 60,
                    height: 80,
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Text(
              "Saisir le nom de la matière",
              style: TextStyle(
                color: Color.fromRGBO(65, 105, 225, 1),
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: nomController,
                    decoration: InputDecoration(
                      hintText: 'Nom de la matière',
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10), 
                ElevatedButton(
                  onPressed: _addMatiere,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(65, 105, 225, 1),
                    padding: EdgeInsets.symmetric(vertical: 15),
                    minimumSize: Size(80, 50), 
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "OK",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: matieres.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      children: [
                        Icon(Icons.circle, size: 10, color: Color.fromRGBO(65, 105, 225, 1)),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            matieres[index].nom,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
