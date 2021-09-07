import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../dataReceiver.dart';

class Results extends StatefulWidget {
  static final routeName = '/results';

  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  var userName = 'null';

  DataReceiver dataReceiver = new DataReceiver();

  //pass arg in this and get name and change name in app
  void getNameFromApi() async {
    //todo: send arg to dataReceiver.passName() and then return name
    var name = await dataReceiver.passName();
    setState(() {
      userName = name;
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
              /*RaisedButton(
                onPressed: getNameFromApi,
                child: Text('Get Name'),
              ),
              SizedBox(
                height: 50,
              ),*/
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
                color: Colors.green,
                textColor: Colors.white,
                onPressed: () {},
                child: Text('Yes'),
              ),
              SizedBox(
                height: 20,
              ),
              FlatButton(
                color: Colors.redAccent,
                textColor: Colors.white,
                onPressed: () {},
                child: Text('No'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
