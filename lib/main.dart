import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: const Color(0xFF003366)), // Azul médico
      home: const MedicalHome(),
    );
  }
}

class MedicalHome extends StatelessWidget {
  const MedicalHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // 1. Parte Superior (Header)
      appBar: AppBar(
        backgroundColor: const Color(0xFF003366), // Azul
        toolbarHeight: 100,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Bienvenido,\nHernandez Roman',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            const CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage('https://www.regionalonehealth.org/wp-content/uploads/2019/12/Woman-in-Surgery.jpg'),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 2. Dos iconos al lado del otro
            Row(
              children: [
                _buildSquareButton(Icons.description, "Tus Recetas"),
                const SizedBox(width: 16),
                _buildSquareButton(Icons.medication, "Disponibilidad de\nMedicamentos"),
              ],
            ),
            const SizedBox(height: 20),

            // 3. Rectángulo 1: Reloj inteligente
            _buildWideButton(
              icon: Icons.watch,
              text: "Conecta tu Reloj Inteligente",
              color: Colors.white,
              textColor: Colors.black,
              borderColor: Colors.grey,
            ),
            const SizedBox(height: 16),

            // 4. Rectángulo 2: Nuestro Equipo
            _buildWideButton(
              icon: Icons.medical_services, // Representa la Vara de Asclepio
              text: "Nuestro Equipo",
              color: const Color(0xFF003366), // Azul
              textColor: Colors.white,
              hasAvatar: true,
            ),
          ],
        ),
      ),
      // 5. Barra inferior (Navigation)
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Libro'),
          BottomNavigationBarItem(icon: Icon(Icons.person_add), label: 'Registro'),
        ],
      ),
    );
  }

  // Widget para los botones cuadrados superiores
  Widget _buildSquareButton(IconData icon, String label) {
    return Expanded(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(icon, size: 40, color: Colors.red), // Rojo para destacar
          ),
          const SizedBox(height: 8),
          Text(label, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  // Widget para los rectángulos anchos
  Widget _buildWideButton({
    required IconData icon,
    required String text,
    required Color color,
    required Color textColor,
    Color? borderColor,
    bool hasAvatar = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        border: borderColor != null ? Border.all(color: borderColor) : null,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Row(
        children: [
          if (hasAvatar) ...[
            const CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage('https://uknow.uky.edu/sites/default/files/styles/uknow_story_image/public/GettyImages-1496720417.jpg'),
            ),
            const SizedBox(width: 15),
          ],
          Expanded(
            child: Text(
              text,
              style: TextStyle(color: textColor, fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          Icon(icon, color: hasAvatar ? Colors.white : Colors.red, size: 30),
        ],
      ),
    );
  }
}