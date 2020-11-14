import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';
import 'package:yellowclass_assesment/HomeScreen.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phoneController = TextEditingController();

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    getUser().then((user) {
      if (user != null) {
        // send the user to the home page
        HomeScreen();
      }
    });
  }

  Future loginUser(String phone, BuildContext context) async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    _auth.verifyPhoneNumber(
      phoneNumber: phone,
      timeout: Duration(seconds: 60),
      verificationCompleted: (AuthCredential credential) async {
        Navigator.of(context).pop();

        UserCredential result = await _auth.signInWithCredential(credential);

        User user = result.user;

        if (user != null) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        } else {
          print("Error");
        }

        //This callback would gets called when verification is done automatically
      },
      verificationFailed: (Exception exception) {
        print(exception);
      },
      codeSent: (String verificationId, [int forceResendingToken]) {
        return showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 250),
                child: Container(
                    padding: const EdgeInsets.only(
                        top: 10, left: 3, right: 2, bottom: 10),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Enter your OTP : ",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        Image.asset(
                          "asset/otp-icon.png",
                          height: 100,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        PinEntryTextField(
                          fields: 6,
                          showFieldAsBox: false,
//                    fontSize: 5,
                          onSubmit: (String pin) async {
//                          final code = _codeController.text.trim();
                            AuthCredential credential =
                                PhoneAuthProvider.credential(
                                    verificationId: verificationId,
                                    smsCode: pin);

                            UserCredential result =
                                await _auth.signInWithCredential(credential);

                            User user = result.user;

                            if (user != null) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()));
                            } else {
                              print("Error");
                            }
                          },
                        ),
                      ],
                    )),
              ),
            );
          },
        );
      },
      codeAutoRetrievalTimeout: (String verificationID) {},
    );
  }

  Future<User> getUser() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    return await _auth.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.45,
                    decoration: BoxDecoration(
                      color: Colors.orangeAccent,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(36),
                          bottomRight: Radius.circular(36)),
                    ),
                  ),
                  Image.asset(
                    "asset/child.jpeg",
                    height: MediaQuery.of(context).size.height * 0.3,
                    fit: BoxFit.cover,
                  ),
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(36),
                            bottomRight: Radius.circular(36)),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(36),
                        child: Image.asset(
                          "asset/child.jpeg",
                          height: MediaQuery.of(context).size.height * 0.4,
                          fit: BoxFit.cover,
                        ),
                      )),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(36),
                            bottomRight: Radius.circular(36))),
                    height: MediaQuery.of(context).size.height * 0.4,
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 30, left: 30),
                    height: MediaQuery.of(context).size.height * 0.35,
                    child: Image.asset(
                      "asset/logo.png",
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.25,
                    left: MediaQuery.of(context).size.width * 0.03,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Live Activity Classes from top Masters",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          Text(
                            "To nurture your kids’ talents!",
                            style: TextStyle(color: Colors.white, fontSize: 19),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 30),
                child: Text(
                  "Enter Mobile Number",
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _phoneController,
                  validator: (input) {
                    if (input.length != 10) {
                      return ("Please enter a 10 digit phone number");
                    }
                    return "";
                  },
                  decoration: InputDecoration(
                    prefixText: "+91  ",
                    prefixStyle: TextStyle(color: Colors.black),
                    fillColor: Colors.white.withOpacity(0.1),
                    filled: true,
                    isDense: true,
                    focusColor: Color(0xffF29F05),
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),
                      ),
                      borderSide: new BorderSide(
                        color: Color(0xffF29F05),
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),
                      ),
                      borderSide: new BorderSide(
                        color: Color(0xffF29F05),
                        width: 1.0,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                child: RaisedButton(
                  elevation: 10,
                  child: Text(
                    "Send Otp",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  color: Colors.orangeAccent,
                  splashColor: Colors.yellow,
                  onPressed: () {
                    final phone = _phoneController.text.trim();
                    loginUser("+91" + phone, context);
                  },
                ),
              ),
              Center(
                child: RaisedButton(
                  elevation: 10,
                  child: Text(
                    "Skip Login",
                    style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  color: Colors.white,
                  focusElevation: 10,
                  splashColor: Colors.yellow,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20),
                        side: BorderSide(color: Colors.white)),
                    color: Colors.green,
                    child: Row(
                      children: [
                        Image.asset(
                          "asset/whatsapp.png",
                          width: 30,
                          height: 30,
                        ),
                        Text(
                          "Whatsapp",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )
                      ],
                    ),
                    onPressed: () {},
                  ),
                  RaisedButton(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20),
                        side: BorderSide(color: Colors.white)),
                    color: Colors.blue.shade500,
                    child: Row(
                      children: [
                        Icon(
                          Icons.whatshot,
                          color: Colors.white,
                        ),
                        Text(
                          "Join Session",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )
                      ],
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Center(child: Text("Ivypods Technology Pvt Ltd, 2020."))
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }
}
