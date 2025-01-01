import 'package:flutter/material.dart';
import 'package:timemastermobile_front/Admin/school_managment/data/school_api.dart';
import 'package:timemastermobile_front/Admin/school_managment/data/school_model.dart';
import 'package:timemastermobile_front/Admin/school_managment/addSchool/update_school_screen.dart';

class SchoolListScreen extends StatefulWidget {
  @override
  _SchoolListScreenState createState() => _SchoolListScreenState();
}

class _SchoolListScreenState extends State<SchoolListScreen> {
  late Future<List<School>> _schoolsFuture;

  @override
  void initState() {
    super.initState();
    _loadSchools();
  }

  void _loadSchools() {
    setState(() {
      _schoolsFuture = ApiService().fetchSchools(); // Fetch schools from API
    });
  }

  void _deleteSchool(int id) async {
    try {
      // Call the delete API here (you'll need to implement it in `ApiService`)
      await ApiService().deleteSchool(id);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('School deleted successfully!'),
      ));
      _loadSchools(); // Refresh the list after deletion
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Failed to delete school: $e'),
      ));
    }
  }

  void _updateSchool(School school) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UpdateSchoolScreen(school: school),
      ),
    ).then((value) {
      if (value == true) {
        _loadSchools(); // Refresh the list after update
      }
    });
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

          final schools = snapshot.data!;
          return ListView.builder(
            itemCount: schools.length,
            itemBuilder: (context, index) {
              final school = schools[index];
              return Card(
                elevation: 4,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text(school.id.toString()),
                    backgroundColor: Colors.blueAccent,
                  ),
                  title: Text(school.name, style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Address: ${school.address}"),
                      Text("Phone: ${school.phone}"),
                      Text("Email: ${school.email}"),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit, color: Colors.orange),
                        onPressed: () => _updateSchool(school), // Navigate to update screen
                      ),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _deleteSchool(school.id), // Trigger delete
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addSchool').then((value) {
            if (value == true) {
              _loadSchools(); // Refresh the list after adding
            }
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
