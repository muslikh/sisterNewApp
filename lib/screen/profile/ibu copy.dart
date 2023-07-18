import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sister/network/api.dart';
import 'package:get/get.dart';
import 'dart:convert';
import '../home.dart';

class Ibu extends StatefulWidget {
  @override
  _IbuState createState() => _IbuState();
}

class _IbuState extends State<Ibu> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  bool _flag = true;

  String finalDate;

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
    DateTime selectedDate = new DateTime.now();
    TextEditingController _controller = new TextEditingController();
    // _controller.text = finalDate;

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
            padding: EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
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
                SizedBox(
                  height: 8,
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

                SizedBox(
                  height: 8,
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
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'NIK tidak boleh kosong';
                    }
                    return null;
                  },
                ),

                SizedBox(
                  height: 8,
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
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          style: BorderStyle.solid, color: Colors.black),
                    ),
                  ),
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'No. Telepon tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                DropdownButtonFormField<String>(
                  hint: const Text(
                    'Pilih Jenis Kelamin',
                    style: TextStyle(color: Colors.black),
                  ),
                  value: Jk,
                  decoration: InputDecoration(
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

                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  decoration: new InputDecoration(
                    labelText: "Tempat Lahir",
                    icon: Icon(
                      Icons.people,
                      color: Colors.grey,
                    ),
                    labelStyle: TextStyle(color: Colors.grey),
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
                      return 'Tempat Lahir tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _controller,
                  decoration: new InputDecoration(
                    labelText: "Tanggal Lahir",
                    icon: Icon(
                      Icons.date_range,
                      color: Colors.grey,
                    ),
                    labelStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          style: BorderStyle.solid, color: Colors.black),
                    ),
                  ),
                  readOnly: true,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  cursorColor: Colors.black,
                  onTap: () async {
                    final DateTime picked = await showDatePicker(
                        context: context,
                        initialDate: selectedDate,
                        initialDatePickerMode: DatePickerMode.day,
                        firstDate: DateTime(1985),
                        lastDate: DateTime(2024));
                    if (picked != null) {
                      String convertedDateTime =
                          "${picked.year.toString()}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
                      // finalDate = picked;
                      //assign the chosen date to the controller
                      _controller.text = convertedDateTime;
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

                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  decoration: new InputDecoration(
                    labelText: "Agama",
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
                      return 'Agama tidak boleh kosong';
                    }
                    return null;
                  },
                ),

                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  decoration: new InputDecoration(
                    labelText: "Kewarganegaraan",
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
                      return 'Kewarganegaraan tidak boleh kosong';
                    }
                    return null;
                  },
                ),

                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  decoration: new InputDecoration(
                    labelText: "Anak Ke",
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
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Anak Ke tidak boleh kosong';
                    }
                    return null;
                  },
                ),

                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  decoration: new InputDecoration(
                    labelText: "Jumlah Saudara Kandung",
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
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Jumlah Saudara Kandung tidak boleh kosong';
                    }
                    return null;
                  },
                ),

                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  decoration: new InputDecoration(
                    labelText: "Jumlah Saudara Tiri",
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
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Jumlah saudara tiri tidak boleh kosong';
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
