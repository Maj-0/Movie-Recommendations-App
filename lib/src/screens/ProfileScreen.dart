import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:untitled8/src/screens/settings_screen.dart';

import 'auth_screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String userEmail = '';
  TextEditingController _bioController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserEmail();
  }

  void _loadUserEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userEmail = prefs.getString('email') ?? 'No email set';
    });
  }

  @override
  void dispose() {
    _bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Color(0xFF2C2C34);
    Color buttonColor = Color(0xFF6A6A80);
    Color textColor = Colors.white;
    Color iconColor = Colors.white70;

    TextStyle textStyle = TextStyle(color: textColor, fontSize: 18);
    TextStyle headingStyle =
        TextStyle(color: textColor, fontSize: 24, fontWeight: FontWeight.bold);

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: textStyle),
        backgroundColor: backgroundColor,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
            color: iconColor,
          ),
        ],
      ),
      backgroundColor: backgroundColor,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage:
                    NetworkImage('https://via.placeholder.com/150'),
                backgroundColor: Colors.transparent,
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text('Username', style: headingStyle),
            ),
            SizedBox(height: 30),
            Text('Account', style: headingStyle),
            ListTile(
              leading: Icon(Icons.email, color: iconColor),
              title: Text('Email', style: textStyle),
              subtitle: Text(userEmail, style: textStyle),
            ),
            ListTile(
              leading: Icon(Icons.phone, color: iconColor),
              title: Text('Phone', style: textStyle),
              subtitle: Text('+1234567890', style: textStyle),
            ),
            ListTile(
              leading: Icon(Icons.person, color: iconColor),
              title: Text('About Me', style: textStyle),
              subtitle: TextFormField(
                controller: _bioController,
                style: textStyle,
                decoration: InputDecoration(
                  hintText: 'Short bio or description here',
                  border: InputBorder.none,
                  hintStyle: textStyle,
                ),
                maxLines: null,
              ),
            ),
            Divider(color: textColor.withOpacity(0.3)),
            Text('General', style: headingStyle),
            Divider(color: textColor.withOpacity(0.3)),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => AuthScreen()),
                    (Route<dynamic> route) => false,
                  );
                },
                child: Text('Sign Out', style: textStyle),
                style: ElevatedButton.styleFrom(
                  primary: buttonColor,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
