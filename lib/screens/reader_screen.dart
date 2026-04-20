import 'package:flutter/material.dart';

class ReaderScreen extends StatelessWidget {
  final List<String> emojiReactions = ["😭", "✨", "💔", "🔥", "❤️", "😎", "😹", "😼"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("فصل 1")),
      body: ListView(
        children: [
          // محاكاة لصور المانهوا مع العلامة المائية
          for (var i = 1; i <= 5; i++)
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(height: 500, color: Colors.black12, child: Center(child: Text("صورة $i"))),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("SAMAQ - TEAM", style: TextStyle(color: Colors.blue.withOpacity(0.5), fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          
          // التفاعلات بالإيموجي في نهاية الفصل
          Padding(
            padding: EdgeInsets.all(10),
            child: Wrap(
              spacing: 10,
              children: emojiReactions.map((e) => ActionChip(label: Text(e), onPressed: () {})).toList(),
            ),
          ),
          
          // قسم التعليقات والردود
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("التعليقات", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                TextField(decoration: InputDecoration(hintText: "أضف تعليقك...")),
                // محاكاة لتعليق ورد
                ListTile(
                  title: Text("اسم المستخدم"),
                  subtitle: Text("فصل رائع!"),
                  trailing: TextButton(onPressed: () {}, child: Text("رد")),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
