import 'package:flutter/material.dart';

class MangaDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("تفاصيل المانهوا"), actions: [
        IconButton(icon: Icon(Icons.more_vert), onPressed: () {
          // هنا تظهر خيارات (المفضلة، قراءة لاحقاً)
        }),
      ]),
      body: Column(
        children: [
          // غلاف المانهوا ومعلوماتها
          Row(
            children: [
              Container(width: 120, height: 180, color: Colors.grey),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("اسم المانهوا", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      Text("المؤلف: ..."),
                      Text("المترجم: ..."),
                      Row(children: [Icon(Icons.star, color: Colors.yellow), Text(" 4.8 (200 تقييم)")]),
                      Row(children: [Icon(Icons.remove_red_eye), Text(" 12k مشاهدة")]),
                    ],
                  ),
                ),
              )
            ],
          ),
          Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => ListTile(
                title: Text("فصل ${index + 1}"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.remove_red_eye, size: 16), Text(" 500 "),
                    IconButton(icon: Icon(Icons.download), onPressed: () {
                      // نظام التحميل (4 مجاني ثم إعلان)
                    }),
                  ],
                ),
                onTap: () {
                  // الانتقال لصفحة القارئ
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
