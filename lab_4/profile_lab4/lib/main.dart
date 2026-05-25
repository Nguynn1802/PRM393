import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sakura Profile',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFBC6D0),
          primary: const Color(0xFFF3A3B6),
          secondary: const Color(0xFFE88A9E),
        ),
        useMaterial3: true,
      ),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF9FA),
      appBar: AppBar(
        title: const Text(
          'プロフィール (Hồ Sơ)', 
          style: TextStyle(fontWeight: FontWeight.w600, letterSpacing: 1.2, fontSize: 20)
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFF3A3B6),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                    image: DecorationImage(
                      image: AssetImage('assets/sakura_banner.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 115,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 4),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.pink.withOpacity(0.12),
                          blurRadius: 12,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: const CircleAvatar(
                      radius: 55,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('assets/avatar.jpg'), 
                    ),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 65),

            const Text(
              'Trần Nguyên',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4A3E41),
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'BrSE (Bridge Software Engineer)',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF8A7A7D),
                fontWeight: FontWeight.w500,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 12),
            
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFFFFEAEF),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Text(
                '11:11',
                style: TextStyle(
                  fontSize: 14, 
                  color: Color(0xFFD06A82), 
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                ),
              ),
            ),
            
            const SizedBox(height: 20),
            const Divider(indent: 40, endIndent: 40, color: Color(0xFFFFE1E6)),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  _buildJapanStyleCard(
                    icon: Icons.alternate_email_rounded,
                    title: 'メール (Email)',
                    value: 'trannguyen47.dev@gmail.com',
                  ),
                  _buildJapanStyleCard(
                    icon: Icons.phone_android_rounded,
                    title: '電話番号 (Số điện thoại)',
                    value: '+84 368940724',
                  ),
                  _buildJapanStyleCard(
                    icon: Icons.cake_outlined,
                    title: '生年月日 (Ngày sinh)',
                    value: '04/07/2004',
                  ),
                  _buildJapanStyleCard(
                    icon: Icons.location_on_outlined,
                    title: '住居地 (Địa chỉ)',
                    value: 'Đà Nẵng, Việt Nam',
                  ),
                  _buildJapanStyleCard(
                    icon: Icons.auto_awesome_outlined,
                    title: 'スキル (Kỹ năng)',
                    value: 'Flutter, Dart, T-SQL (SQL Server)',
                  ),
                  
                  const SizedBox(height: 30),
                  
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_border_rounded, size: 18),
                    label: const Text('プロフィールを編集', style: TextStyle(fontWeight: FontWeight.w600)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE88A9E),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildJapanStyleCard({required IconData icon, required String title, required String value}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFF3A3B6).withOpacity(0.06),
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: Color(0xFFFFEAEF),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: const Color(0xFFE88A9E), size: 20),
        ),
        title: Text(
          title,
          style: const TextStyle(fontSize: 12, color: Color(0xFFB1A1A4), fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          value,
          style: const TextStyle(fontSize: 15, color: Color(0xFF5A4C50), fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}