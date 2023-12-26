import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  Color backgroundColor = Color(0xFF2C2C34);
  Color textColor = Colors.white;
  Color iconColor = Colors.white70;

  TextStyle textStyle = TextStyle(color: Colors.white, fontSize: 18);
  TextStyle headingStyle =
      TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold);
  TextStyle subtitleStyle = TextStyle(color: Colors.grey, fontSize: 14);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings', style: textStyle),
        backgroundColor: backgroundColor,
      ),
      backgroundColor: backgroundColor,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            Text('General Settings', style: headingStyle),
            ListTile(
              leading: Icon(Icons.notifications, color: iconColor),
              title: Text('Notifications', style: textStyle),
              subtitle:
                  Text('Manage notification settings', style: subtitleStyle),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.language, color: iconColor),
              title: Text('Language', style: textStyle),
              subtitle:
                  Text('Select your preferred language', style: subtitleStyle),
              onTap: () {},
            ),
            Divider(color: textColor.withOpacity(0.3)),
            Text('Account Settings', style: headingStyle),
            ListTile(
              leading: Icon(Icons.security, color: iconColor),
              title: Text('Security', style: textStyle),
              subtitle: Text('Change password and security options',
                  style: subtitleStyle),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.privacy_tip, color: iconColor),
              title: Text('Privacy', style: textStyle),
              subtitle: Text('Adjust privacy settings', style: subtitleStyle),
              onTap: () {},
            ),
            Divider(color: textColor.withOpacity(0.3)),
            Text('About', style: headingStyle),
            ListTile(
              leading: Icon(Icons.info, color: iconColor),
              title: Text('About Us', style: textStyle),
              subtitle: Text('Information about the app or company',
                  style: subtitleStyle),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.help, color: iconColor),
              title: Text('Help & Support', style: textStyle),
              subtitle: Text('Get help and support', style: subtitleStyle),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
