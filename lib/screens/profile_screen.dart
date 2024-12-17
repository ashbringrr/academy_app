import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_drawer.dart' as custom_drawer_widget;

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, '/home');
        return false; 
      },
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'Profile',
        ),
        drawer: const custom_drawer_widget.CustomDrawer(),
        body: Center(
          child: Text('Profile Screen - Coming Soon'),
        ),
      ),
    );
  }
}
