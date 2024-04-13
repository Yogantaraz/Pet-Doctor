import 'package:flutter/material.dart';
import 'package:my_app/screens/API.dart';
import 'package:my_app/screens/dokter.dart';
import 'package:my_app/screens/jadwal_screen.dart';
import 'package:my_app/screens/profile_screen.dart';
import 'package:my_app/screens/settings_screen.dart';
import 'package:my_app/screens/splash_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedFeature =
      'Vaccine'; // Set default selected feature to 'Vaccine'

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    // Set default selected feature to 'Vaccine'
    _selectedFeature = 'Vaccine';
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Navigasi ke layar yang sesuai
    if (_selectedIndex == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else if (_selectedIndex == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfileScreen()),
      );
    } else if (_selectedIndex == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SettingsScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pet Doctor'),
      ),
      drawer: Drawer(
        child: Container(
          width:
              MediaQuery.of(context).size.width * 0.5, // Mengatur lebar drawer
          color: Colors.white, // Mengubah warna latar belakang drawer
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 70, left: 10),
                color: Colors.green,
                alignment: Alignment.centerLeft,
                child: Text(
                  'Menu',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20),
              ListTile(
                leading: Icon(Icons.assignment,
                    color: Colors.green), // Tambahkan ikon untuk setiap menu
                title: Text('Latihan API'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NewsScreen()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.calendar_today, color: Colors.green),
                title: Text('Latihan CRUD SQLite'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => JadwalScreen()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app,
                    color: Colors.red), // Icon untuk logout
                title: Text(
                  'Logout',
                  style: TextStyle(
                      color: Colors
                          .red), // Mengubah warna teks logout menjadi merah
                ),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SplashScreen()), // Mengarahkan ke splash screen saat logout
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar dan kolom pencarian
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'lib/assets/images/splash22.png',
                width: 300,
                height: 180,
                fit: BoxFit.cover,
              )
            ],
          ),
          SizedBox(height: 20), // Jarak antara gambar dan kolom pencarian
          // Kolom pencarian
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Find what you need',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 2.0),
                ),
                prefixIcon: Icon(Icons.search, color: Colors.green),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 2.0),
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              ),
            ),
          ),
          SizedBox(height: 20), // Jarak antara kolom pencarian dan list fitur
          // List fitur
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              children: [
                FeatureButton(
                    title: 'Vaccine',
                    selected: _selectedFeature == 'Vaccine',
                    onPressed: () => _onFeaturePressed('Vaccine')),
                SizedBox(width: 10),
                FeatureButton(
                    title: 'Surgery',
                    selected: _selectedFeature == 'Surgery',
                    onPressed: () => _onFeaturePressed('Surgery')),
                SizedBox(width: 10),
                FeatureButton(
                    title: 'SPA & Treatment',
                    selected: _selectedFeature == 'SPA & Treatment',
                    onPressed: () => _onFeaturePressed('SPA & Treatment')),
                SizedBox(width: 10),
                FeatureButton(
                    title: 'Consultation',
                    selected: _selectedFeature == 'Consultation',
                    onPressed: () => _onFeaturePressed('Consultation')),
              ],
            ),
          ),
          SizedBox(height: 20), // Jarak antara list fitur dan list dokter
          // List dokter
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DoctorDetailScreen(
                              name: 'Dr. Sarah',
                              service: 'Vaccine, Surgery',
                              distance: '10 km',
                              available: true)),
                    );
                  },
                  child: DoctorCard(
                      name: 'Dr. Sarah',
                      service: 'Vaccine, Surgery',
                      distance: '10 km',
                      available: true),
                ),
                SizedBox(height: 10),
                DoctorCard(
                    name: 'Dr. Jane Smith',
                    service: 'Vaccine, Surgery',
                    distance: '15 km',
                    available: true),
                SizedBox(height: 10),
                DoctorCard(
                    name: 'Dr. David Johnson',
                    service: 'Surgery, Surgery',
                    distance: '8 km',
                    available: false),
                SizedBox(height: 10),
                DoctorCard(
                    name: 'Dr. Emily Brown',
                    service: 'Vaccine, Surgery',
                    distance: '12 km',
                    available: true),
              ],
            ),
          ),
        ],
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
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onFeaturePressed(String feature) {
    setState(() {
      _selectedFeature = feature;
    });
  }
}

class FeatureButton extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onPressed;

  const FeatureButton(
      {Key? key,
      required this.title,
      required this.selected,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: selected ? Colors.green : Colors.grey.shade400,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          title,
          style: TextStyle(
              color: selected ? Colors.white : Color.fromARGB(255, 79, 78, 78)),
        ),
      ),
    );
  }
}

class DoctorCard extends StatelessWidget {
  final String name;
  final String service;
  final String distance;
  final bool available;

  const DoctorCard(
      {Key? key,
      required this.name,
      required this.service,
      required this.distance,
      required this.available})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          // Gambar dokter
          Container(
            width: 100, // Lebar gambar dokter
            height: 100, // Tinggi gambar dokter
            color:
                Colors.grey, // Ganti dengan warna atau gambar sesuai kebutuhan
            margin: EdgeInsets.only(right: 10),
            child: Image.asset(
              'lib/assets/images/doctor1.jpeg', // Sesuaikan dengan path gambar Anda
              fit: BoxFit.cover, // Sesuaikan dengan kebutuhan tampilan gambar
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Nama dokter
              Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              // Layanan dokter
              Text(
                'Service: $service',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 5),
              // Lokasi dan jarak
              Row(
                children: [
                  Icon(Icons.location_on, color: Colors.grey, size: 18),
                  SizedBox(width: 5),
                  Text(
                    'Distance: $distance',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(height: 5),
              // Ketersediaan dokter
              Text(
                'Available',
                style: TextStyle(color: available ? Colors.green : Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
