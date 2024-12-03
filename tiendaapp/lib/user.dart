import 'package:flutter/material.dart';
import 'package:main_app/login.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserProfile(),
    );
  }
}

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'User',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, color: Colors.white, size: 60.0),
              ),
            ),
            SizedBox(height: 60),

            //botones de accion
            ListTile(
              leading: Icon(Icons.person, color: Colors.grey),
              title: Text('Editar Perfil'),
              trailing: Icon(Icons.arrow_forward_ios ),
              onTap: () {
                print('productos seleccionados');
              },
            ),
            ListTile(
              leading: Icon(Icons.wallet, color: Colors.grey),
              title: Text('Lista de Deseos'),
              trailing: Icon(Icons.arrow_forward_ios ),
              onTap: () {
                print('productos seleccionados');
              },
            ),
            ListTile(
              leading: Icon(Icons.star, color: Colors.grey),
              title: Text('Favoritos'),
              trailing: Icon(Icons.arrow_forward_ios ),
              onTap: () {
                print('productos seleccionados');
              },
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => Login())
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 40),
              ),
              child: Text('Iniciar Sesion'),
            ),
            SizedBox(height: 4),
            ElevatedButton(
              onPressed: () {
                print('Comprar');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 40),
              ),
              child: Text('Cerrar Sesion'),
            ),
              
          ],
        )
      )
    );
  }
}