import 'package:flutter/material.dart';

import '../../models/User.dart';
import '../../net_working/api_request.dart';

class RoundDetailPage extends StatefulWidget {
  final int userId;

  const RoundDetailPage({super.key, required this.userId});

  @override
  // ignore: library_private_types_in_public_api
  _RoundDetailPage createState() => _RoundDetailPage();
}

class _RoundDetailPage extends State<RoundDetailPage> {
  late Future<User> futureUser;

  @override
  void initState() {
    super.initState();
    futureUser = ApiServices.fetchDetail(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chi Tiết Cuoc Thi   '),
      ),
      body: FutureBuilder<User>(
        future: futureUser,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Lỗi: ${snapshot.error}'));
          } else {
            final user = snapshot.data;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/actor_1.png'), // Thay thế bằng hình ảnh của người dùng nếu có
                        fit: BoxFit.cover,
                      ),
                    ),
                    width: double.infinity,
                    height: 150.0,
                    alignment: Alignment.center,
                    child:
                        null, // Bạn có thể thêm các widget lớp phủ ở đây nếu cần.
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          user?.title ?? '',
                          style: const TextStyle(
                            fontSize: 24.0,
                            color: Colors.lightBlueAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          user?.body ?? '',
                          style: const TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        const Text(
                          'Thông tin chi tiết:',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.lightBlueAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          user?.body ?? '',
                          style: const TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        const Text(
                          'Thông tin chi tiết:',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.lightBlueAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          user?.body ?? '',
                          style: const TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: () {},
          child: Text(
            'Tham gia',
            style: isDarkMode
                ? Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(color: Colors.black)
                : Theme.of(context).textTheme.labelLarge,
          ),
        ),
      ),
    );
  }
}
