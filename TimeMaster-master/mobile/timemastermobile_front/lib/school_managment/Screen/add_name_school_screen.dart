import 'package:flutter/material.dart';
import 'package:timemastermobile_front/school_managment/data/school_api.dart';
import 'package:timemastermobile_front/widgets/container_info.dart';

class AddNameCollageScreen extends StatefulWidget {
  const AddNameCollageScreen({super.key});

  @override
  _AddNameCollageScreenState createState() => _AddNameCollageScreenState();
}

class _AddNameCollageScreenState extends State<AddNameCollageScreen> {
  final _keyForm = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("images/logos/appbar-logo.png"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 15),
          const ContainerInfo(
            titleContainer: "Nom établissement",
            imageUrl: "images/graphic-icons/university.png",
          ),
          const SizedBox(height: 100),
          const Text(
            "Choose your option",
            style: TextStyle(
              color: Color.fromRGBO(65, 105, 225, 1),
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Form(
                key: _keyForm,
                child: TextFormField(
                  controller: _nameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter a name";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: "EX: ISET Sousse",
                    icon: Icon(Icons.school, color: Colors.grey),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          MaterialButton(
            onPressed: () async {
              if (_keyForm.currentState!.validate()) {
                try {
                  await ApiService().addSchool(_nameController.text);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('School added successfully!')),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Failed to add school: $e')),
                  );
                }
              }
            },
            color: const Color.fromRGBO(65, 105, 225, 1),
            padding: const EdgeInsets.symmetric(horizontal: 180, vertical: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 15,
            child: const Text(
              "Add Name",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/listSchoolName");
        },
        child: const Icon(Icons.edit_attributes_outlined),
        backgroundColor: const Color.fromRGBO(65, 105, 225, 1),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
