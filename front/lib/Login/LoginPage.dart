import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../view/screens/home_screen.dart';
import 'Register.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  Future<void> _login(String username, String password, BuildContext context) async {
    final url = Uri.parse('http://192.168.221.179:3000/loginsoap'); //consulto a la url del backend

    final response = await http.post(
      url,//hago un post a la url
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{ //le paso como parametro el username y el password
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {             // si la respuesta es correcta (200)
      final Map<String, dynamic> responseData = json.decode(response.body);
      final loginResult = responseData['login_soap_response']['login_soap_result']; //se almacena el token

      if (loginResult is String) {
        // Verificar el resultado del login
        if (loginResult.startsWith('eyJ')) {
          // Login exitoso, guardar token
          final storage = FlutterSecureStorage();     //lo guardo en un almacenamiento seguro de FLUTTER
          await storage.write(key: 'accessToken', value: loginResult);

          Get.to(HomePage());
        } else if (loginResult == 'User not found') { //en caso de que no sea correcta
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Error de inicio de sesión'), //codigo de error
                content: Text('Usuario no encontrado.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        } else if (loginResult == 'Incorrect password') {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Error de inicio de sesión'), //otro codigo de error
                content: Text('Contraseña incorrecta.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Error de inicio de sesión'), //otro error
                content: Text('Error desconocido.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        }
      } else {
        // Manejar caso inesperado
      }
    } else {
      // Manejo de otros códigos de estado de respuesta
    }
  }

  @override
  Widget build(BuildContext context) {  //acá es la vista simplemente
    String username = '';
    String password = '';

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'File Manager',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF536492),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Inicia sesión',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              onChanged: (value) => username = value,
              decoration: const InputDecoration(
                labelText: 'Correo electrónico',
                filled: true,
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF536492)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              onChanged: (value) => password = value,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Contraseña',
                filled: true,
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF536492)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _login(username, password, context);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF536492)),
              ),
              child: const Text(
                'Iniciar sesión',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Get.to(RegisterPage());
              },
              child: Text(
                '¿No tienes cuenta? Registrarse',
                style: TextStyle(color: Color(0xFF536492)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
