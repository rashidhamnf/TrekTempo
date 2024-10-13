import 'package:flutter/material.dart';
import 'package:travel_app/Pages/HomePage_Featurs/settingspage/AboutPage.dart'; // Create this page for About
import 'package:travel_app/Pages/HomePage_Featurs/Settingspage/ContactUsPage.dart'; // Create this page for Account Settings
import 'package:travel_app/Pages/HomePage_Featurs/Settingspage/SupportPage.dart'; // Create this page for Location Settings
import 'package:travel_app/Pages/HomePage_Featurs/Settingspage/NotificationPreferencesPage.dart';
import 'package:travel_app/Pages/HomePage_Featurs/Settingspage/SafetyTipsPage.dart'; // Import Notification Preferences


class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
     body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutPage()),
              );
            },
          ),
          ListTile(
          leading: Icon(Icons.contact_mail),
          title: Text('ContactUs'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ContactUsPage()),
            );
          },
        ),
          ListTile(
            leading: Icon(Icons.support),
            title: Text('Feedback & Support'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FeedbackSupportPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notification Preferences'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationPreferencesPage()),
              );
            },
          ),

          ListTile(
            leading: Icon(Icons.app_settings_alt),
            title: Text('Safety Tips'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SafetyTipsPage()),
              );
            },
          ),
          
        ],
      ),
    );
  }
}
    
