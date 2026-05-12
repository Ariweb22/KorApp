import 'package:shared_preferences/shared_preferences.dart';

class UsuarioData {

  // GUARDAR USUARIO
  static Future<void> guardarUsuario(
    String correo,
    String password,
  ) async {

    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(
      'correo',
      correo,
    );

    await prefs.setString(
      'password',
      password,
    );

    print("USUARIO GUARDADO");
    print(correo);
    print(password);
  }

  // OBTENER CORREO
  static Future<String> obtenerCorreo() async {

    final prefs = await SharedPreferences.getInstance();

    String correo =
        prefs.getString('correo') ?? '';

    print("CORREO OBTENIDO:");
    print(correo);

    return correo;
  }

  // OBTENER PASSWORD
  static Future<String> obtenerPassword() async {

    final prefs = await SharedPreferences.getInstance();

    String password =
        prefs.getString('password') ?? '';

    print("PASSWORD OBTENIDO:");
    print(password);

    return password;
  }
}