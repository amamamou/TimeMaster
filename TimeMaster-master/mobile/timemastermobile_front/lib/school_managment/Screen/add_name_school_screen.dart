import 'package:flutter/material.dart';
import 'package:timemastermobile_front/school_managment/data/school_api.dart';
import 'package:timemastermobile_front/widgets/container_info.dart';
import 'package:http/http.dart' as http ;

class AddNameCollageScreen extends StatefulWidget {
  const AddNameCollageScreen({super.key});

  @override
  _AddNameCollageScreenState createState() => _AddNameCollageScreenState();
}

class _AddNameCollageScreenState extends State<AddNameCollageScreen> {
  final _keyForm = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("images/logos/appbar-logo.png"),
        backgroundColor: const Color.fromRGBO(65, 105, 225, 1),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 15),
            const ContainerInfo(
              titleContainer: "Nom établissement",
              imageUrl: "images/graphic-icons/university.png",
            ),
            const SizedBox(height: 50),
            const Text(
              "Please enter your School Data!",
              style: TextStyle(
                color: Color.fromRGBO(65, 105, 225, 1),
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _keyForm,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _nameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter a school name";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            labelText: "School Name",
                            prefixIcon: Icon(Icons.school),
                          ),
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          controller: _addressController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter an address";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            labelText: "Address",
                            prefixIcon: Icon(Icons.location_on),
                          ),
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          controller: _phoneController,
                          validator: (value) {
                            if (value!.isEmpty || value.length != 8) {
                              return "Please enter a valid phone number";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            labelText: "Phone",
                            prefixIcon: Icon(Icons.phone),
                          ),
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          controller: _emailController,
                          validator: (value) {
                            final emailRegex =
                                RegExp(r'^[^@]+@[^@]+\.[^@]+');
                            if (value!.isEmpty || !emailRegex.hasMatch(value)) {
                              return "Please enter a valid email";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            labelText: "Email",
                            prefixIcon: Icon(Icons.email),
                          ),
                        ),
                      ],
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
                    // Example API call, adjust to match your API requirements
                    await ApiService().addSchool(
                      name: _nameController.text,
                      address: _addressController.text,
                      phone: _phoneController.text,
                      email: _emailController.text,
                    );
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
              padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 15,
              child: const Text(
                "Add School Data",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/listSchoolName");
        },
        child: const Icon(Icons.list),
        backgroundColor: const Color.fromRGBO(65, 105, 225, 1),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
