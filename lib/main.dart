import 'package:flutter/material.dart';
import 'package:qr_code/screens/otp_sender.dart';
import 'screens/result.dart';
import 'package:barcode_scan_fix/barcode_scan.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fresh Pancakes 💜',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ).copyWith(textTheme: GoogleFonts.quicksandTextTheme()),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        Results.routeName: (context) => Results(),
        Otp.routeName: (context) => Otp(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  String qrCodeResult = " ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2D172D),
        title: Text(
          'Freshers 2021',
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(50),
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage('assets/images/freshersPoster.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 50,
            ),
            FlatButton(
              //height: 180,
              color: Color(0xCC510A32),
              padding: EdgeInsets.all(15),
              onPressed: () async {
                String codeScanner =
                    await BarcodeScanner.scan(); //barcode scanner
                qrCodeResult = codeScanner;
                Navigator.of(context)
                    .pushNamed(Results.routeName, arguments: qrCodeResult);
              },
              child: Text(
                "Scan QR Code",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            SizedBox(
              height: 75,
            ),
          ],
        ),
      ),
    );
  }
}
