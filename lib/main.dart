import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // ستحتاجين لإضافة هذه المكتبة في pubspec.yaml لاحقاً لفتح الروابط الحقيقية

void main() => runApp(const SamaqApp());

class SamaqApp extends StatelessWidget {
  const SamaqApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SAMAQ TEAM',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFF0F0F0F),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.blueAccent, centerTitle: true),
      ),
      home: const MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});
  @override
  _MainNavigationState createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int availableDownloads = 4;
  double earningsUSDT = 0.00; // رصيد الأرباح الحقيقي (رقمي)
  
  // ملاحظة: ضعي رابط الإعلان الخاص بكِ هنا من موقع Adsterra أو A-Ads لاحقاً
  final String adLink = "https://www.google.com"; 

  void _handleAction(String type) {
    if (type == "download") {
      if (availableDownloads > 0) {
        setState(() => availableDownloads--);
        _showToast("تم بدء التحميل بنجاح!");
      } else {
        _showAdDialog();
      }
    }
  }

  void _showAdDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("احصل على مكافأة"),
        content: const Text("شاهد إعلان لزيادة التحميلات والحصول على أرباح USDT"),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("إلغاء")),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            onPressed: () {
              // محاكاة لفتح الرابط وجني الأرباح
              setState(() {
                availableDownloads += 2;
                earningsUSDT += 0.05; // ربح افتراضي عن كل مشاهدة
              });
              Navigator.pop(context);
              _showToast("تمت إضافة 2 تحميل و 0.05 USDT لرصيدك!");
            },
            child: const Text("مشاهدة الربح"),
          ),
        ],
      ),
    );
  }

  void _showToast(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg), backgroundColor: Colors.blueAccent));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SAMAQ TEAM - v1.0")),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Colors.blueAccent),
              accountName: const Text("فريق سماق للترجمة", style: TextStyle(fontWeight: FontWeight.bold)),
              accountEmail: Text("رصيدك الحالي: ${earningsUSDT.toStringAsFixed(2)} USDT"),
              currentAccountPicture: const CircleAvatar(backgroundColor: Colors.white, child: Icon(Icons.currency_bitcoin, color: Colors.orange, size: 40)),
            ),
            ListTile(leading: const Icon(Icons.download, color: Colors.blue), title: Text("التحميلات المتاحة: $availableDownloads")),
            ListTile(leading: const Icon(Icons.account_balance_wallet, color: Colors.green), title: const Text("سحب الأرباح (USDT)")),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("نظام الأرباح الرقمية مفعل ✅", style: TextStyle(color: Colors.grey, fontSize: 10)),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // واجهة القارئ التجريبية مع العلامة المائية
            for (int i = 1; i <= 3; i++)
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    margin: const EdgeInsets.all(8),
                    height: 400,
                    width: double.infinity,
                    color: Colors.grey[900],
                    child: Center(child: Text("صفحة المانهوا $i", style: const TextStyle(color: Colors.white24))),
                  ),
                  const Positioned(
                    bottom: 30, right: 30,
                    child: Text("SAMAQ TEAM", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 18, opacity: 0.5)),
                  ),
                ],
              ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15)),
              onPressed: () => _handleAction("download"),
              icon: const Icon(Icons.cloud_download),
              label: const Text("تحميل الفصل الآن"),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
