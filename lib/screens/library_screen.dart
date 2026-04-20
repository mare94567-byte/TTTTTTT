import 'package:flutter/material.dart';

class LibraryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("المكتبة"),
          bottom: TabBar(tabs: [Tab(text: "المفضلة"), Tab(text: "لاحقاً"), Tab(text: "سجل المشاهدة")]),
        ),
        body: TabBarView(
          children: [
            Center(child: Text("قائمة المفضلة")),
            Center(child: Text("أعمال ستقرأها لاحقاً")),
            ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => ListTile(
                title: Text("مانهوا شاهدتها سابقاً"),
                subtitle: Text("فصل 5"),
                trailing: IconButton(icon: Icon(Icons.delete), onPressed: () {}), // ميزة الحذف من السجل
              ),
            ),
          ],
        ),
      ),
    );
  }
}
