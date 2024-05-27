import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class EmployeeDetailsPage extends StatelessWidget {
  final DocumentReference employeeRef;

  const EmployeeDetailsPage({required this.employeeRef, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Employee Details')),
      body: FutureBuilder<DocumentSnapshot>(
        future: employeeRef.get(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          var employee = snapshot.data!.data() as Map<String, dynamic>;

          return Padding(
            padding: const EdgeInsets.all(40.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 10,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: employee['picture'] != null
                          ? Image.network(employee['picture'], width: 150, height: 190, fit: BoxFit.cover)
                          : const Icon(Icons.person, size: 160),
                    ),
                  ),
                  ListTile(
                    title: Center(child: Text(employee['name'], style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
                    subtitle: Center(child: Text(employee['email'], style: const TextStyle(fontSize: 16))),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('ID: ${employee['id']}', style: const TextStyle(fontSize: 16)),
                        const SizedBox(height: 8.0),
                        Text('Department: ${employee['department']}', style: const TextStyle(fontSize: 16)),
                        const SizedBox(height: 8.0),
                        Text('Division: ${employee['division']}', style: const TextStyle(fontSize: 16)),
                        const SizedBox(height: 8.0),
                        Text('Phone: ${employee['phone_number']}', style: const TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16.0),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
