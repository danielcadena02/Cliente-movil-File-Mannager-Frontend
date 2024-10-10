import 'package:file_manager_app/view/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';
import 'Register.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';//para manejo de cookies y extracción del token

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String username = '';
    String password = '';

    Future<void> login(BuildContext context) async {
      final url = 'http://conquest3.bucaramanga.upb.edu.co:5000/auth/login'; // URL del endpoint de autenticación
      final storage = FlutterSecureStorage();
      final dio = Dio();
      final cookieJar = CookieJar();

      dio.interceptors.add(CookieManager(cookieJar));

      try {
        final response = await dio.post(
          url,
          data: jsonEncode(<String, String>{
            'username': username,
            'password': password,
          }),
          options: Options(
            headers: {
              'Content-Type': 'application/json',
            },
          ),
        );

        if (response.statusCode == 200 && response.data['token'] != false) {
          //extrae el token de las cookies
          final cookies = await cookieJar.loadForRequest(Uri.parse(url));
          final token = cookies.firstWhere((cookie) => cookie.name == 'tkn').value;

          print('Token: $token');
          // Guardar el JWT
          await storage.write(key: 'accessToken', value: token);

          Get.offAll(() => HomePage(token: token));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error al iniciar sesión: ${response.data['message']}')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error de red: $e')),
        );
      }
    }

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
              onPressed: () => login(context),
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty .all(Color(0xFF536492)),
              ),
              child: const Text(
                'Iniciar sesión',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                // Navegar a la pantalla de registro (RegisterPage)
                Get.to(() =>RegisterPage());
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
