import 'package:flutter/material.dart';
import 'package:my_app/screens/home_screen.dart';
import 'package:my_app/screens/settings_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedIndex = 1; // Set index 1 untuk item "Profile"

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.green, // Ubah warna app bar menjadi hijau
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('lib/assets/images/profile.jpeg'), // Ganti dengan path gambar profil Anda
            ),
            SizedBox(height: 20),
            Text(
              'Miauw',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Kitten Customer',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.email, color: Colors.green),
              title: Text(
                'Miaw.miaw@gmail.com',
                style: TextStyle(fontSize: 16),
              ),
            ),
            ListTile(
              leading: Icon(Icons.phone, color: Colors.green),
              title: Text(
                '+62 8579-456-789',
                style: TextStyle(fontSize: 16),
              ),
            ),
            ListTile(
              leading: Icon(Icons.location_on, color: Colors.green),
              title: Text(
                'Bali, Indonesia',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
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
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex, // Tentukan item yang aktif
        selectedItemColor: Colors.green, // Tentukan warna item yang aktif
        onTap: _onItemTapped, // Panggil fungsi saat item navigasi ditekan
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigasi sesuai dengan indeks yang dipilih
    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else if (index == 2) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SettingsScreen()),
      );
    }
  }
}
