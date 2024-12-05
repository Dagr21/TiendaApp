import 'package:flutter/material.dart';
import 'package:main_app/carrito.dart';
import 'package:main_app/main.dart';
import 'package:main_app/trends.dart';
import 'user.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Notis(),
    );
  }
}

class Notis extends StatelessWidget {
  const Notis({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child:  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
          elevation: 1,
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu, color: Colors.black),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),  
          ),
          title: Image .asset(
            "assets/gz.png",
            height: 75,
          ),  // Image.asset
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserProfile(),
                    ),
                  );
                },
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, color: Colors.white),
                ),
              ),
            ),
          ],
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration( 
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Text(
                      'Ground Zero',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontFamily: "Mecha",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) => HomePage(),
                    ),
                  );
                },
              ),
            
              ListTile(
                leading: Icon(Icons.trending_up),
                title: Text("Tendencias"),
                onTap: () {
                  Navigator.push(
                    context,
                      MaterialPageRoute(
                        builder: (context) => Tendencias(),
                      ),
                    );
                },
              ),
              ListTile(
                leading: Icon(Icons.local_offer),
                title: Text("Ofertas"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.shopping_cart),
                title: Text("Carrito"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) => Cart(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.notifications),
                title: Text("Notificaciones"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.collections),
                title: Text("Colecciones"),
                onTap: () {
                  Navigator.pop(context);
                },
              )
              
            ], 
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.messenger_outline_sharp, size: 60, color: Colors.grey),
                SizedBox(height: 20),
                Text(
                  "NO TIENES NOTIFICACIONES",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Kenzo",
                    color: Colors.black,
                  )
                )
              ],
            ),
          )
        )
      )
    );
  }
}