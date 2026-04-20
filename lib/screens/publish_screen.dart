import 'package:flutter/material.dart';

class PublishScreen extends StatefulWidget {
  @override
  _PublishScreenState createState() => _PublishScreenState();
}

class _PublishScreenState extends State<PublishScreen> {
  String status = 'مستمر';
  List<String> selectedCategories = [];
  final List<String> allCategories = ["أكشن", "مانهوا", "مانجا", "رومانسية", "خيال", "دراما", "تاريخي"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("نشر عمل جديد"), backgroundColor: Colors.pinkAccent),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildTextField("اسم العمل (بالعربي أو الانكليزي)"),
            _buildTextField("أسماء أخرى للعمل"),
            _buildTextField("اسم المترجم"),
            _buildTextField("اسم المؤلف (اختياري)"),
            _buildTextField("وصف المانهوا / القصة", maxLines: 3),
            const SizedBox(height: 15),
            const Text("الحالة:", style: TextStyle(fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: ["مستمر", "مكتمل", "متوقف"].map((s) => Row(
                children: [
                  Radio(value: s, groupValue: status, onChanged: (v) => setState(() => status = v.toString())),
                  Text(s),
                ],
              )).toList(),
            ),
            const SizedBox(height: 15),
            const Text("التصنيفات:", style: TextStyle(fontWeight: FontWeight.bold)),
            Wrap(
              spacing: 8,
              children: allCategories.map((cat) => FilterChip(
                label: Text(cat),
                selected: selectedCategories.contains(cat),
                onSelected: (val) => setState(() => val ? selectedCategories.add(cat) : selectedCategories.remove(cat)),
              )).toList(),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.add_a_photo),
              label: const Text("رفع صورة الغلاف من الاستوديو"),
              onPressed: () {}, 
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.pink, minimumSize: const Size(double.infinity, 50)),
              onPressed: () => Navigator.pop(context),
              child: const Text("نشر العمل الآن", style: TextStyle(color: Colors.white, fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, {int maxLines = 1}) => Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: TextField(maxLines: maxLines, decoration: InputDecoration(labelText: label, border: const OutlineInputBorder())),
  );
}
