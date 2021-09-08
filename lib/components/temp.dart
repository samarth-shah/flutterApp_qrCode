import 'package:flutter/material.dart';
import '../screens/result.dart';
import 'package:barcode_scan_fix/barcode_scan.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Freshers Scanner',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ).copyWith(textTheme: GoogleFonts.quicksandTextTheme()),
      //initialRoute: Results.routeName,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        Results.routeName: (context) => Results(),
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
        //backgroundColor: Colors.deepPurple.shade700,
        title: Text(
          'Freshers 2021',
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color(0xFF1D0E1D),
          image: new DecorationImage(
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
              color: Color(0xFF510A32),
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
                  color: Color(0xFFC72C41),
                  fontSize: 20,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                    // color: Color(0xFFC72C41),
                    ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}

/*import 'package:flutter/material.dart';
import 'result.dart';
import 'package:barcode_scan_fix/barcode_scan.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Freshers Scanner',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ).copyWith(textTheme: GoogleFonts.quicksandTextTheme()),
      //initialRoute: Results.routeName,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        Results.routeName: (context) => Results(),
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
        //backgroundColor: Colors.deepPurple.shade700,
        title: Text(
          'Freshers 2021',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Color(0xFF1D0E1D),
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'assets/images/freshersPoster.png',
              fit: BoxFit.fitHeight,
            ),
            SizedBox(
              height: 50,
            ),
            FlatButton(
              color: Color(0xFF510A32),
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
                  color: Color(0xFFC72C41),
                  fontSize: 20,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  // color: Color(0xFFC72C41),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/
