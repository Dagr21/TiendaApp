import 'package:flutter/material.dart';



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
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
          bottom: TabBar(
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: [	
              Tab(text: 'Popular',),
              Tab(text: 'Gorras',),
              Tab(text: 'T-Shirts',),
              Tab(text: 'Accesorios',),
            ],
          ),
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
                  Navigator.pop(context);
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
                  Navigator.pop(context);
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
      body: ListView(
        children: [
          Stack(
            children: [	
              Container (
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
                  'Texto de Ejemplo',
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
              Container (
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
                  'Texto de Ejemplo',
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
              Container (
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
                  'Texto de Ejemplo',
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

        ],
      )
    );
    
  }
}

