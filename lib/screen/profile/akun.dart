import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sister/network/api.dart';
import 'package:get/get.dart';
import 'dart:convert';
import '../home.dart';

class Akun extends StatefulWidget {
  @override
  _AkunState createState() => _AkunState();
}

class _AkunState extends State<Akun> {
  final _formKey = GlobalKey<FormState>();
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
    String Jk;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Ubah Data Akun",
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                // TextField(),
                TextFormField(
                  decoration: new InputDecoration(
                    labelText: "Nama Lengkap",
                    labelStyle: TextStyle(color: Colors.grey),
                    icon: Icon(
                      Icons.people,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          style: BorderStyle.solid, color: Colors.black),
                    ),
                  ),
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Nama tidak boleh kosong';
                    }
                    return null;
                  },
                ),

                TextFormField(
                  decoration: new InputDecoration(
                    labelText: "NISN",
                    labelStyle: TextStyle(color: Colors.grey),
                    icon: Icon(
                      Icons.people,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          style: BorderStyle.solid, color: Colors.black),
                    ),
                  ),
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'NISN tidak boleh kosong';
                    }
                    return null;
                  },
                ),

                TextFormField(
                  decoration: new InputDecoration(
                    labelText: "NIK / No. KTP",
                    labelStyle: TextStyle(color: Colors.grey),
                    icon: Icon(
                      Icons.people,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          style: BorderStyle.solid, color: Colors.black),
                    ),
                  ),
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'NIK tidak boleh kosong';
                    }
                    return null;
                  },
                ),

                TextFormField(
                  decoration: new InputDecoration(
                    labelText: "No. Telepon / HP",
                    labelStyle: TextStyle(color: Colors.grey),
                    icon: Icon(
                      Icons.people,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide:
                          const BorderSide(color: Colors.black, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: const BorderSide(color: Colors.red, width: 3),
                    ),
                  ),
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'No. Telepon tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                DropdownButtonFormField<String>(
                  icon: Icon(
                    Icons.people,
                    color: Colors.black,
                  ),
                  hint: const Text(
                    'Pilih Jenis Kelamin',
                    style: TextStyle(color: Colors.black),
                  ),
                  value: Jk,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide:
                          const BorderSide(color: Colors.black, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: const BorderSide(color: Colors.red, width: 3),
                    ),
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      Jk = newValue;
                    });
                  },
                  dropdownColor: Colors.white,
                  items: <String>['Laki - Laki', 'Perempuan']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(color: Colors.black),
                      ),
                    );
                  }).toList(),
                ),

                TextFormField(
                  decoration: new InputDecoration(
                    labelText: "Tempat Lahir",
                    labelStyle: TextStyle(color: Colors.grey),
                    icon: Icon(
                      Icons.people,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide:
                          const BorderSide(color: Colors.black, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: const BorderSide(color: Colors.red, width: 3),
                    ),
                  ),
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Tempat Lahir tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: TextEditingController(),
                  decoration: new InputDecoration(
                    labelText: "Tanggal Lahir",
                    labelStyle: TextStyle(color: Colors.grey),
                    icon: Icon(
                      Icons.date_range,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide:
                          const BorderSide(color: Colors.black, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: const BorderSide(color: Colors.red, width: 3),
                    ),
                  ),
                  readOnly: true,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  cursorColor: Colors.black,
                  onTap: () async {
                    final date = await showDatePicker(
                        context: context,
                        firstDate: DateTime(1960),
                        initialDate: DateTime.now(),
                        lastDate: DateTime(2100));
                    if (date != null) {
                      print(date);

                      setState(() {
                        selectedDate = date;
                        String convertedDateTime =
                            "${date.year.toString()}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
                        // widget.textController.value = TextEditingValue(text: picked.toString());
                        TextEditingController(text: convertedDateTime);
                        // widget.textController.value =
                        //     TextEditingValue(text: convertedDateTime);
                        // ;
                      });
                    }
                  },
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Tanggal Lahir tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                RaisedButton(
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.blue,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {}
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
