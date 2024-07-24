import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:escolar/Model/Persone.dart';
import 'package:escolar/Router/MyRouter.dart';
import 'package:firebase_auth/firebase_auth.dart';


class UserService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> register(Persone persone) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: persone.correo,
        password: persone.password,
      );

      // Obtener el ID del usuario
      String userId = userCredential.user?.uid ?? '';

      await firestore.collection("users").add({
        "nombre": persone.nombre,
        "apellido": persone.apellidos,
        "sexo": persone.sexo,
        "nameUser": persone.nameUser,
        "userId": userId,
      });
      print("Usuario registrado");
    } catch (e) {
      print("Error al registrar usuario: $e");
    }
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> login(String correo, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: correo,
        password: password,
      );
      Navigator.pushReplacementNamed(context, ROUTE_HOME);
    } catch (e) {
      print("Error al iniciar sesión: $e");
    }
  }
}