import 'package:flutter/material.dart';

void main() {
  runApp(const MyPortfolioApp());
}

class MyPortfolioApp extends StatelessWidget {
  const MyPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Portofolio Arvan",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Poppins',
      ),
      // 🔹 Awalnya buka halaman login dulu
      home: const LoginPage(),
    );
  }
}

//
// ==========================================================
// =============== HALAMAN LOGIN =============================
// ==========================================================
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    if (username == "arvan" && password == "12345") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainNavigation()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("❌ Username atau password salah"),
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff3f2f7),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 6,
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.person_pin,
                    size: 80,
                    color: Colors.deepPurple,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Login ke Portfolio",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: "Username",
                      prefixIcon: const Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      prefixIcon: const Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  ElevatedButton(
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Masuk",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Gunakan akun demo:\nUsername: arvan | Password: 12345",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//
// ==========================================================
// =============== BOTTOM NAVIGATION MAIN PAGE ===============
// ==========================================================
class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    PortfolioPage(),
    ProjectPage(),
    ContactPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Beranda"),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: "Proyek"),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail),
            label: "Kontak",
          ),
        ],
      ),
    );
  }
}

//
// ==========================================================
// =============== WIDGET REUSABLE UNTUK APPBAR ==============
// ==========================================================
PreferredSizeWidget customAppBar(BuildContext context, String title) {
  return AppBar(
    backgroundColor: Colors.deepPurple,
    title: Text(
      title,
      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
    centerTitle: true,
    elevation: 4,
    actions: [
      IconButton(
        icon: const Icon(Icons.notifications, color: Colors.white),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("🔔 Tidak ada notifikasi baru"),
              duration: Duration(seconds: 2),
            ),
          );
        },
      ),
      const SizedBox(width: 8),
    ],
  );
}

//
// ==========================================================
// =============== PAGE 1: PORTOFOLIO (HOME) =================
// ==========================================================
class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff3f2f7),
      appBar: customAppBar(context, "My Portfolio"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                radius: 70,
                backgroundColor: Colors.deepPurple,
                child: const CircleAvatar(
                  radius: 66,
                  backgroundImage: NetworkImage(
                    "https://cdn-icons-png.flaticon.com/512/3135/3135715.png",
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Arvan Fudoli",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const Text(
              "Flutter Developer | UI/UX Enthusiast",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "Halo! Saya Arvan, seorang mahasiswa Informatika di Universitas PGRI Semarang "
                "yang senang membuat design menarik maupun ranah fotography. "
                "Saya berfokus pada Design UI/UX dan selalu ingin belajar hal baru di dunia teknologi.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, height: 1.5),
              ),
            ),
            const SizedBox(height: 30),
            sectionTitle("💡 Keahlian Saya"),
            const SizedBox(height: 10),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 10,
              runSpacing: 10,
              children: const [
                SkillChip(label: "Flutter"),
                SkillChip(label: "Dart"),
                SkillChip(label: "UI/UX Design"),
                SkillChip(label: "Firebase"),
                SkillChip(label: "Git & GitHub"),
                SkillChip(label: "HTML / CSS"),
              ],
            ),
            const SizedBox(height: 30),
            sectionTitle("🎓 Pendidikan"),
            const SizedBox(height: 10),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: const ListTile(
                leading: Icon(Icons.school, color: Colors.deepPurple),
                title: Text("Universitas PGRI Semarang"),
                subtitle: Text("Program Studi Informatika"),
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              "© 2025 Arvan Fudoli — All Rights Reserved",
              style: TextStyle(color: Colors.black54, fontSize: 12),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.deepPurple,
      ),
    );
  }
}

//
// ==========================================================
// =============== PAGE 2: PROYEK ============================
// ==========================================================
class ProjectPage extends StatelessWidget {
  const ProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff3f2f7),
      appBar: customAppBar(context, "Proyek Saya"),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          projectCard(
            title: "Aplikasi Galeri Foto",
            description:
                "Aplikasi web sederhana untuk mengunggah dan menampilkan foto menggunakan Golang dan Gin Framework.",
          ),
          projectCard(
            title: "Sistem Informasi PMI",
            description:
                "Proyek web berbasis Laravel untuk manajemen stok darah dan pelayanan donor.",
          ),
          projectCard(
            title: "Aplikasi IoT Galon Pintar",
            description:
                "Proyek berbasis ESP32 untuk mendeteksi berat galon dan kirim notifikasi WhatsApp saat hampir habis.",
          ),
        ],
      ),
    );
  }

  Widget projectCard({required String title, required String description}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(fontSize: 15, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}

//
// ==========================================================
// =============== PAGE 3: KONTAK ============================
// ==========================================================
class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff3f2f7),
      appBar: customAppBar(context, "Hubungi Saya"),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            ContactItem(icon: Icons.email, text: "arvanfudoli@gmail.com"),
            ContactItem(icon: Icons.phone, text: "+62 812-3456-7890"),
            ContactItem(icon: Icons.location_on, text: "Semarang, Indonesia"),
            SizedBox(height: 30),
            Text(
              "Jangan ragu untuk menghubungi saya melalui email atau media sosial!",
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}

//
// ==========================================================
// =============== CUSTOM WIDGETS ============================
// ==========================================================
class SkillChip extends StatelessWidget {
  final String label;
  const SkillChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.white,
          fontSize: 14,
        ),
      ),
      backgroundColor: Colors.deepPurple,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
    );
  }
}

class ContactItem extends StatelessWidget {
  final IconData icon;
  final String text;
  const ContactItem({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, color: Colors.deepPurple),
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
