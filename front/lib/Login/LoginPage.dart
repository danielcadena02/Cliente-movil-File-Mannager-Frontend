import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'Register.dart'; // Asegúrate de que el archivo Register.dart esté en la ubicación correcta
import '../../view/screens/home_screen.dart'; // Asegúrate de que el archivo home_screen.dart esté en la ubicación correcta

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  // TODO: border
                  // OutlinedBorder(side: BorderSide(color: Color(0xFF536492))
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
                  // TODO: border
                  // OutlinedBorder(side: BorderSide(color: Color(0xFF536492))
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navegar a la pantalla de inicio (HomePage) sin hacer autenticación real
                  Get.to(HomePage());
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xFF536492)),
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
                  Get.to(RegisterPage());
                },
                child: Text(
                  '¿No tienes cuenta? Registrarse',
                  style: TextStyle(color: Color(0xFF536492)),
                ),
              ),
            ],
          )),
    );
  }
}
