import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_test/widgets/employee_details.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String query = '';
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: searchController,
              decoration: const InputDecoration(
                hintText: 'Search by name',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  query = value;
                });
              },
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: (query.isEmpty)
                  ? FirebaseFirestore.instance
                      .collection('employees')
                      .orderBy('name')
                      .snapshots()
                  : FirebaseFirestore.instance
                      .collection('employees')
                      .where('name', isGreaterThanOrEqualTo: query)
                      .where('name', isLessThanOrEqualTo: '$query\uf8ff')
                      .orderBy('name')
                      .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                var employees = snapshot.data!.docs;

                if (employees.isEmpty) {
                  return const Center(child: Text('No results found'));
                }

                return ListView.builder(
                  itemCount: employees.length,
                  itemBuilder: (context, index) {
                    var employee = employees[index];
                    return ListTile(
                      title: Text(employee['name']),
                      subtitle: Text(employee['email']),
                      trailing: Text(employee['department']),
                      leading: employee['picture'] != null
                          ? Image.network(employee['picture'],
                              width: 50, height: 50)
                          : const Icon(Icons.person),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EmployeeDetailsPage(
                                employeeRef: employee.reference),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
