import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_test/widgets/employee_details.dart';

class EmployeeListByDepartmentPage extends StatelessWidget {
  final String department;

  const EmployeeListByDepartmentPage({required this.department, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Employees in $department')),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('employees')
            .where('department', isEqualTo: department)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
    
          var employees = snapshot.data!.docs;
    
          return ListView.builder(
            itemCount: employees.length,
            itemBuilder: (context, index) {
              var employee = employees[index];
              return ListTile(
                title: Text(employee['name']),
                subtitle: Text(employee['email']),
                trailing: Text(employee['department']),
                leading: employee['picture'] != null
                    ? Image.network(employee['picture'], width: 50, height: 50)
                    : const Icon(Icons.person),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EmployeeDetailsPage(employeeRef: employee.reference),
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