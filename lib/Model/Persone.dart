class Persone{

  String nombre;
  String apellidos;
  String correo;
  String password;
  String nameUser;
  String sexo;

  Persone({required this.nombre, required this.apellidos, required this.correo, required this.password, required this.nameUser, required this.sexo});

  Map<String, dynamic> toMap(){
    return {
      "nombre": nombre,
      "apellidos": apellidos,
      "correo": correo,
      "password": password,
      "nameUser": nameUser,
      "sexo": sexo
    };
  }

}