import 'package:flutter/material.dart';
import 'package:insurance/consultant/agentcustomerlist.dart';
import 'package:insurance/database/consultantDatabase.dart';

class AgentReviewPageWidget extends StatefulWidget {
  final String id;
  final String mykad;
  const AgentReviewPageWidget(
      {super.key, required this.id, required this.mykad});

  @override
  _AgentReviewPageWidgetState createState() => _AgentReviewPageWidgetState();
}

class _AgentReviewPageWidgetState extends State<AgentReviewPageWidget> {
  final _formKey = GlobalKey<FormState>();

  ConsultantDatabase database = ConsultantDatabase();

  String recommend = '';
  String benefit = '';
  String filename = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 418,
                  height: 160,
                  decoration: BoxDecoration(
                    color: Color(0xFFFF0202),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                    ),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Text(
                      'Review Report',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: ElevatedButton(
                          onPressed: () async {
                            final name = await database.getReportBasename();
                            setState(() {
                              filename = name;
                            });
                          },
                          child: Text(
                            'Upload review report',
                            style: TextStyle(
                              fontFamily: 'Readex Pro',
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: EdgeInsets.symmetric(horizontal: 24),
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          filename,
                          style: TextStyle(
                            fontFamily: 'Readex Pro',
                            color: Color(0xFF0094FF),
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Recommended Booster Package:',
                    style: TextStyle(
                      fontFamily: 'Readex Pro',
                      fontSize: 30,
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      maxLines: null,
                      decoration: InputDecoration(
                        labelText: 'Enter recommendation',
                        labelStyle: TextStyle(
                          fontSize: 18,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFFF0000),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
                        fontSize: 25,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter recommendation!";
                        } else {
                          return null;
                        }
                      },
                      onChanged: (value) {
                        setState(() {
                          recommend = value;
                        });
                      },
                    )),
                Align(
                  alignment: AlignmentDirectional(-1, 0),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Text(
                      'Benefit:',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Enter benefit',
                        labelStyle: TextStyle(
                          fontSize: 18,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFFF0000),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
                        fontSize: 25,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter benefit!";
                        } else {
                          return null;
                        }
                      },
                      onChanged: (value) {
                        setState(() {
                          benefit = value;
                        });
                      },
                    )),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      print(benefit);
                      print(recommend);
                      print(_formKey.currentState!.validate());
                      if (_formKey.currentState!.validate() &&
                          benefit.isNotEmpty &&
                          recommend.isNotEmpty) {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            content: const Text(
                                'Are you sure to send the review report?'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () async {
                                  await database
                                      .uploadReviewReport(widget.mykad);
                                  await database.changePolicyStatus(
                                      widget.mykad, recommend, benefit);
                                  await database.updateRewardPoint(widget.id);
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      content: const Text(
                                          'The review report is sent to customer!'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      AgentCustomerList(
                                                          id: widget.id))),
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                child: const Text('Yes'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'No'),
                                child: const Text('No'),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    child: Text(
                      'Send Review Report',
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      minimumSize: Size(296, 59),
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AgentCustomerList(id: widget.id)));
        },
        child: const Icon(Icons.arrow_circle_left),
      ),
    );
  }
}
