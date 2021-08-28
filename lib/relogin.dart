import 'package:example/renext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class reMyHomePage extends StatefulWidget {
  reMyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<reMyHomePage> {
  TextEditingController _phone = TextEditingController();
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xff6885e3), Color(0xffffffff)],
                end: Alignment.bottomCenter,
                begin: Alignment.topCenter,
                stops: [0.0, 1.2]),
          ),
          child: Container(
            child: SafeArea(
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: NestedScrollView(
                    floatHeaderSlivers: true,
                    headerSliverBuilder: (context, innerBoxIsScrolled) => [
                          SliverAppBar(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            leading: IconButton(
                              icon: Icon(Icons.arrow_back_ios),
                              iconSize: 30,
                              onPressed: () {
                                SystemNavigator.pop();
                              },
                            ),
                          ),
                        ],
                    body: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 100,
                          ),
                          Text(
                            "الرقم الجديد",
                            style: TextStyle(
                              fontFamily: "Cairo",
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                              color: Color(0xff202936),
                            ),
                          ),
                          SizedBox(
                            height: 100,
                          ),
                          Container(
                            padding: EdgeInsets.all(20),
                            child: Form(
                              key: _formkey,
                              child: Column(
                                children: [
                                  //child:

                                  TextFormField(
                                    validator: (_phone) {
                                      if (_phone.toString().length < 10) {
                                        return 'أدخل عشر ارقام ';
                                      } else {
                                        return null;
                                      }
                                    },
                                    controller: _phone,
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        color: Color(0xff6885e3)),
                                    keyboardType: TextInputType.phone,
                                    textAlign: TextAlign.right,
                                    maxLength: 10,
                                    decoration: InputDecoration(
                                      fillColor:
                                          Color(0xffffffff).withOpacity(0.5),
                                      // enabled: true,
                                      prefixIcon: Icon(
                                        Icons.phone,
                                        size: 30,
                                        color: Color(0xff6885e3),
                                      ),

                                      labelText: "رقم الهاتف ",
                                      //  errorText: _emp,
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        borderSide: BorderSide(
                                          width: 2,
                                          color: Colors.red,
                                        ),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        borderSide: BorderSide(
                                          width: 2,
                                          color: Colors.red,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        borderSide: BorderSide(
                                          width: 2,
                                          color: Color(0xff6885e3),
                                        ),
                                      ),

                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        borderSide: BorderSide(
                                          width: 2,
                                          color: Color(0xff6885e3),
                                        ),
                                      ),
                                      filled: true,
                                      labelStyle: TextStyle(
                                        fontFamily: "Cairo",
                                        height: 0.6,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color:
                                            Color(0xff202936).withOpacity(0.9),
                                      ),
                                    ),
                                  ),

                                  //  ),
                                  SizedBox(
                                    height: 90,
                                  ),
                                  Container(
                                    width: 250,
                                    decoration: BoxDecoration(
                                      color: Color(0xff6885e3),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: RaisedButton(
                                      color: Colors.transparent,
                                      elevation: 0,
                                      onPressed: () {
                                        setState(() {
                                          if (_formkey.currentState!
                                              .validate()) {
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    elevation: 0.8,
                                                    backgroundColor: Colors
                                                        .white
                                                        .withOpacity(0.9),
                                                    actionsPadding:
                                                        EdgeInsets.only(
                                                            bottom: 20),
                                                    contentPadding:
                                                        EdgeInsets.only(
                                                      top: 0,
                                                    ),
                                                    contentTextStyle: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.black),
                                                    content: Container(
                                                      height: 150,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            "تأكد من معلوماتك ",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "Cairo"),
                                                          ),
                                                          SizedBox(
                                                            height: 20,
                                                          ),
                                                          Text(
                                                              "${_phone.text}"),
                                                        ],
                                                      ),
                                                    ),
                                                    actions: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Container(
                                                            height: 30,
                                                            child: FlatButton(
                                                              child: Text(
                                                                'نعم',
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        "Cairo"),
                                                              ),
                                                              onPressed: () {
                                                                Navigator.pushReplacement(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder:
                                                                            (context) =>
                                                                                reNext(ph: _phone.text)));
                                                              },
                                                            ),
                                                            width: 100,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xff6885e3),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                          ),
                                                          Container(
                                                            height: 30,
                                                            child: FlatButton(
                                                              child: Text(
                                                                'لا',
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        "Cairo"),
                                                              ),
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                            ),
                                                            width: 100,
                                                            decoration:
                                                                BoxDecoration(
                                                              gradient: LinearGradient(
                                                                  colors: [
                                                                    Color(
                                                                        0xff6885e3),
                                                                    Color(
                                                                        0xffffffff)
                                                                  ],
                                                                  begin: Alignment
                                                                      .bottomRight,
                                                                  end: Alignment
                                                                      .topLeft,
                                                                  stops: [
                                                                    0,
                                                                    1
                                                                  ]),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16),
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  );
                                                });
                                          }
                                        });
                                      },
                                      child: Text(
                                        "التالي",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: "Cairo",
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30,
                                          color: Color(0xffffffff),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 100,
                          ),
                        ],
                      ),
                    )),
              ),
            ),
          ),
        ),
        onWillPop: () {
          SystemNavigator.pop();
          return Future.value(false);
        });
  }
}
