import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: SafeArea(
        child: Center(
          child: Text('Home Page'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            await FirebaseAuth.instance.signOut();
            // Redirigir a la página de inicio de sesión
            Navigator.pushReplacementNamed(context, '/login');
          } catch (e) {
            print('Error al cerrar sesión: $e');
          }
        },
        child: Icon(Icons.logout_rounded),
      ),
    );
  }
}