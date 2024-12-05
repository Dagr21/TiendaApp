import 'dart:convert'; // Para manejar JSON
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Librería para solicitudes HTTP
import 'package:main_app/registro.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}

class Login extends StatelessWidget {
  Login({super.key});

  // Controladores para los campos de texto
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Función para verificar usuario
Future<void> verifyUser(BuildContext context) async {
  final String email = emailController.text.trim();
  final String password = passwordController.text.trim();

  if (email.isEmpty || password.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Por favor, ingresa correo y contraseña.')),
    );
    return;
  }

  try {
    final response = await http.get(Uri.parse('http://localhost:5000/api/clientes'));

    if (response.statusCode == 200) {
      // Decodificar la respuesta JSON
      final List<dynamic> users = jsonDecode(response.body);

      // Buscar si existe un usuario con el correo y la contraseña ingresados
      final bool userExists = users.any((user) =>
          user['email'] == email && user['password'] == password);

      // Mostrar alerta según el resultado
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(userExists ? 'Inicio de sesión exitoso' : 'Credenciales inválidas'),
            content: Text(userExists
                ? 'Bienvenido, $email.'
                : 'El correo o la contraseña son incorrectos.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Aceptar'),
              ),
            ],
          );
        },
      );
    } else {
      throw Exception('Error en el servidor: ${response.statusCode}');
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error al conectar con el servidor: $e')),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'LOGIN',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Kenzo',
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 16),

                // Card
                Card(
                  elevation: 8.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Correo
                        TextField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Correo Electrónico',
                            prefixIcon: Icon(Icons.email),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Contraseña
                        TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Contraseña',
                            prefixIcon: Icon(Icons.lock),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Botón
                        ElevatedButton(
                          onPressed: () => verifyUser(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              vertical: 16.0,
                              horizontal: 32.0,
                            ),
                          ),
                          child: const Text('Iniciar Sesión'),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Enlace para registrar
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Register(),
                      ),
                    );
                  },
                  child: const Text(
                    'No tienes cuenta? Regístrate',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
