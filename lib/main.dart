import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:main_app/trends.dart';
import 'package:main_app/tiendaapp/user.dart';
import 'product.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
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

        //FEED
        body: TabBarView(
          children: [
            //Popular
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Imagen de Presentacion
                    Stack(
                      children: [	
                        Container (
                          height: 300,
                          width: double.infinity,
                          child: Image.asset(
                            'assets/MLB.jpg',
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
                    SizedBox(
                      height: 6,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Buscar productos',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    
                    Wrap(
                      spacing: 16.0,
                      runSpacing: 16.0,
                      children: List.generate(6, (index) {
                        return Container(
                          width: (MediaQuery.of(context).size.width - 48) / 2,
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 120,
                                color: Colors.grey[200],
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Titulo',
                                style: TextStyle(fontSize: 12, color: Colors.black),
                              ),
                              Text(
                                'Descripccion',
                                style: TextStyle(fontSize: 12, color: Colors.black),
                              ),
                              Text(
                                '\$00.00',
                                style: TextStyle(fontSize: 12, color: Colors.black),
                              ),
                              SizedBox(height: 4),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context, 
                                    MaterialPageRoute(builder: (context) => Product())
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  foregroundColor: Colors.white,
                                  minimumSize: Size(double.infinity, 40),
                                ),
                                child: Text('Ver articulo'),
                              ),
                            ],
                          )
                        );
                      }), 
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
                  )
                ],
               ),
              ),
            ),
            ///////////////////Pantalla para Gorras/////////////////////
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ULTIMAS ADQUICISIONES',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Kenzo',
                        color: Colors.black
                      ),
                    ),
                
              
                    SizedBox(height: 16),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal, 
                      child: Row(
                        children: List.generate(6, (index) {
                          return Container(
                            width: 210,
                            margin: EdgeInsets.symmetric(horizontal: 8.0),
                            padding: const EdgeInsets.all(16.0),
                              child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 100,
                                  color: Colors.grey[300],
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Gorra #1',
                                  style: TextStyle(fontSize: 12, color: Colors.black),
                                ),
                                Text(
                                  'Descripccion',
                                  style: TextStyle(fontSize: 12, color: Colors.black),
                                ),
                                Text(
                                  '\$00.00',
                                  style: TextStyle(fontSize: 12, color: Colors.black),
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
                                  child: Text('Ver articulo'),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ),

                    SizedBox(height: 32),
                    Container(
                      width: double.infinity,
                      height: 300,
                      child: Image.asset(
                        'assets/portada.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),

                    SizedBox(height: 16),
                    Text(
                      'MLB',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Kenzo',
                        color: Colors.black
                      ),
                    ),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row (
                        children: List.generate(6, (index) {
                          return Container(
                            width: 210,
                            margin: EdgeInsets.symmetric(horizontal: 8.0),
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 100,
                                  color: Colors.grey[300],
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Gorra #1',
                                  style: TextStyle(fontSize: 12, color: Colors.black),
                                ),
                                Text(
                                  'Descripccion',
                                  style: TextStyle(fontSize: 12, color: Colors.black),
                                ),
                                Text(
                                  '\$00.00',
                                  style: TextStyle(fontSize: 12, color: Colors.black),
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
                                  child: Text('Ver articulo'),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ),

                    SizedBox(height: 16),
                    Text(
                      'NBA',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Kenzo',
                        color: Colors.black
                      ),
                    ),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row (
                        children: List.generate(6, (index) {
                          return Container(
                            width: 210,
                            margin: EdgeInsets.symmetric(horizontal: 8.0),
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 100,
                                  color: Colors.grey[300],
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Gorra #1',
                                  style: TextStyle(fontSize: 12, color: Colors.black),
                                ),
                                Text(
                                  'Descripccion',
                                  style: TextStyle(fontSize: 12, color: Colors.black),
                                ),
                                Text(
                                  '\$00.00',
                                  style: TextStyle(fontSize: 12, color: Colors.black),
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
                                  child: Text('Ver articulo'),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ),

                    SizedBox(height: 16),
                    Text(
                      'NFL',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Kenzo',
                        color: Colors.black
                      ),
                    ),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row (
                        children: List.generate(6, (index) {
                          return Container(
                            width: 210,
                            margin: EdgeInsets.symmetric(horizontal: 8.0),
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 100,
                                  color: Colors.grey[300],
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Gorra #1',
                                  style: TextStyle(fontSize: 12, color: Colors.black),
                                ),
                                Text(
                                  'Descripccion',
                                  style: TextStyle(fontSize: 12, color: Colors.black),
                                ),
                                Text(
                                  '\$00.00',
                                  style: TextStyle(fontSize: 12, color: Colors.black),
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
                                  child: Text('Ver articulo'),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ),

                    SizedBox(height: 16),
                    Text(
                      'OTROS DEPORTES Y MARCAS',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Kenzo',
                        color: Colors.black
                      ),
                    ),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row (
                        children: List.generate(6, (index) {
                          return Container(
                            width: 210,
                            margin: EdgeInsets.symmetric(horizontal: 8.0),
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 100,
                                  color: Colors.grey[300],
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Gorra #1',
                                  style: TextStyle(fontSize: 12, color: Colors.black),
                                ),
                                Text(
                                  'Descripccion',
                                  style: TextStyle(fontSize: 12, color: Colors.black),
                                ),
                                Text(
                                  '\$00.00',
                                  style: TextStyle(fontSize: 12, color: Colors.black),
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
                                  child: Text('Ver articulo'),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
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
              ),
            ),
            //////////////////Pantalla pata T-Shirts///////////////////
            
            
          ],
        )
      ),
    );
  }
}





