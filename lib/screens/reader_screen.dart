import 'package:flutter/material.dart';

class ReaderScreen extends StatefulWidget {
  const ReaderScreen({super.key});

  @override
  _ReaderScreenState createState() => _ReaderScreenState();
}

class _ReaderScreenState extends State<ReaderScreen> {
  int availableDownloads = 4; // رصيد التحميلات

  void _handleDownload() {
    if (availableDownloads > 0) {
      setState(() => availableDownloads--);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("جاري التحميل... المتبقي لك $availableDownloads تحميلات مجانية"),
          backgroundColor: Colors.blue,
        ),
      );
    } else {
      _showAdDialog();
    }
  }

  void _showAdDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("انتهت التحميلات المجانية"),
        content: const Text("شاهد إعلان فيديو قصير للحصول على (2) تحميل إضافي الآن؟"),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("ليس الآن")),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            onPressed: () {
              Navigator.pop(context);
              setState(() => availableDownloads += 2);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("شكراً للمشاهدة! تمت إضافة 2 تحميل لرصيدك"), backgroundColor: Colors.green),
              );
            },
            child: const Text("مشاهدة الإعلان", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<String> reactions = ["😭", "✨", "💔", "🔥", "❤️", "😎", "😹", "😼"];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("الفصل 1"),
        backgroundColor: Colors.blueGrey[900],
        actions: [
          IconButton(icon: const Icon(Icons.file_download, color: Colors.blue), onPressed: _handleDownload),
          IconButton(icon: const Icon(Icons.share), onPressed: () {}),
        ],
      ),
      body: ListView(
        children: [
          for (int i = 1; i <= 3; i++)
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Image.network('https://via.placeholder.com/500x800', fit: BoxFit.width),
                Positioned(
                  bottom: 20, right: 20,
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
          const SizedBox(height: 20),
          // قسم التفاعلات
          Container(
            padding: const EdgeInsets.all(20),
            color: Colors.grey[900],
            child: Wrap(
              spacing: 15,
              alignment: WrapAlignment.center,
              children: reactions.map((e) => Text(e, style: const TextStyle(fontSize: 30))).toList(),
            ),
          ),
          // قسم التعليقات التجريبي
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text("التعليقات...", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
