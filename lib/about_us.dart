import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ກ່ຽວກັບພວກເຮົາ'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bundit Store',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Bundit Store ແມ່ນຮ້ານຄ້າຄົບວົງຈອນກ່ຽວກັບອຸປະກອນໄຟຟ້າ ເຮົາມີຜະລິດຕະພັນທີ່ຫຼາກຫຼາຍປະກອບມີດັ່ງນີ້: smartphones, laptops, tablets, and smart watches.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              'ສະມາຊິກໃນກຸ່ມ ຫ້ອງ 2IT_CON1',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'ທ້າວ ຄຳພຸດ ຜາທອງ',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'ທ້າວ ທັດສະພອນ ຈັນທະວົງ',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'ທ້າວ ພາລັດດາ ສີປະເສີດ',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'ນາງ ສຸດທິດາ ທໍລະທາ',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
