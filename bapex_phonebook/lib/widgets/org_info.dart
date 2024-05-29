import 'package:flutter/material.dart';
import 'package:firebase_test/login/auth/auth_service.dart';
import 'package:firebase_test/widgets/search_page.dart';
import 'package:firebase_test/login/auth/login_screen.dart';
import 'package:firebase_test/login/widgets/button.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  goToLogin(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );

  @override
  Widget build(BuildContext context) {
    final auth = AuthService();
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.network(
                  height: 105,
                  'https://bapex.com.bd/sites/default/files/files/bapex.portal.gov.bd/page/c81bcc78_edc9_49ca_97e6_a5db526a4075/165905Bapex.jpg'), // Replace with your logo URL
            ),
            const SizedBox(height: 20),
            Center(
              child: Center(
                child: Text(
                  'Bangladesh Petroleum Exploration and Production Company Limited',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                'BAPEX Bhaban, 4 Kawran Bazar, Dhaka-1215',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            const SizedBox(height: 5),
            Center(
              child: Text(
                'secretary@bapex.com.bd',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            const SizedBox(height: 5),
            Center(
              child: Text(
                '+8802-55011788',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            const SizedBox(height: 20),
            FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SearchPage()),
                );
              },
              child: const Icon(Icons.search),
            ),
            const SizedBox(height: 20),
            CustomButton(
              label: "Sign Out",
              onPressed: () async {
                await auth.signout();
                goToLogin(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
