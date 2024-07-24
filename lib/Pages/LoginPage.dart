import 'package:escolar/Firebase/UserService.dart';
import 'package:escolar/Router/MyRouter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatelessWidget {

  TextEditingController _correoController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Widget _buildLogo(){
    return Image.asset("", width: 120, height: 120,);
  }

 Widget _buildTextField(String placeholder, String tipo, TextEditingController controller){ 
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: placeholder
      ),
      obscureText: tipo != "T" ? true : false,
    ),
  );
}

  Widget _buildButton(context){
    return ElevatedButton(
      onPressed: (){
        UserService us = UserService();        
        us.login(_correoController.text, _correoController.text, context);
      },
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      child: const Text('Iniciar Sesión', style: TextStyle(color: Colors.black, fontSize: 16), ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.blue[400],
          child: Column(
            children: [
              _buildTextField('Email o Usuario', 'T', _correoController),
              const SizedBox(height: 8,),
              _buildTextField('Contraseña', 'P', _passwordController),
              const SizedBox(height: 32,),
              _buildButton(context),
              const SizedBox(height: 52, child: Text("O", style: TextStyle(fontSize: 20, color: Colors.white),),),
              TextButton(onPressed: (){Navigator.pushNamed(context, ROUTE_REGISTER);}, child: const Text("Registrarse", style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),))
            ],
          ),
        ),
      ),
    );
  }
}
