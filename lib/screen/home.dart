import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sister/network/api.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'login.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String name = '';

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
      backgroundColor: Color(0xff151515),
      // appBar: AppBar(
      //   centerTitle: false,
      //   title:Column(
      //     children: [
      //       RichText(
      //       text: TextSpan(
      //           text: "Wercome Back,",
      //           style: TextStyle(
      //             fontSize: 16,
      //           ),
      //           children: [
      //         TextSpan(
      //             text: '${name}',
      //             style: TextStyle(
      //               fontSize: 18,
      //               fontWeight: FontWeight.bold,
      //             )
      //             )
      //       ]
      //       )
      //       )
      //       ]
      //       ,),
      //   //
      //   backgroundColor: Color(0xFFEC2028),
      //   elevation: 0,
      //   automaticallyImplyLeading: false,
      //   actions: [
      //     GestureDetector(
      //       onTap: () {},
      //       child: Container(
      //         margin: EdgeInsets.only(right: 20),
      //         width: 30,
      //         height: 30,
      //         child: Image.asset(
      //           "assets/icons/qr.png",
      //           fit: BoxFit.contain,
      //         ),
      //       ),
      //     )
      //     // IconButton(
      //     //   icon: Icon(Icons.logout_rounded),
      //     //   onPressed: () {
      //     //     logout();
      //     //   },
      //     // )
      //   ],
      // ),
      // body: SafeArea(
      //   child: Container(
      //     padding: EdgeInsets.all(15),
      //     child: Column(
      //       children: [
      //         Row(
      //           children: [
      //             Text(
      //               'Hello, ',
      //               style: TextStyle(
      //                 fontSize: 20,
      //               ),
      //             ),
      //             Text(
      //               '${name}',
      //               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      //             ),
      //           ],
      //         ),
      //         Row(
      //           children: [
      //             Column(
      //               children: [
      //                 Text("data")
      //               ],
      //             )
      //           ],
      //         )
      //       ],
      //     ),
      //   ),
      // ),
      body: Stack(children: [
        ClipPath(
          clipper: ClipPathClass(),
          child: Container(
            height: 250,
            width: Get.width,
            color: Color(0xFFEC2028),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: Column(children: [
            Container(
              height: Get.height * 0.42,
              color: Colors.green,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 12, left: 15),
                    height: 60,
                    width: Get.width,
                    color: Color(0xFFE52D27),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                                textAlign: TextAlign.right,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Wercome Back,",
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                )),
                            RichText(
                                text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '${name}',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                )
                              ],
                            )),
                          ],
                        ),
                        IconButton(
                          icon: Icon(Icons.logout_rounded),
                          onPressed: () {
                            logout();
                          },
                        )
                      ],
                    ),
                  ),
                  ClipPath(
                    clipper: ClipInfoClass(),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 25),
                      height: 200,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                        Color(0xFFE52D27),
                        Color(0xFFB31217),
                      ])),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 7,
              color: Colors.grey[200],
            ),
            Expanded(
              child: Container(
                height: 100,
                color: Colors.purple,
              ),
            )
          ]),
        )
      ]),
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

class ClipPathClass extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 60);

    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 60,
    );
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => false;
}

class ClipInfoClass extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width - 80, size.height);
    path.lineTo(size.width, size.height - 80);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => false;
}
