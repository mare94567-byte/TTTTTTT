import 'package:flutter/material.dart';
import '../services/download_manager.dart';

class MangaDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("تفاصيل المانهوا"),
        backgroundColor: Colors.pinkAccent,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // خيارات إضافية (مفضلة، قراءة لاحقاً)
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // قسم معلومات المانهوا العليا
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 130,
                  height: 190,
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.image, size: 50, color: Colors.white54),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "اسم المانهوا",
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.pink),
                      ),
                      const SizedBox(height: 8),
                      const Text("المؤلف: (اختياري)"),
                      const Text("المترجم: SAMAQ TEAM"),
                      const SizedBox(height: 8),
                      Row(
                        children: const [
                          Icon(Icons.star, color: Colors.amber, size: 20),
                          Text(" 4.9 ", style: TextStyle(fontWeight: FontWeight.bold)),
                          Text("(120 تقييم)", style: TextStyle(color: Colors.grey, fontSize: 12)),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: const [
                          Icon(Icons.remove_red_eye, color: Colors.grey, size: 20),
                          Text(" 15.4k مشاهدة", style: TextStyle(fontSize: 13)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          // قائمة الفصول
          Expanded(
            child: ListView.builder(
              itemCount: 20, // عدد الفصول تجريبي
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.pink[50],
                    child: Text("${index + 1}", style: const TextStyle(color: Colors.pink)),
                  ),
                  title: Text("الفصل رقم ${index + 1}"),
                  subtitle: const Text("تم الرفع: منذ يومين"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.remove_red_eye, size: 14, color: Colors.grey),
                      const Text(" 450 ", style: TextStyle(fontSize: 12)),
                      const SizedBox(width: 10),
                      IconButton(
                        icon: const Icon(Icons.download_for_offline, color: Colors.pinkAccent),
                        onPressed: () {
                          // تشغيل نظام التحميل والإعلانات (4 مجاني ثم إعلان)
                          DownloadManager.processDownload(context, "الفصل ${index + 1}", () {
                            print("بدأ التحميل بنجاح!");
                          });
                        },
                      ),
                    ],
                  ),
                  onTap: () {
                    // الانتقال لصفحة القارئ
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
} 
