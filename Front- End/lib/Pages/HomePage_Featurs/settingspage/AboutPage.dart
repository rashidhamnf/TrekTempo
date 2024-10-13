import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About TrekTempo'),
        backgroundColor: Colors.teal, // Custom AppBar color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Section 1: Introduction
            Text(
              'Welcome to TrekTempo!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.teal, // Main theme color
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10), // Spacing
            Text(
              'TrekTempo is your ultimate travel companion, designed to simplify and enhance your travel experiences across Sri Lanka. Whether you\'re traveling solo or with a group, our app provides a comprehensive platform to plan, organize, and enjoy your trips seamlessly.',
              style: TextStyle(fontSize: 16, height: 1.5),
              textAlign: TextAlign.justify,
            ),
            
            // Spacing between sections
            SizedBox(height: 20),

            // Section 2: Key Features
            Text(
              'Key Features',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            SizedBox(height: 10),
            buildFeatureItem(
              icon: Icons.location_on,
              title: 'Personalized Itineraries',
              description: 'Create customized trip plans based on your preferences.',
            ),
            buildFeatureItem(
              icon: Icons.update,
              title: 'Real-Time Travel Updates',
              description: 'Stay updated with live information about events, transportation, and weather.',
            ),
            buildFeatureItem(
              icon: Icons.attach_money,
              title: 'Budget Planning',
              description: 'Track your expenses and plan your trips within your budget.',
            ),
            buildFeatureItem(
              icon: Icons.warning,
              title: 'Safety Alerts',
              description: 'Receive timely alerts and safety tips for your travels.',
            ),
            buildFeatureItem(
              icon: Icons.emoji_events,
              title: 'Local Experiences',
              description: 'Discover cultural activities, local adventures, and hidden gems.',
            ),
            
            SizedBox(height: 20),

            // Section 3: Our Mission
            Text(
              'Our Mission',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Our mission is to make travel stress-free and enjoyable for everyone. We aim to empower travelers with the right tools to explore new destinations confidently while promoting sustainable tourism and cultural immersion.',
              style: TextStyle(fontSize: 16, height: 1.5),
              textAlign: TextAlign.justify,
            ),
            
            SizedBox(height: 20),

            // Section 4: Why Choose Us
            Text(
              'Why Choose TrekTempo?',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'TrekTempo offers a unique blend of personalized trip planning, real-time updates, and community-driven content. With features designed to keep you informed and connected, TrekTempo ensures that every journey is memorable, safe, and within budget.',
              style: TextStyle(fontSize: 16, height: 1.5),
              textAlign: TextAlign.justify,
            ),
            
            SizedBox(height: 20),

            // Section 5: Community Call
            Text(
              'Join the TrekTempo Community',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Be part of a growing community of explorers! Share your experiences, contribute to our platform, and help fellow travelers discover new places. At TrekTempo, we believe in building meaningful connections through travel.',
              style: TextStyle(fontSize: 16, height: 1.5),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }

  // Custom widget for building the feature items
  Widget buildFeatureItem({required IconData icon, required String title, required String description}) {
    return ListTile(
      leading: Icon(icon, color: Colors.teal),
      title: Text(
        title, // Corrected to use the actual 'title' variable
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(description), // Corrected to use the actual 'description' variable
    );
  }
}
