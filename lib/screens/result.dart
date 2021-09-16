import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_code/screens/otp_sender.dart';
import '../components/dataReceiver.dart';

class Results extends StatefulWidget {
  static final routeName = '/results';

  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  var userName = '';
  var userNumber = '';
  var resultBool = 'false';
  var uCode = '';
  bool flag = false;
  bool isLoading=true;

  DataReceiver dataReceiver = new DataReceiver();

  void getNameFromApi() async {
    var name = await dataReceiver.passName();
    var number = await dataReceiver.passNumber();
    var ucode = await dataReceiver.passUCode();

    setState(() {
      isLoading=false;
      userName = name;
      userNumber = number;
      uCode = ucode;
    });
  }

  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)!.settings.arguments as String;
    print(arg);
    if (!flag) {
      dataReceiver.getJwtCode(arg);
      setState(() {
        flag = true;
      });
      getNameFromApi();
    }
    print('name = $userName number = $userNumber ucode = $uCode');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2D172D),
        title: Text(
          'Results',
          style: GoogleFonts.raleway(
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              )),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Color(0xFF1D0E1D),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isLoading?CircularProgressIndicator(color: Colors.white,):Column(
                  children: [
                    Container(
                      child: Text(
                        userName,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: Text(
                        userNumber,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                        ),
                      ),
                    ),
                  ]),
              SizedBox(
                height: 30,
              ),
              FlatButton(
                height: 50,
                minWidth: 120,
                color: Colors.green,
                textColor: Colors.white,
                onPressed: () {
                  print(uCode);
                  dataReceiver.passUcode();
                  Navigator.of(context).pop();
                  setState(() {
                    flag = false;
                  });
                },
                child: Text(
                  'Yes',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FlatButton(
                height: 50,
                minWidth: 120,
                color: Colors.redAccent,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.of(context).pushNamed(Otp.routeName);
                  setState(() {
                    flag = false;
                  });
                },
                child: Text(
                  'No',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                arg,
                style: TextStyle(
                  color: Color(0xFF2A112D),
                  fontSize: 6,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
