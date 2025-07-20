import 'package:flutter/material.dart';
import 'package:flutter_day_6/screens/Home_Page.dart';

class AccountPage extends StatefulWidget {
  @override
  AccountPageP createState() => AccountPageP();
}

class AccountPageP extends State<AccountPage> {
  String firstName = '';
  String lastName = '';
  String email = '';
  String jobTitle = '';
  String address = '';
  String gender = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 29, 29, 29),
      appBar: AppBar(
        title: Text('Create Account'),
        backgroundColor: const Color.fromARGB(255, 68, 138, 255),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'First Name',
                labelStyle: TextStyle(color: Colors.white),
              ),
              onChanged: (value) {
                firstName = value;
              },
            ),
            SizedBox(height: 10),
            TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Last Name',
                labelStyle: TextStyle(color: Colors.white),
              ),
              onChanged: (value) {
                lastName = value;
              },
            ),
            SizedBox(height: 10),
            TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.white),
              ),
              onChanged: (value) {
                email = value;
              },
            ),
            SizedBox(height: 10),
            TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Job Title',
                labelStyle: TextStyle(color: Colors.white),
              ),
              onChanged: (value) {
                jobTitle = value;
              },
            ),
            SizedBox(height: 10),
            TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Address',
                labelStyle: TextStyle(color: Colors.white),
              ),
              onChanged: (value) {
                address = value;
              },
            ),
            SizedBox(height: 20),
            Text(' Gender',
                textHeightBehavior: TextHeightBehavior(),
                style: TextStyle(color: Colors.white)),
            DropdownButton<String>(
              dropdownColor: Colors.grey[800],
              value: gender.isNotEmpty ? gender : null,
              items: ['Male', 'Female'].map((gender) {
                return DropdownMenuItem(
                  value: gender,
                  child: Text(gender, style: TextStyle(color: Colors.white)),
                );
              }).toList(),
              onChanged: (val) {
                setState(() {
                  gender = val!;
                });
              },
            ),
            SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 68, 138, 255),
              ),
              child: Text('Save Account'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomePage(
                            firstName: firstName,
                            lastName: lastName,
                            email: email,
                            jobTitle: jobTitle,
                            address: address,
                            gender: gender,
                          )),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
