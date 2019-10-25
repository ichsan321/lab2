import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // state untuk satu class
  bool _isChecked = true; // variabel untuk ceklis box
  final TextEditingController _emcontroller =
      TextEditingController(); // declare variabel email
  String email = "";
  final TextEditingController _pscontroller =
      TextEditingController(); // declare variabel password
  String pass = "";

  @override
  Widget build(BuildContext context) {
    // membuat interface login
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      body: new Container(
        decoration: new BoxDecoration(
            image: new DecorationImage(
                image: AssetImage('asset/images/background1.jpg'),
                fit: BoxFit.fill)),
        padding: EdgeInsets.all(30.0), // jarak sisi tepi pada padding
        child: Column(
          // untuk foto
          mainAxisAlignment:
              MainAxisAlignment.center, // untuk mengatur tata letak widget
          children: <Widget>[
            Image.asset(
              'asset/images/mytolongbeli.png', // foto berdasarkan letaknay di folder tersebut
              scale: 2.5, // mengatur size foto
            ),

            TextField(
                // Email text
                controller: _emcontroller, // variabel email
                decoration: InputDecoration(
                    labelText: 'Email',
                    icon: Icon(Icons.email) // label email tampill
                    )),

            TextField(
              // password
              controller: _pscontroller,
              decoration: InputDecoration(
                  labelText: 'Password',
                  icon: Icon(Icons.lock) // label password tampil
                  ),
              obscureText:
                  true, // untuk membuat tanda bintang supuya tidak nampak
            ),

            Row(
              // untuk membuat cek box
              children: <Widget>[
                Checkbox(
                  value: _isChecked,
                  onChanged: (bool value) {
                    _onChange(value);
                  },
                ),

                Text('Remember Me ',
                    style: TextStyle(fontSize: 16)) // untuk tulisan saja
              ],
            ),
            SizedBox(
              height: 10,
            ), // ukuran pada cek box

            MaterialButton(
              // tombol buat login
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              minWidth: 300,
              height: 50,
              child: Text('LOGIN'),
              color: Color.fromRGBO(40, 206, 209, 1),
              textColor: Colors.white,
              elevation: 20,
              onPressed: _onPress, // nama variabel login button
            ),

            SizedBox(
              height: 20,
            ),
            Text("Register new account"),
            SizedBox(
              height: 10,
            ),
            Text('Forgot password')
          ],
        ),
      ),
    );
  }

  void _onPress() {
    // method untuk login button
    print(_emcontroller.text);
    print(_pscontroller.text);
    if (_checkEmail(_emcontroller.text)) {
      return;
    } else {
      print("Succes Login");
    }
  }

  bool _checkEmail(String email) {
    // method untuk cek email benar atau tidak
    bool emailValid =
        RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
    return emailValid;
  }

  void _onChange(bool value) {
    setState(() {
      _isChecked = value;
      print('Check value $value');
    });
  }
}
