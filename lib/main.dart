import 'package:flutter/material.dart';

void main() => runApp(JugueteriaApp());

class JugueteriaApp extends StatelessWidget {
  const JugueteriaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBF8FF), // Fondo suave
      // 1. APPBAR con Drawer, Título e Iconos
      appBar: AppBar(
        backgroundColor: const Color(0xFF9C4D97), // Color morado de la imagen
        foregroundColor: Colors.white,
        title: const Text("Juguetería Ivette", style: TextStyle(fontSize: 18)),
        actions: const [
          Icon(Icons.favorite_border),
          SizedBox(width: 15),
          Icon(Icons.shopping_cart_outlined),
          SizedBox(width: 15),
        ],
      ),
      drawer: const Drawer(), // Botón de menú a la izquierda
      body: Column(
        children: [
          // 2. SECCIÓN VER ADMIN
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Ver admin", style: TextStyle(fontWeight: FontWeight.bold)),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple[100],
                    foregroundColor: Colors.purple[800],
                    visualDensity: VisualDensity.compact,
                  ),
                  child: const Text("Admin"),
                ),
              ],
            ),
          ),

          // 3. GRID DE CARDS (Estilo de la imagen)
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              crossAxisCount: 2, // 2 columnas como en la imagen
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 0.85, // Proporción de la card
              children: [
                _buildCategoryCard("MiAlegría", const Color(0xFFB0994E), "https://raw.githubusercontent.com/RuizIvette/imagenes-para-flutter-6-I-fecha-11feb-26/refs/heads/main/alegria.jpg"),
                _buildCategoryCard("Barbie", const Color(0xFFC3AF55), "https://raw.githubusercontent.com/RuizIvette/imagenes-para-flutter-6-I-fecha-11feb-26/refs/heads/main/barbie.jpg"),
                _buildCategoryCard("HotWheels", const Color(0xFF9358C1), "https://raw.githubusercontent.com/RuizIvette/imagenes-para-flutter-6-I-fecha-11feb-26/refs/heads/main/hot.png"),
                _buildCategoryCard("Lego", const Color(0xFF538F4D), "https://raw.githubusercontent.com/RuizIvette/imagenes-para-flutter-6-I-fecha-11feb-26/refs/heads/main/alegria.jpg"),
                _buildCategoryCard("Mattel", const Color(0xFF4C7BA1), "https://raw.githubusercontent.com/RuizIvette/imagenes-para-flutter-6-I-fecha-11feb-26/refs/heads/main/mattel.png"),
                _buildCategoryCard("Monster High", const Color(0xFFB5635C), "https://raw.githubusercontent.com/RuizIvette/imagenes-para-flutter-6-I-fecha-11feb-26/refs/heads/main/monster.jpg"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget para crear las cards idénticas a la imagen
  Widget _buildCategoryCard(String title, Color color, String imageUrl) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30), // Bordes muy redondeados
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Imagen desde la web en lugar de icono
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white24, width: 2),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(35),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.toys, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}