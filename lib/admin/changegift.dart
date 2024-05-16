import 'package:flutter/material.dart';
import 'package:insurance/admin/uploadgiftpage.dart';
import 'package:insurance/database/adminDatabase.dart';

class GiftDetailsPageWidget extends StatefulWidget {
  final String value;
  const GiftDetailsPageWidget({super.key, required this.value});

  @override
  _GiftDetailsPageWidgetState createState() => _GiftDetailsPageWidgetState();
}

class _GiftDetailsPageWidgetState extends State<GiftDetailsPageWidget> {
  final _formKey = GlobalKey<FormState>();
  AdminDatabase database = AdminDatabase();

  String value = '';
  String point = '';

  bool isDigitUsingTryParse(String input) {
    int? number = int.tryParse(input);
    return number != null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      top: true,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 430,
                height: 300,
                decoration: const BoxDecoration(
                  color: Color(0xFFFF0000),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 200, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                     Align(
                        alignment: AlignmentDirectional(0, 1),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: Text(
                            'Change Gift Details',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 35),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 412,
                height: 416,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(15, 20, 15, 0),
                      child: TextFormField(
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Enter cash value',
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFF0000),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          prefixIcon: const Icon(
                            Icons.attach_money,
                            size: 30,
                          ),
                        ),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Please enter the value!";
                          } else if (int.tryParse(val) == null) {
                            return "Please enter number only!";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (val) {
                          setState(() {
                            value = val;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(15, 20, 15, 10),
                      child: TextFormField(
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Enter points needed',
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFF0000),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          prefixIcon: const Icon(
                            Icons.star,
                            size: 30,
                          ),
                        ),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Please enter the value!";
                          } else if (int.tryParse(val) == null) {
                            return "Please enter number only!";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (val) {
                          setState(() {
                            point = val;
                          });
                        },
                      ),
                    ),
                    
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.fromLTRB(100, 10, 100, 10),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate() &&
                              point.isNotEmpty &&
                              value.isNotEmpty) {
                            await database.uploadCash(value, point);
                            await database.deleteGift(widget.value);
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                content: const Text(
                                    'The gift is uploaded successfully'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                UploadGiftPageWidget())),
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                        child: const Text(
                          "Update",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
