import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:Bundit_Store/main.dart';
import 'dart:convert';
import 'register.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';

  Future<String?> _login() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final response = await http.post(
        Uri.parse('https://test-depoly-verel-api.vercel.app/user/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': _username,
          'password': _password,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return responseData['_id']; // Adjust this based on actual API response
      } else {
        throw Exception('ເຂົ້າສູ່ລະບົບບໍ່ສຳເລັດ');
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ເຂົ້າສູ່ລະບົບ')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 0), // Add some space at the top
              Image.asset(
                'asset/icons/BunditStoreLogo.png',
                height: 90, // Adjust the height as needed
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'ຊື່ຜູ້ໃຊ້',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'ກະລຸນາປ້ອນຊື່ຜູ້ໃຊ້';
                  }
                  return null;
                },
                onSaved: (value) => _username = value!,
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'ລະຫັດຜ່ານ',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'ກະລຸນະປ້ອນລະຫັດຜ່ານ';
                  }
                  return null;
                },
                onSaved: (value) => _password = value!,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  try {
                    final _id = await _login();
                    if (_id != null) {
                      // Navigate to HomePage with userId
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyHomePage(userId: _id)),
                      );
                    }
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('ເຂົ້າສູ່ລະບົບລົ້ມເຫຼວ: $e')),
                    );
                  }
                },
                child: Text('ເຂົ້າສູ່ລະບົບ'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50), // full-width button
                ),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  // Navigate to RegisterPage
                  // You need to create this page and add the navigation
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
                child: Text('ລົງທະບຽນ'),
                style: TextButton.styleFrom(
                  minimumSize: Size(double.infinity, 50), // full-width button
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
