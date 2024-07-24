import 'package:flutter/material.dart';

class MyDropdownButton extends StatefulWidget {
  final Function(String?) onChanged;

  MyDropdownButton({required this.onChanged});

  @override
  _MyDropdownButtonState createState() => _MyDropdownButtonState();
}

class _MyDropdownButtonState extends State<MyDropdownButton> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.97,
      height: 60,
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: DropdownButton<String>(
          value: _selectedValue,
          items: [
            DropdownMenuItem(
              child: Text("Hombre"),
              value: "Hombre",
            ),
            DropdownMenuItem(
              child: Text("Mujer"),
              value: "Mujer",
            ),
            DropdownMenuItem(
              child: Text("Otro"),
              value: "Otro",
            ),
          ],
          onChanged: (value) {
            setState(() {
              _selectedValue = value;
            });
            widget.onChanged(value);
          },
          hint: const Text("Selecciona un rol"),
        ),
      ),
    );
  }
}