import 'package:escolar/Router/MyRouter.dart';
import 'package:flutter/material.dart';
import 'package:escolar/Components/MyButton.dart';
import 'package:escolar/Firebase/UserService.dart';
import '../Model/Persone.dart';
import '../Components/MyDropdownButton.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? _selectedValue;
  String? _validationResult;
  TextEditingController _nombreController = TextEditingController();
  TextEditingController _apellidosController = TextEditingController();
  TextEditingController _correoController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameUserController = TextEditingController();

  TextEditingController _passwordctrl = TextEditingController();

  Widget _buildTextField(
      String placeholder, String tipo, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        obscureText: tipo != "T",
        decoration: InputDecoration(labelText: placeholder),
      ),
    );
  }

  void _onDropdownChanged(String? value) {
    setState(() {
      _selectedValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {

    final _formKey = GlobalKey<FormState>();

    
    return Scaffold(
      appBar: AppBar(title: Text("Registro")),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _passwordctrl,
                decoration: const InputDecoration(
                  labelText: 'Ingrese texto',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El campo no puede estar vacío';
                  } else if (value.length < 6) {
                    return 'El texto debe tener al menos 6 caracteres';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      _validationResult = 'Formulario válido';
                    });
                  } else {
                    setState(() {
                      _validationResult = 'Formulario no válido';
                    });
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(_validationResult!)),
                  );
                },
                child: Text('Validar'),
              ),

              /* _buildTextField("Nombre", "T", _nombreController),
            _buildTextField("Apellidos", "T", _apellidosController),
            _buildTextField("Correo", "T", _correoController),
            _buildTextField("Nombre Usuario", "T", _nameUserController),
            _buildTextField("Password", "P", _passwordController),
            MyDropdownButton(onChanged: _onDropdownChanged),
            MyButton(title: "Registrarse", onPressed: _onPressed), */
            ],
          ),
        ),
      ),
    );
  }

  void _onPressed() {
    if (_selectedValue == null) {
      print("Por favor, selecciona un rol");
    }

    Persone persona = Persone(
      nombre: _nombreController.text,
      apellidos: _apellidosController.text,
      correo: _correoController.text,
      password: _passwordController.text,
      nameUser: _nameUserController.text,
      sexo: _selectedValue!,
    );

    _nombreController.clear();
    _apellidosController.clear();
    _correoController.clear();
    _passwordController.clear();
    _nameUserController.clear();
    _selectedValue = null;

    UserService userService = UserService();
    userService.register(persona);
    Navigator.pushNamed(context, ROUTE_HOME);
  }
}
