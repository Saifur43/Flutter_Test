import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_test/widgets/department_page.dart';

class DivisionPage extends StatelessWidget {
  const DivisionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Divisions')),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('employees').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          // Extract unique divisions
          var divisions = <String>{};
          for (var doc in snapshot.data!.docs) {
            divisions.add(doc['division']);
          }

          return ListView.builder(
            itemCount: divisions.length,
            itemBuilder: (context, index) {
              var division = divisions.elementAt(index);
              return ListTile(
                title: Text(division),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DepartmentPage(division: division),
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

