import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'login.dart';

class UserProfile extends StatefulWidget {
  final String userId;

  UserProfile({required this.userId});

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  Future<Map<String, dynamic>> fetchUserData() async {
    final response = await http.get(Uri.parse(
        'https://test-depoly-verel-api.vercel.app/user/me/${widget.userId}'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('ໂຫຼດຂໍ້ມູນຜູ້ໃຊ້ບໍ່ສຳເລັດ');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ໂປຣໄຟລ໌'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: fetchUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final userData = snapshot.data!;
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 0), // Add some space at the top
                  Image.asset(
                    'asset/icons/profile.png',
                    height: 90, // Adjust the height as needed
                  ),
                  SizedBox(height: 10),
                  Text('ໄອດີ: ${userData['_id']}'),
                  Text('ຊື່ຜູ້ໃຊ້: ${userData['username']}'),
                  // Add more fields as needed based on the API response
                  SizedBox(height: 20),
                  ElevatedButton(
                    child: Text('ອອກຈາກລະບົບ'),
                    onPressed: () {
                      // Perform logout actions here (e.g., clear user data)

                      // Navigate to LoginPage and remove all previous routes
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => LoginPage()),
                        (Route<dynamic> route) => false,
                      );
                    },
                  ),
                ],
              ),
            );
          } else {
            return Center(child: Text('ບໍ່ມີຂໍ້ມູນຜູ້ໃຊ້'));
          }
        },
      ),
    );
  }
}
