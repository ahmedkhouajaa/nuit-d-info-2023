import 'package:flutter/material.dart';
import 'package:planet/partenerslogin.dart';

import 'adminlogin.dart';
import 'loginuser.dart';

class RoleSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Role Selection'),backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             RoleCard(
              role: 'User',
              icon: Icons.person,
              onTap: () {
                 Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const UserrSigin()));
              },
            ),
           
            RoleCard(
              role: 'Partner',
              icon: Icons.business,
              
              onTap: () {
                 Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PartnersLogin()));
              },
            ),
             RoleCard(
              role: 'Admin',
              icon: Icons.security,
              onTap: () {
                 Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AdminLogin()));
              },
            ),
           
          ],
        ),
      ),
    );
  }
}

class RoleCard extends StatelessWidget {
  final String role;
  final IconData icon;
  final VoidCallback onTap;

  const RoleCard({
    required this.role,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 48,
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(height: 8),
              Text(
                role,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}