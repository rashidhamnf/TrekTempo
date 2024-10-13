import 'package:flutter/material.dart';

class NotificationPreferencesPage extends StatefulWidget {
  @override
  _NotificationPreferencesPageState createState() => _NotificationPreferencesPageState();
}

class _NotificationPreferencesPageState extends State<NotificationPreferencesPage> {
  bool _pushNotificationsEnabled = true; // Default value for push notifications
  bool _emailNotificationsEnabled = false; // Default value for email notifications

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Preferences'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Push Notifications
            SwitchListTile(
              title: Text('Enable Push Notifications'),
              value: _pushNotificationsEnabled,
              onChanged: (bool value) {
                setState(() {
                  _pushNotificationsEnabled = value;
                });
              },
            ),
            // Email Notifications
            SwitchListTile(
              title: Text('Enable Email Notifications'),
              value: _emailNotificationsEnabled,
              onChanged: (bool value) {
                setState(() {
                  _emailNotificationsEnabled = value;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle saving notification preferences
                _savePreferences();
              },
              child: Text('Save Preferences'),
            ),
          ],
        ),
      ),
    );
  }

  void _savePreferences() {
    // You can implement your save logic here, e.g., saving to a database or shared preferences.
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Preferences saved!')),
    );
  }
}
