import 'package:flutter/material.dart';
import 'package:my_app/screens/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('lib/assets/images/petsplash.png'),
          Positioned(
            left: 0,
            right: 0,
            bottom: MediaQuery.of(context).size.height * 0.02, // 2% dari tinggi layar
            child: Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  side: BorderSide(width: 1, color: Colors.black), // Garis pinggir hitam tipis
                ),
                onPressed: () {
                  // Navigasi ke halaman login_screen ketika tombol ditekan
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()), // Gunakan kelas LoginScreen dari file login_screen.dart
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Mengatur padding tombol
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.green[900]), // Warna teks hijau tua
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


