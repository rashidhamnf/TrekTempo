import 'package:flutter/material.dart';
import 'package:travel_app/Pages/HomePage_Featurs/TripPlanning/TripPlan_pages/Trip_Type.dart';
import 'package:travel_app/Pages/HomePage_Featurs/Components/Button.dart';


class TripPersonTypePage extends StatefulWidget {
  final String endPoint;
  final String budget;
  const TripPersonTypePage({Key? key, required this.endPoint, required this.budget}) : super(key: key);

  @override
  _TripPersonTypePageState createState() => _TripPersonTypePageState();
}

class _TripPersonTypePageState extends State<TripPersonTypePage> {
 
  String _tripPersonType = 'Solo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('  ')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Select Trip Person Type',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  _buildRadioCard('Solo', 'Solo', Icons.person, Colors.blue),
                  _buildRadioCard('Couple', 'Couple', Icons.favorite, Colors.pink),
                  _buildRadioCard('Family', 'Family', Icons.group, Colors.orange),
                  _buildRadioCard('Friends', 'Friends', Icons.people, Colors.green),
                  const SizedBox(height: 16),
                   Button(
                text: 'Next',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TripTypePage(endPoint: widget.endPoint, budget: widget.budget, tripPersonType: _tripPersonType)),
                  );
                },
              ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build radio button with icon
  Widget _buildRadioCard(String value, String label, IconData icon, Color color) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Icon(icon, color: color),
            const SizedBox(width: 15),
            Expanded(
              child: Text(label, style: TextStyle(fontSize: 16)),
            ),
            Radio(
              value: value,
              groupValue: _tripPersonType,
              onChanged: (newValue) {
                setState(() {
                  _tripPersonType = newValue.toString();
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}