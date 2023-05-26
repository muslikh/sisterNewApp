// // // import 'package:flutter/material.dart';
// // // import 'package:http/http.dart' as http;
// // // import 'dart:convert';

// // // void main() {
// // //   runApp(MyApp());
// // // }

// // // class MyApp extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       debugShowCheckedModeBanner: false,
// // //       home: BelajarNavBar(),
// // //     );
// // //   }
// // // }

// // // class BelajarNavBar extends StatefulWidget {
// // //   @override
// // //   _BelajarNavBarState createState() => _BelajarNavBarState();
// // // }

// // // class _BelajarNavBarState extends State<BelajarNavBar> {
// // //   int _selectedNavbar = 0;

// // //   void _changeSelectedNavBar(int index) {
// // //     setState(() {
// // //       _selectedNavbar = index;
// // //     });
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text("belajarFlutter.com"),
// // //       ),
// // //       body: Center(
// // //         child: Text("Tab Index yang aktif : $_selectedNavbar",
// // //             style: TextStyle(fontSize: 16)),
// // //       ),
// // //       bottomNavigationBar: BottomNavigationBar(
// // //         items: const <BottomNavigationBarItem>[
// // //           BottomNavigationBarItem(
// // //             icon: Icon(Icons.home),
// // //             title: Text('Beranda'),
// // //           ),
// // //           BottomNavigationBarItem(
// // //             icon: Icon(Icons.assignment),
// // //             title: Text('Pesanan'),
// // //           ),
// // //           BottomNavigationBarItem(
// // //             icon: Icon(Icons.mail),
// // //             title: Text('Inbox'),
// // //           ),
// // //           BottomNavigationBarItem(
// // //             icon: Icon(Icons.person),
// // //             title: Text('Akun'),
// // //           ),
// // //         ],
// // //         currentIndex: _selectedNavbar,
// // //         selectedItemColor: Colors.green,
// // //         unselectedItemColor: Colors.grey,
// // //         showUnselectedLabels: true,
// // //         onTap: _changeSelectedNavBar,
// // //       ),
// // //     );
// // //   }
// // // }


// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;
// // import 'dart:convert';
// // void main() {
// //   runApp(MaterialApp(
// //     home: BelajarGetData(),
// //   ));
// // }
// // class BelajarGetData extends StatelessWidget {
// //   final String apiUrl = "https://reqres.in/api/users?per_page=15";
// //   Future<List<dynamic>> _fecthDataUsers() async {
// //     var result = await http.get(Uri.parse(apiUrl));
// //     return json.decode(result.body)[''];
// //   }
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Belajar GET HTTP'),
// //       ),
// //       body: Container(
// //         child: FutureBuilder<List<dynamic>>(
// //           future: _fecthDataUsers(),
// //           builder: (BuildContext context, AsyncSnapshot snapshot) {
// //             if (snapshot.hasData) {
// //               return ListView.builder(
// //                   padding: EdgeInsets.all(10),
// //                   itemCount: snapshot.data.length,
// //                   itemBuilder: (BuildContext context, int index) {
// //                     return ListTile(
// //                       // leading: CircleAvatar(
// //                       //   radius: 30,
// //                       //   backgroundImage:
// //                       //       NetworkImage(snapshot.data[index]['nama_aplikasi']),
// //                       // ),
// //                       title: Text(snapshot.data[index]['nama_aplikasi'] + " " + snapshot.data[index]['alamat_sekolah']),
// //                       subtitle: Text(snapshot.data[index]['pts_online']),
// //                     );
// //                   });
// //             } else {
// //               return Center(child: CircularProgressIndicator());
// //             }
// //           },
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import 'package:http/http.dart';
// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({Key? key}) : super(key: key);

//   @override
//   _SignUpScreenState createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {

//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();

//   void login(String email , password) async {
    
//     try{
      
// Response response = await post(
//         Uri.parse('http://sister.smkn1prigen.sch.id/'),
//         body: {
//           'email' : 'eve.holt@reqres.in',
//           'password' : 'cityslicka'
//         }
//       );

//       if(response.statusCode == 200){
        
//         var data = jsonDecode(response.body.toString());
//         print(data['token']);
//         print('Login successfully');

//       }else {
//         print('failed');
//       }
//     }catch(e){
//       print(e.toString());
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Sign Up Api'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextFormField(
//               controller: emailController,
//               decoration: InputDecoration(
//                 hintText: 'Email'
//               ),
//             ),
//             SizedBox(height: 20,),
//             TextFormField(
//               controller: passwordController,
//               decoration: InputDecoration(
//                   hintText: 'Password'
//               ),
//             ),
//             SizedBox(height: 40,),
//             GestureDetector(
//               onTap: (){
//                 login(emailController.text.toString(), passwordController.text.toString());
//               },
//               child: Container(
//                 height: 50,
//                 decoration: BoxDecoration(
//                   color: Colors.green,
//                   borderRadius: BorderRadius.circular(10)
//                 ),
//                 child: Center(child: Text('Login'),),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:sister/screen/home.dart';
import 'package:sister/screen/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: CheckAuth(),
      darkTheme: ThemeData(brightness: Brightness.dark, accentColor: Colors.blueAccent),
      themeMode: ThemeMode.dark,
    );
  }
}
class CheckAuth extends StatefulWidget{
  @override
  _CheckAuthState createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth>{
  bool isAuth = false;

  @override
  void initState(){
    super.initState();
    _checkIfLoggedIn();
  }

  void _checkIfLoggedIn() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    if(token != null){
      if(mounted){
        setState(() {
          isAuth = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context){
    Widget child;
    if(isAuth){
      child = Home();
    } else{
      child = Login();
    }

    return Scaffold(
      body: child,
    );
  }
}