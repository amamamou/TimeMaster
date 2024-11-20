import 'package:flutter/material.dart';
import 'package:timemastermobile_front/school_managment/data/school_api.dart';
import 'package:timemastermobile_front/school_managment/data/school_model.dart';


class SchoolListScreen extends StatefulWidget {
  @override
  _SchoolListScreenState createState() => _SchoolListScreenState();
}

class _SchoolListScreenState extends State<SchoolListScreen> {
  late Future<List<School>> _schoolsFuture;

  @override
  void initState() {
    super.initState();
    _schoolsFuture = ApiService().fetchSchools(); // Fetch schools when the screen loads
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("School List"),
      ),
      body: FutureBuilder<List<School>>(
        future: _schoolsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Failed to load schools: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No schools found"));
          }

          // If data is successfully loaded
          final schools = snapshot.data!;
          return ListView.builder(
            itemCount: schools.length,
            itemBuilder: (context, index) {
              final school = schools[index];
              return ListTile(
                title: Text(school.name),
                subtitle: Text("ID: ${school.id}"),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addNameSchool'); // Navigate to add school screen
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
