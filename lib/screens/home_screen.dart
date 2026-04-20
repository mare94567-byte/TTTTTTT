import 'package:flutter/material.dart';
import 'publish_screen.dart';
import 'my_works_screen.dart';
import 'reader_screen.dart';
import 'library_screen.dart';
import 'auth_screen.dart'; // أضفت هذا لكي يعمل زر تسجيل الدخول

class HomeScreen extends StatefulWidget {
  final VoidCallback onThemeChanged;
  final bool isDarkMode;

  const HomeScreen({required this.onThemeChanged, required this.isDarkMode});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState(); // تصحيح الكلمة من uper إلى super
    _tabController = TabController(length: 3, vsync: this, initialIndex: 2);
  }

  @override // تصحي_ح الكلمة من erride إلى override
  Widget build(BuildContext context) { // تصحيح الكلمة من get إلى Widget
    return Scaffold(
      appBar: AppBar(
        title: const Text("SAMAQ", style: TextStyle(color: Colors.pinkAccent, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(
            icon: Icon(widget.isDarkMode ? Icons.wb_sunny : Icons.nights_stay),
            onPressed: widget.onThemeChanged,
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: "التصنيفات"),
            Tab(text: "الأكثر شعبية"),
            Tab(text: "آخر الفصول"),
          ],
        ),
      ),
      drawer: buildDrawer(context),
      body: TabBarView(
        controller: _tabController,
        children: [
          const Center(child: Text("قائمة التصنيفات")),
          const Center(child: Text("الأعمال الأكثر شعبية")),
          buildMangaGrid(),
        ],
      ),
    );
  }

  Widget buildMangaGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.6,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: 9,
      itemBuilder: (context, index) => Column(
        children: [
          Expanded(child: Container(color: Colors.grey[800], child: const Icon(Icons.image))),
          const Text("اسم المانهوا", style: TextStyle(fontSize: 12)),
          const Text("جديد", style: TextStyle(fontSize: 10, color: Colors.green)),
        ],
      ),
    );
  }

  Widget buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.pinkAccent),
            child: Center(
              child: Text("SAMAQ APP", 
                style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.login),
            title: const Text("تسجيل الدخول"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => AuthScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.library_books),
            title: const Text("المكتبة"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => LibraryScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.cloud_upload),
            title: const Text("انشر أعمالك"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => PublishScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.palette),
            title: const Text("أعمالي"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyWorksScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text("سجل المشاهدة"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.download),
            title: const Text("التحميلات"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
