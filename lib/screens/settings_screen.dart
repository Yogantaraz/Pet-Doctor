import 'package:flutter/material.dart';
import 'package:my_app/screens/profile_screen.dart';
import 'package:my_app/screens/home_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              ListTile(
                leading: Icon(Icons.notifications, color: Colors.green),
                title: Text('Notifications'),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.language, color: Colors.green),
                title: Text('Language'),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.security, color: Colors.green),
                title: Text('Security'),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.privacy_tip, color: Colors.green),
                title: Text('Privacy'),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.help, color: Colors.green),
                title: Text('Help & Support'),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.feedback, color: Colors.green),
                title: Text('Feedback'),
                onTap: () {},
              ),
              Divider(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: Colors.green),
            label: 'Settings',
          ),
        ],
        selectedItemColor: Colors.green,
        currentIndex: 2, // Tetapkan currentIndex ke 2 untuk item "Settings"
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          }
        },
      ),
    );
  }
}
