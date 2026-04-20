import 'package:flutter/material.dart';
import 'publish_screen.dart';
import 'my_works_screen.dart';
import 'manga_details.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback onThemeChanged;
  final bool isDarkMode;

  const HomeScreen({super.key, required this.onThemeChanged, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SAMAQ - الرئيسية"),
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: onThemeChanged,
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Colors.blueAccent),
              accountName: const Text("فريق سماق"),
              accountEmail: const Text("التحميلات المتاحة: 4"),
              currentAccountPicture: const CircleAvatar(backgroundColor: Colors.white, child: Icon(Icons.person, color: Colors.blue)),
            ),
            ListTile(
              leading: const Icon(Icons.upload_file, color: Colors.blue),
              title: const Text("نشر عمل جديد"),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const PublishScreen())),
            ),
            ListTile(
              leading: const Icon(Icons.book, color: Colors.blue),
              title: const Text("أعمالي"),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const MyWorksScreen())),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.download, color: Colors.blue),
              title: const Text("التحميلات"),
              trailing: const Badge(label: Text("4"), backgroundColor: Colors.blue),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const MangaDetailsScreen())),
          child: const Text("عرض مانهوا تجريبية", style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
