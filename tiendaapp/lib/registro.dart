import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:main_app/Login.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Register(), // Elimina el "const" aquí
    );
  }
}

class Register extends StatelessWidget {
  Register({super.key}); // Eliminamos const

  // Controladores para los campos de texto
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController idController = TextEditingController();

  // Función para registrar usuario
  Future<void> registerUser(BuildContext context) async {
    final String name = nameController.text.trim();
    final String lastName = lastNameController.text.trim();
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();
    final String identification = idController.text.trim();

    // Validación de campos vacíos
    if (name.isEmpty ||
        lastName.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        identification.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, llena todos los campos.')),
      );
      return;
    }

    // Crear datos para enviar al backend
    final Map<String, dynamic> userData = {
      "name": name,
      "lastName": lastName,
      "email": email,
      "password": password,
      "identification": identification,
    };

    try {
      final response = await http.post(
        Uri.parse('http://localhost:5000/api/clientes'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(userData),
      );

      if (response.statusCode == 201) {
        // Usuario creado exitosamente
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Registro Exitoso'),
              content:
                  const Text('El usuario ha sido registrado correctamente.'),
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
        throw Exception('Error en el registro: ${response.statusCode}');
      }
    } catch (e) {
      // Manejo de errores
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al registrar usuario: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Registro',
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
                  'REGÍSTRATE',
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
                        // Nombre
                        TextField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Nombre',
                            prefixIcon: Icon(Icons.person),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Apellido
                        TextField(
                          controller: lastNameController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Apellido',
                            prefixIcon: Icon(Icons.person),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Correo
                        TextField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Correo',
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

                        // Identificación
                        TextField(
                          controller: idController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Identificación',
                            prefixIcon: Icon(Icons.badge),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Botón de registro
                        ElevatedButton(
                          onPressed: () => registerUser(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              vertical: 16.0,
                              horizontal: 32.0,
                            ),
                          ),
                          child: const Text('Registrar Usuario'),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Enlace para iniciar sesión
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login(), // Elimina "const"
                      ),
                    );
                  },
                  child: const Text(
                    'Ya tienes cuenta? Inicia Sesion',
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
