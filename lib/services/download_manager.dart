import 'package:flutter/material.dart';

class DownloadManager {
  static int freeDownloadsLeft = 4; // العداد الابتدائي 4 فصول مجانية

  static void processDownload(BuildContext context, String chapterName, Function onDownloadComplete) {
    if (freeDownloadsLeft > 0) {
      // تنفيذ التحميل المجاني
      freeDownloadsLeft--;
      _showSnackBar(context, "تم تحميل $chapterName. المتبقي مجاناً: $freeDownloadsLeft");
      onDownloadComplete();
    } else {
      // طلب مشاهدة إعلان
      _showAdDialog(context, onDownloadComplete);
    }
  }

  static void _showAdDialog(BuildContext context, Function onDownloadComplete) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("انتهى التحميل المجاني"),
        content: Text("شاهد إعلان قصير لفتح 3 تحميلات إضافية مجاناً!"),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text("إلغاء")),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _simulateWatchingAd(context, onDownloadComplete);
            },
            child: Text("مشاهدة الإعلان"),
          ),
        ],
      ),
    );
  }

  static void _simulateWatchingAd(BuildContext context, Function onDownloadComplete) {
    // محاكاة لمشاهدة الإعلان
    _showSnackBar(context, "جاري تشغيل الإعلان... 📺");
    Future.delayed(Duration(seconds: 3), () {
      freeDownloadsLeft += 3; // منح 3 فصول إضافية
      _showSnackBar(context, "شكراً للمشاهدة! حصلت على 3 تحميلات إضافية.");
      onDownloadComplete();
    });
  }

  static void _showSnackBar(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
}
