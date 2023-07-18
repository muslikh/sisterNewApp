import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sister/network/api.dart';
import 'package:get/get.dart';
import 'package:sister/screen/login.dart';
import 'package:sister/screen/profile/pribadi.dart';
import 'package:sister/screen/profile/listAkun.dart';
import 'package:sister/screen/profile/password.dart';
import 'dart:convert';
import '../home.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
          "Profil Saya",
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              width: Get.width,
              padding: EdgeInsets.only(top: 10, left: 10, right: 2, bottom: 10),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.grey, blurRadius: 2),
                ],
              ),
              child: Row(
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 56,
                        backgroundColor: Colors.red,
                        child: Padding(
                          padding: const EdgeInsets.all(8), // Border radius
                          child: ClipOval(
                              child: Image.asset('assets/icons/qr.png')),
                          // ClipOval(child: Image.network('imageUrl')),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${name}',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'muslikh32@gmail.com',
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '+6287709350000',
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
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
                        MaterialPageRoute(builder: (context) => Pribadi()),
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
                      "Koneksi Internet",
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
                        MaterialPageRoute(builder: (context) => Pribadi()),
                      );
                    },
                    child: Row(children: [
                      Icon(
                        Icons.person,
                        color: Colors.red,
                      ),
                      Text(
                        "Data Login Privos.Net",
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
                        "Penggunaan Internet",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
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
                ],
              ),
            ),

            //info lainyya
            Container(
              width: Get.width,
              padding: EdgeInsets.only(top: 2, left: 2, right: 2),
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
                      "Info Lainya",
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
                    onPressed: () {},
                    child: Row(children: [
                      Icon(
                        Icons.stars,
                        color: Colors.red,
                      ),
                      Text(
                        "Beri Rating",
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
                    onPressed: () {},
                    child: Row(children: [
                      Icon(
                        Icons.assignment,
                        color: Colors.red,
                      ),
                      Text(
                        "Syarat dan ketentuan",
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
                    onPressed: () {},
                    child: Row(children: [
                      Icon(
                        Icons.privacy_tip,
                        color: Colors.red,
                      ),
                      Text(
                        "Kebijakan Privasi",
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
                ],
              ),
            ),
            Container(
              width: Get.width,
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  padding: MaterialStateProperty.all(EdgeInsets.all(5)),
                  textStyle: MaterialStateProperty.all(TextStyle(fontSize: 14)),
                ),
                onPressed: () {
                  logout();
                },
                child: Row(children: [
                  Icon(
                    Icons.logout,
                    color: Colors.red,
                  ),
                  Text(
                    "Keluar",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  // Text("Likes", style: TextStyle(color: Colors.black))
                ]),
              ),
            )
          ],
        ),
      )),
    );
  }

  void logout() async {
    // var res = await Network().logout('logout');
    // var body = json.decode(res.body);
    // print(body);
    // if (body['status'] == 'ok') {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.remove('user');
    localStorage.remove('token');
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Login()));
    // } else {
    //   print("Gagal");
    // }
  }
}
