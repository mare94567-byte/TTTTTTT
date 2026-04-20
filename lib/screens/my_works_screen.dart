import 'package:flutter/material.dart';

class MyWorksScreen extends StatelessWidget {
  const MyWorksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("إدارة أعمالي"), backgroundColor: Colors.blueAccent),
      body: ListView.builder(
        itemCount: 1, 
        itemBuilder: (context, index) => Card(
          margin: const EdgeInsets.all(10),
          child: ListTile(
            leading: const Icon(Icons.edit, color: Colors.blue),
            title: const Text("مانهوا SAMAQ الأولى"),
            subtitle: const Text("تم نشر 5 فصول"),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // لاحقاً هنا تعدلين الفصول
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () {
          // للانتقال لصفحة النشر
        },
      ),
    );
  }
}
