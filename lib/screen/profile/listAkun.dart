import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sister/network/api.dart';
import 'package:get/get.dart';
import 'dart:convert';
import '../home.dart';

class ListAkun extends StatefulWidget {
  @override
  _NotifState createState() => _NotifState();
}

class _NotifState extends State<ListAkun> {
  bool _showList = false;
  String name = '';
  bool _flag = true;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  _loadUserData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    // var user = jsonDecode(localStorage.getString('user'));
    var user = localStorage.getString('nama');

    if (user != null) {
      setState(() {
        name = user;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Data Akun",
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Stack(
        children: [
          //Akun dan Keamanan
          Container(
            width: Get.width,
            padding: EdgeInsets.only(top: 10, left: 10, right: 2),
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.transparent,
              boxShadow: [
                BoxShadow(color: Colors.white, blurRadius: 2),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Akun dan Keamanan",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    textStyle:
                        MaterialStateProperty.all(TextStyle(fontSize: 14)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Akun()),
                    );
                  },
                  child: Row(children: [
                    Icon(
                      Icons.person,
                      color: Colors.red,
                    ),
                    Text(
                      "Lihat Biodata",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_right_outlined,
                      color: Colors.red,
                      size: 35,
                    )
                    // Text("Likes", style: TextStyle(color: Colors.black))
                  ]),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    textStyle:
                        MaterialStateProperty.all(TextStyle(fontSize: 14)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ListAkun()),
                    );
                  },
                  child: Row(children: [
                    Icon(
                      Icons.person,
                      color: Colors.red,
                    ),
                    Text(
                      "Ubah data akun",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_right_outlined,
                      color: Colors.red,
                      size: 35,
                    )
                    // Text("Likes", style: TextStyle(color: Colors.black))
                  ]),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    textStyle:
                        MaterialStateProperty.all(TextStyle(fontSize: 14)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Password()),
                    );
                  },
                  child: Row(children: [
                    Icon(
                      Icons.lock,
                      color: Colors.red,
                    ),
                    Text(
                      "Ubah Password",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_right_outlined,
                      color: Colors.red,
                      size: 35,
                    )
                    // Text("Likes", style: TextStyle(color: Colors.black))
                  ]),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    textStyle:
                        MaterialStateProperty.all(TextStyle(fontSize: 14)),
                  ),
                  onPressed: () => setState(() => _flag = !_flag),
                  child: Row(children: [
                    Icon(
                      Icons.fingerprint,
                      color: Colors.red,
                    ),
                    Text(
                      "Masuk Dengan Biometrik",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.normal),
                    ),
                    Spacer(),
                    Icon(
                      _flag ? Icons.toggle_off : Icons.toggle_on,
                      color: Colors.red,
                      size: 35,
                    )
                    // Text("Likes", style: TextStyle(color: Colors.black))
                  ]),
                ),
                // SwitchListTile(
                //   title: Text('Masuk Dengan Biometrik'),
                //   value: true,
                //   activeTrackColor: Colors.pink[100],
                //   activeColor: Colors.red,
                //   onChanged: (value) {},
                // ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
