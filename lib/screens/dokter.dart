import 'package:flutter/material.dart';

class DoctorDetailScreen extends StatelessWidget {
  final String name;
  final String service;
  final String distance;
  final bool available;

  const DoctorDetailScreen({Key? key, required this.name, required this.service, required this.distance, required this.available}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor Details'),
        backgroundColor: Colors.green, // Set the AppBar background color to green
        elevation: 0, // Remove the shadow below the AppBar
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Doctor image
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 200,
              decoration: BoxDecoration(
                color: Colors.green[200], // Set background color for the doctor image
                image: DecorationImage(
                  image: AssetImage('lib/assets/images/doctor1.jpeg'), // Replace with the actual image path
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Doctor information
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Doctor name
                  _buildInfoRow('Doctor Name:', name),
                  SizedBox(height: 10),
                  // Doctor service
                  _buildInfoRow('Service:', service),
                  SizedBox(height: 10),
                  // Doctor distance
                  _buildInfoRow('Distance:', distance),
                  SizedBox(height: 10),
                  // Doctor availability
                  _buildInfoRow('Availability:', available ? 'Available' : 'Not Available'),
                  SizedBox(height: 20),
                  // Doctor description
                  _buildInfoRow('Doctor Description:', 'Dr. Sarah is a highly skilled veterinarian with extensive experience in caring for a wide range of animals. With a passion for animal welfare and a deep understanding of veterinary medicine, Dr. Sarah is dedicated to providing the best possible care for every patient. From routine check-ups to complex surgical procedures, Dr. Sarah expertise and compassionate approach make him a trusted and valued member of the veterinary community. Whether its diagnosing and treating illnesses, performing surgeries, or offering nutritional advice, Dr. Sarah is committed to ensuring the health and well-being of every animal under his care. With a strong emphasis on preventive medicine and client education, Dr. Sarah strives to empower pet owners to make informed decisions about their pets health. Trustworthy, reliable, and caring, Dr. Sarah is the veterinarian you can rely on to keep your furry friends happy and healthy.', isDescription: true),
                  SizedBox(height: 20),
                  // Button to schedule a meeting with the doctor
                  ElevatedButton.icon(
                    onPressed: () {
                      // Add logic to schedule a meeting with the doctor here
                    },
                    icon: Icon(Icons.calendar_today), // Add an icon to the button
                    label: Text('Schedule Meeting with Doctor'), // Set the button text
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green, // Set button color to green
                      textStyle: TextStyle(color:Colors.black)), // Set text color to white
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method to build information row
  Widget _buildInfoRow(String label, String value, {bool isDescription = false}) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isDescription ? Colors.green[100] : null, // Set background color for the description
        borderRadius: BorderRadius.circular(isDescription ? 10 : 0), // Set border radius for the description
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            value,
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
