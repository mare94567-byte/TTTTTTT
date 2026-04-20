import 'package:flutter/material.dart';
import 'reader_screen.dart'; // ضروري جداً للربط مع صفحة القراءة

class MangaDetailsScreen extends StatelessWidget {
  const MangaDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("تفاصيل المانهوا"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // صورة الغلاف والمعلومات العامة
            Container(
              height: 300,
              width: double.infinity,
              color: Colors.grey[900],
              child: const Icon(Icons.image, size: 100, color: Colors.white),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("اسم المانهوا", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text("الحالة: مستمر • التصنيف: دراما، خيال"),
                  SizedBox(height: 15),
                  Text("القصة:", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("هنا يتم وضع وصف المانهوا الذي قمتِ بكتابته في صفحة النشر..."),
                ],
              ),
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text("الفصول المتاحة", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.pink)),
            ),
            // قائمة الفصول
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10, // عدد الفصول التجريبي
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.chrome_reader_mode, color: Colors.blue),
                  title: Text("الفصل ${index + 1}"),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    // الربط الفعلي مع صفحة القارئ
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => ReaderScreen())
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
