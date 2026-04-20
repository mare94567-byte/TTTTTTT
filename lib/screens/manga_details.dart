import 'package:flutter/material.dart';
import 'reader_screen.dart';

class MangaDetailsScreen extends StatelessWidget {
  const MangaDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("تفاصيل المانهوا"), backgroundColor: Colors.blueAccent),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [Colors.blue, Colors.blueGrey]),
              ),
              child: const Icon(Icons.image, size: 80, color: Colors.white),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("اسم المانهوا بالعربي", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue)),
                  SizedBox(height: 8),
                  Text("المترجم: فريق SAMAQ", style: TextStyle(color: Colors.grey)),
                  SizedBox(height: 15),
                  Text("القصة:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  Text("هذا النص يوضح قصة المانهوا التي قمتِ بترجمتها واختيار كلماتها بعناية..."),
                ],
              ),
            ),
            const Divider(color: Colors.blue),
            // قائمة الفصول
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) => ListTile(
                leading: CircleAvatar(backgroundColor: Colors.blue[100], child: Text("${index + 1}")),
                title: Text("الفصل رقم ${index + 1}"),
                trailing: const Icon(Icons.play_circle_fill, color: Colors.blue),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ReaderScreen())),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
