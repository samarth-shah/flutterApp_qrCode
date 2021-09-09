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
  var userName = 'null';
  var userNumber = '';
  var resultBool = 'false';

  DataReceiver dataReceiver = new DataReceiver();

  //pass arg in this and get name and change name in app
  void getNameFromApi() async {
    //todo: send arg to dataReceiver.passName() and then return name
    var name = await dataReceiver.passName();
    var number = await dataReceiver.passNumber();
    setState(() {
      userName = name;
      userNumber = number;
    });
  }

  @override
  void initState() {
    super.initState();
    getNameFromApi();
  }

  Widget build(BuildContext context) {
    //token is stored in arg
    final arg = ModalRoute.of(context)!.settings.arguments as String;
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
              SizedBox(
                height: 30,
              ),
              /*Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  arg,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),*/
              SizedBox(
                height: 30,
              ),
              FlatButton(
                height: 50,
                minWidth: 120,
                color: Colors.green,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.of(context).pop();
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
                },
                child: Text(
                  'No',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
