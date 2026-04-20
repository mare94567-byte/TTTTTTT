import 'package:flutter/material.dart';

class PublishScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("نشر عمل جديد")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            TextField(decoration: InputDecoration(labelText: "اسم المانهوا")),
            SizedBox(height: 10),
            ElevatedButton(onPressed: () {}, child: Text("رفع صورة الغلاف")),
            SizedBox(height: 10),
            ElevatedButton(onPressed: () {}, child: Text("رفع فصول (أكثر من 50 صورة)")),
            Divider(),
            Text("العلامة المائية SAMAQ - TEAM ستضاف تلقائياً", style: TextStyle(color: Colors.blue)),
          ],
        ),
      ),
    );
  }
}
