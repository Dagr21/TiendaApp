import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:main_app/carrito.dart';
import 'package:main_app/main.dart';
import 'package:main_app/notificaciones.dart';
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
      home: Tendencias(),
    );
  }
}

class Tendencias extends StatelessWidget {
  const Tendencias({super.key});

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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) => Notis(),
                    ),
                  );
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
      body: ListView(
        children: [
          Stack(
            children: [	
              SizedBox (
                height: 300,
                width: double.infinity,
                child: Image.asset(
                  'assets/invierno.jpg',
                  fit: BoxFit.cover,
                ),
              ),  
              Positioned(
                bottom: 16.0,
                left: 16.0,
                child: Text(
                  'LO MEJOR PARA INVIERNO',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontFamily: "Kenzo",
                    backgroundColor: Colors.black54,
                  ),
                ),
              ),
              Positioned(
                bottom: 16.0,
                right: 16.0,
                child: TextButton(
                  onPressed: () {
                    print('ir');
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                  ),
                  child: Text(
                    'Ver Mas',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),           
            ],
          ), 

          Stack(
            children: [	
              SizedBox (
                height: 300,
                width: double.infinity,
                child: Image.asset(
                  'assets/HATS.jpg',
                  fit: BoxFit.cover,
                ),
              ),  
              Positioned(
                bottom: 16.0,
                left: 16.0,
                child: Text(
                  'REMOLINO DE GORRAS',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontFamily: "Kenzo",
                    backgroundColor: Colors.black54,
                  ),
                ),
              ),
              Positioned(
                bottom: 16.0,
                right: 16.0,
                child: TextButton(
                  onPressed: () {
                    print('ir');
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                  ),
                  child: Text(
                    'Ver Mas',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),           
            ],
          ),

          Stack(
            children: [	
              SizedBox (
                height: 300,
                width: double.infinity,
                child: Image.asset(
                  "assets/Dodgersws.jpg", 
                  fit: BoxFit.cover,
                ),
              ),  
              Positioned(
                bottom: 16.0,
                left: 16.0,
                child: Text(
                  'LO MEJOR DE DOGERS',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontFamily: "Kenzo",
                    backgroundColor: Colors.black54,
                  ),
                ),
              ),
              Positioned(
                bottom: 16.0,
                right: 16.0,
                child: TextButton(
                  onPressed: () {
                    print('ir');
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                  ),
                  child: Text(
                    'Ver Mas',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),           
            ],
          ),
          SizedBox(height: 24),

          Container(
            width: double.infinity,
            color: Colors.black,
            padding: EdgeInsets.all(16.0),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'PARA MAS',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Kenzo',
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                        Divider(color: Colors.white),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                'AYUDA & FAQS',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                )
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                'TERMINOS Y CONDICIONES',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                'POLITICA DE PRIVACIDAD',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                'TUS DERECHOS PRIVADOS',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 24),
                        Text(
                          'NUESTRAS REDES SOCIALES',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Kenzo',
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        Divider(color: Colors.white),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            children: [
                              Icon(Icons.facebook, color: Colors.white),
                              SizedBox(width: 8),
                              Text(
                                'FACEBOOK',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                         
                            ],
                        
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            children: [
                              FaIcon(FontAwesomeIcons.twitter, color: Colors.white),
                              SizedBox(width: 8),
                              Text(
                                'TWITTER',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            children: [
                              FaIcon(FontAwesomeIcons.instagram, color: Colors.white),
                              SizedBox(width: 8),
                              Text(
                                'INSTAGRAM',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                      ),
                      
          ),
        ],
        
      ),
      
    )
    );
    
  }
}
