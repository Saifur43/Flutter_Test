import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_test/widgets/employee_list_by_department.dart';


class DepartmentPage extends StatelessWidget {
  final String division;

  const DepartmentPage({required this.division, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Departments in $division')),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('employees')
            .where('division', isEqualTo: division)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          // Extract unique departments
          var departments = <String>{};
          for (var doc in snapshot.data!.docs) {
            departments.add(doc['department']);
          }

          return ListView.builder(
            itemCount: departments.length,
            itemBuilder: (context, index) {
              var department = departments.elementAt(index);
              return ListTile(
                title: Text(department),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EmployeeListByDepartmentPage(department: department),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}