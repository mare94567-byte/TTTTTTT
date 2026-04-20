import 'package:flutter/material.dart';

class MyWorksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("أعمالي"), backgroundColor: Colors.pinkAccent),
      body: ListView.builder(
        itemCount: 1, // هنا ستظهر أعمالك المنشورة
        itemBuilder: (context, index) => Card(
          margin: const EdgeInsets.all(10),
          child: ListTile(
            leading: const Icon(Icons.book, color: Colors.pink),
            title: const Text("اسم المانهوا الخاصة بكِ"),
            subtitle: const Text("الحالة: مستمر"),
            trailing: PopupMenuButton(
              itemBuilder: (context) => [
                const PopupMenuItem(value: 'add', child: Text("إضافة فصل جديد")),
                const PopupMenuItem(value: 'edit', child: Text("تعديل العمل")),
                const PopupMenuItem(value: 'delete', child: Text("حذف نهائي", style: TextStyle(color: Colors.red))),
              ],
              onSelected: (val) {
                if (val == 'add') _showAddChapterDialog(context);
              },
            ),
          ),
        ),
      ),
    );
  }

  // نافذة إضافة فصل جديد (رقم الفصل + رفع الصور)
  void _showAddChapterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("إضافة فصل جديد"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const TextField(decoration: InputDecoration(labelText: "رقم الفصل"), keyboardType: TextInputType.number),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.upload_file),
              label: const Text("رفع صور الفصل (+50 صورة)"),
              onPressed: () {
                // كود اختيار الصور من الجهاز
              },
            ),
            const SizedBox(height: 10),
            const LinearProgressIndicator(value: 0.5), // شريط التحميل الوهمي
            const Text("جاري الرفع 50%")
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("إلغاء")),
          ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text("نشر الفصل")),
        ],
      ),
    );
  }
}
