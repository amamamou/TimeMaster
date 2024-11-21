import 'package:flutter/material.dart';
import 'package:timemastermobile_front/school_managment/data/school_api.dart';
import 'package:timemastermobile_front/school_managment/data/school_model.dart';

class UpdateSchoolScreen extends StatefulWidget {
  final School school;

  UpdateSchoolScreen({required this.school});

  @override
  _UpdateSchoolScreenState createState() => _UpdateSchoolScreenState();
}

class _UpdateSchoolScreenState extends State<UpdateSchoolScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _addressController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    // Initialize the controllers with the current school data
    _nameController = TextEditingController(text: widget.school.name);
    _addressController = TextEditingController(text: widget.school.address);
    _phoneController = TextEditingController(text: widget.school.phone);
    _emailController = TextEditingController(text: widget.school.email);
  }

  @override
  void dispose() {
    // Dispose the controllers when the screen is disposed
    _nameController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _updateSchool() async {
    if (_formKey.currentState!.validate()) {
      try {
        // Call the update API to update the school details
        await ApiService().updateSchool(
          widget.school.id,
          _nameController.text,
          _addressController.text,
          _phoneController.text,
          _emailController.text,
        );
        // Display a success message and pop the screen
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('School updated successfully!')));
        Navigator.pop(context, true); // Return true to indicate a successful update
      } catch (e) {
        // Show an error message if the update fails
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to update school: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update School"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'School Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(labelText: 'Address'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an address';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: 'Phone Number'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a phone number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _updateSchool,
                child: Text('Update School'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
