import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isDarkMode = false;

  void _toggleDarkMode(bool? value) async {
    setState(() {
      _isDarkMode = value ?? false;
    });

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('darkMode', _isDarkMode);
  }

  Future<void> _signOut() async {
    
    Navigator.pushReplacementNamed(context, '/login');
  }

  Future<void> _reportProblem() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'hadiessam92@gmail.com',
      query: 'subject=Report Problem',
    );
    await launch(emailLaunchUri.toString());
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, '/home');
        return false; // Prevent default back navigation
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Appearance', style: TextStyle(fontSize: 18)),
              SwitchListTile(
                title: const Text('Dark Mode'),
                value: _isDarkMode,
                onChanged: _toggleDarkMode,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _signOut,
                child: const Text('Sign Out'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _reportProblem,
                child: const Text('Report Problem'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
