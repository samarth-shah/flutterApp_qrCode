import 'package:sms/sms.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:qr_code/components/dataReceiver.dart';

//otp sender temp file

class Otp extends StatefulWidget {
  static final routeName = '/otp';

  @override
  _OtpState createState() => _OtpState();
}

DataReceiver dataReceiver = new DataReceiver();

class _OtpState extends State<Otp> {
  late int _otp, _minOtpValue, _maxOtpValue;
  late String _otpEntered, readString = ' ', _phoneNumber = '';
  late bool check = false, flag = false;

  void generateOtp([int min = 1000, int max = 9999]) {
    //Generates four digit OTP by default
    _minOtpValue = min;
    _maxOtpValue = max;
    _otp = _minOtpValue + Random().nextInt(_maxOtpValue - _minOtpValue);
  }

  void getNumber() async {
    var number = await dataReceiver.passNumber();
    setState(() {
      _phoneNumber = number;
    });
    print(_phoneNumber);
  }

  void sendOtp(
      [String phoneNumber = '',
      String messageText = 'Your OTP is ',
      int min = 1000,
      int max = 9999,
      String countryCode = '+91']) {
    getNumber();
    //function parameter 'message' is optional.
    generateOtp(min, max);
    SmsSender sender = new SmsSender();
    String address = countryCode + _phoneNumber;
    sender.sendSms(new SmsMessage(address, messageText + _otp.toString()));
    print(_otp.toString());
  }

  bool resultChecker(String enteredOtp) {
    //To validate OTP
    return enteredOtp == _otp.toString();
  }

  @override
  void initState() {
    super.initState();
    sendOtp();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF801336),
          //backgroundColor: Colors.deepPurple.shade700,
          title: Text(
            'OTP Screen',
          ),
          centerTitle: true,
        ),
        body: Container(
          color: Color(0xFF510A36),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter OTP Here',
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(),
                  disabledBorder: OutlineInputBorder(),
                ),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
                onChanged: (value) {
                  _otpEntered = value.toString();
                },
              ),
              SizedBox(
                height: 30,
              ),
              RaisedButton(
                color: Color(0xFF801336),
                textColor: Colors.white,
                onPressed: () {
                  setState(() {
                    if (resultChecker(_otpEntered)) {
                      check = true;
                      readString = 'OTP verified !!';
                      flag = true;
                      //Navigator.of(context).pushReplacementNamed('/');
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    } else {
                      check = false;
                      readString = 'OTP not verified !!';
                      flag = false;
                    }
                  });
                },
                child: Text('Check OTP'),
              ),
              SizedBox(
                height: 20,
              ),
              flag
                  ? Text(
                      '$readString',
                      style: TextStyle(
                        fontSize: 34,
                        color: Colors.green,
                      ),
                    )
                  : Text(
                      '$readString',
                      style: TextStyle(
                        fontSize: 34,
                        color: Colors.red,
                      ),
                    )
            ],
          ),
        ));
  }
}
