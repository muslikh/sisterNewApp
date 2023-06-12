import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sister/network/api.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'login.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  // final List<grid.MenuItem> menuItem;
  // Home({Key key, @required this.menuItem}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
        // ClipPath(
        //   clipper: ClipPathClass(),
        //   child: Container(
        //     height: 250,
        //     width: Get.width,
        //     color: Color(0xFFEC2028),
        //   ),
        // ),
        Container(
          margin: EdgeInsets.only(top: 30),
          child: Column(children: [
            Container(
              height: Get.height * 0.42,
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 12, left: 15),
                    height: 60,
                    width: Get.width,
                    color: Colors.white,
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
                                        color: Colors.black,
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
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
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
                  // ClipPath(
                  //   clipper: ClipInfoClass(),
                  //   child: Container(
                  //     margin: EdgeInsets.symmetric(horizontal: 25),
                  //     height: 200,
                  //     decoration: BoxDecoration(
                  //         gradient: LinearGradient(colors: [
                  //       Color(0xFFE52D27),
                  //       Color(0xFFB31217),
                  //     ])),

                  //   ),
                  // )
                  Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.only(left: 15, right: 15, top: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          textAlign: TextAlign.right,
                          text: TextSpan(
                            text: 'Kartu Tanda Pelajar',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              radius: 56,
                              backgroundColor: Colors.red,
                              child: Padding(
                                padding:
                                    const EdgeInsets.all(8), // Border radius
                                child: ClipOval(
                                    child: Image.asset('assets/icons/qr.png')),
                                // ClipOval(child: Image.network('imageUrl')),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Text(
                                    '${name}',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Teknik Koputer Dan Jaringan',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    '3514100512200002',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Kelas XI TKJ 1',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              ' | ',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'Semester 2',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color.fromARGB(255, 250, 250, 4),
                      // boxShadow: [
                      //   BoxShadow(color: Colors.blue, spreadRadius: 3),
                      // ],
                    ),
                  )
                ],
              ),
            ),
            // Container(
            //   height: 7,
            //   color: Colors.grey[200],
            // ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            _flag ? Colors.red : Colors.teal),
                        padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                        textStyle:
                            MaterialStateProperty.all(TextStyle(fontSize: 18)),
                      ),
                      onPressed: () => setState(() => _flag = !_flag),
                      child: Column(children: [
                        Image.asset(
                          "assets/icons/qr.png",
                          fit: BoxFit.contain,
                        ),
                        Text(_flag ? 'Red' : 'Green'),
                        // Text("Likes", style: TextStyle(color: Colors.black))
                      ]),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            _flag ? Colors.red : Colors.teal),
                        padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                        textStyle:
                            MaterialStateProperty.all(TextStyle(fontSize: 18)),
                      ),
                      onPressed: () => setState(() => _flag = !_flag),
                      child: Column(children: [
                        Image.asset(
                          "assets/icons/qr.png",
                          fit: BoxFit.contain,
                        ),
                        Text(_flag ? 'Red' : 'Green'),
                        // Text("Likes", style: TextStyle(color: Colors.black))
                      ]),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            _flag ? Colors.red : Colors.teal),
                        padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                        textStyle:
                            MaterialStateProperty.all(TextStyle(fontSize: 18)),
                      ),
                      onPressed: () => setState(() => _flag = !_flag),
                      child: Column(children: [
                        Image.asset(
                          "assets/icons/qr.png",
                          fit: BoxFit.contain,
                        ),
                        Text(_flag ? 'Red' : 'Green'),
                        // Text("Likes", style: TextStyle(color: Colors.black))
                      ]),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            _flag ? Colors.red : Colors.teal),
                        padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                        textStyle:
                            MaterialStateProperty.all(TextStyle(fontSize: 18)),
                      ),
                      onPressed: () => setState(() => _flag = !_flag),
                      child: Column(children: [
                        Image.asset(
                          "assets/icons/qr.png",
                          fit: BoxFit.contain,
                        ),
                        Text(_flag ? 'Red' : 'Green'),
                        // Text("Likes", style: TextStyle(color: Colors.black))
                      ]),
                    ),
                  ),
                ],
              ),
            ),
            // child: IconButton(
            //     onPressed: () {
            //       if (mounted)
            //         setState(() {
            //           _showList = !_showList;
            //         });
            //     },
            //     icon: Icon(_showList ? Icons.grid_on : Icons.grid_off)),

            Container(
              height: 200,
              color: Colors.red,
              margin: EdgeInsets.all(5),
              child: CarouselBerita(),
            ),
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

class CarouselBerita extends StatelessWidget {
  List listBerita = [
    ['assets/ppdb.jpg', 'PPDB'],
    ['assets/ppdb.jpg', 'Info PPDB'],
    ['assets/ppdb.jpg', 'Info PPDB 2022 / 2023']
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        CarouselSlider(
          items: listBerita.map((i) {
            return Builder(builder: (BuildContext context) {
              return GestureDetector(
                child: Container(
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      // image: NetworkImage("url"),
                      image: AssetImage(i[0]),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            i[1],
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                },
              );
            });
          }).toList(),
          options: CarouselOptions(
            height: 150.0,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            viewportFraction: 0.8,
          ),
        ),
      ]),
    );
  }
}
