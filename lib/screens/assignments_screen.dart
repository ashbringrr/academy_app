import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_drawer.dart' as custom_drawer_widget;

class AssignmentsScreen extends StatelessWidget {
  const AssignmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, '/home');
        return false; 
      },
      child: const Scaffold(
        appBar: CustomAppBar(
          title: 'Assignments',
        ),
        drawer: custom_drawer_widget.CustomDrawer(),
        body: Center(
          child: Text('Assignments Screen - Coming Soon'),
        ),
      ),
    );
  }
}
