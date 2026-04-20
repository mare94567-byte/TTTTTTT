import 'package:flutter/material.dart';

class ReaderScreen extends StatelessWidget {
  const ReaderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // قائمة التفاعلات (الإيموجي)
    final List<String> reactions = ["😭", "✨", "💔", "🔥", "❤️", "😎", "😹", "😼"];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("الفصل 1"), 
        backgroundColor: Colors.blueGrey[900],
        actions: [
          IconButton(icon: const Icon(Icons.share), onPressed: () {}),
        ],
      ),
      body: ListView(
        children: [
          // عرض الصور مع العلامة المائية الزرقاء
          for (int i = 1; i <= 5; i++)
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                // صورة الفصل (رابط تجريبي)
                Image.network(
                  'https://via.placeholder.com/500x800', 
                  fit: BoxFit.width,
                  width: double.infinity,
                ),
                // العلامة المائية الزرقاء
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: Text(
                    "SAMAQ - TEAM",
                    style: TextStyle(
                      color: Colors.blue.withOpacity(0.8),
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      shadows: const [Shadow(blurRadius: 5, color: Colors.black)],
                    ),
                  ),
                ),
              ],
            ),

          const SizedBox(height: 30),

          // --- قسم التفاعلات (Reactions) ---
          Container(
            padding: const EdgeInsets.all(20),
            color: Colors.grey[900],
            child: Column(
              children: [
                const Text(
                  "ما هو تقييمك لهذا الفصل؟",
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
                Wrap(
                  spacing: 15,
                  runSpacing: 10,
                  alignment: WrapAlignment.center,
                  children: reactions.map((emoji) => InkWell(
                    onTap: () {
                      // هنا سيتم تسجيل التفاعل لاحقاً
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("تم إضافة تفاعل: $emoji"), duration: const Duration(seconds: 1)),
                      );
                    },
                    child: Text(emoji, style: const TextStyle(fontSize: 32)),
                  )).toList(),
                ),
              ],
            ),
          ),

          // --- قسم التعليقات (Comments) ---
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "التعليقات (12)",
                  style: TextStyle(color: Colors.blueAccent, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
                // حقل إضافة تعليق
                const TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "أكتب تعليقك هنا...",
                    hintStyle: TextStyle(color: Colors.grey),
                    suffixIcon: Icon(Icons.send, color: Colors.blue),
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                  ),
                ),
                const SizedBox(height: 20),
                // نموذج لتعليق مستخدم
                _buildCommentItem("فاطمة", "الترجمة جداً رهيبة، عاشت إيدكم SAMAQ!", "منذ ساعتين"),
                _buildCommentItem("أحمد", "بانتظار الفصل القادم بحماس!", "منذ 5 ساعات"),
              ],
            ),
          ),
          const SizedBox(height: 40), // مسافة في نهاية الصفحة
        ],
      ),
    );
  }

  // دالة بناء شكل التعليق الواحد لترتيب الكود
  Widget _buildCommentItem(String user, String comment, String time) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(backgroundColor: Colors.blueAccent, child: Icon(Icons.person, color: Colors.white)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(user, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    Text(time, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
                const SizedBox(height: 5),
                Text(comment, style: const TextStyle(color: Colors.white70)),
                TextButton(
                  onPressed: () {}, 
                  child: const Text("رد", style: TextStyle(color: Colors.blue, fontSize: 12))
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
