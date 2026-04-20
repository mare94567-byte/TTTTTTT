import 'package:flutter/material.dart';

class PublishScreen extends StatefulWidget {
  const PublishScreen({super.key});

  @override
  _PublishScreenState createState() => _PublishScreenState();
}

class _PublishScreenState extends State<PublishScreen> {
  String status = 'مستمر';
  List<String> selectedCategories = [];
  final List<String> categories = ["أكشن", "رومانسية", "خيال", "تاريخي", "دراما", "مانهوا"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("نشر عمل جديد"), backgroundColor: Colors.blueAccent),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildInput("اسم المانهوا"),
            _buildInput("اسم المترجم"),
            _buildInput("قصة العمل", maxLines: 3),
            const SizedBox(height: 20),
            const Text("الحالة:", style: TextStyle(fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: ["مستمر", "مكتمل"].map((s) => Row(
                children: [
                  Radio(value: s, groupValue: status, onChanged: (v) => setState(() => status = v.toString())),
                  Text(s),
                ],
              )).toList(),
            ),
            const SizedBox(height: 20),
            const Text("التصنيفات:", style: TextStyle(fontWeight: FontWeight.bold)),
            Wrap(
              spacing: 8,
              children: categories.map((cat) => FilterChip(
                label: Text(cat),
                selected: selectedCategories.contains(cat),
                selectedColor: Colors.blue.withOpacity(0.3),
                onSelected: (val) => setState(() => val ? selectedCategories.add(cat) : selectedCategories.remove(cat)),
              )).toList(),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, minimumSize: const Size(double.infinity, 50)),
              onPressed: () => Navigator.pop(context),
              child: const Text("نشر الآن", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInput(String label, {int maxLines = 1}) => Padding(
    padding: const EdgeInsets.only(bottom: 15),
    child: TextField(maxLines: maxLines, decoration: InputDecoration(labelText: label, border: const OutlineInputBorder())),
  );
}
