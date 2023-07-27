import 'package:flutter/material.dart';
import 'package:insurance/admin/reviewconsultantregistration.dart';
import 'package:insurance/database/adminDatabase.dart';

import '../database/consultantDatabase.dart';

class ReviewConsultantPageWidget extends StatefulWidget {
  final String id;
  const ReviewConsultantPageWidget({super.key, required this.id});

  @override
  _ReviewConsultantPageWidgetState createState() =>
      _ReviewConsultantPageWidgetState();
}

class _ReviewConsultantPageWidgetState
    extends State<ReviewConsultantPageWidget> {
  ConsultantDatabase database = ConsultantDatabase();
  AdminDatabase admin = AdminDatabase();

  Map<String, dynamic> detail = {};

  @override
  void initState() {
    super.initState();
    assignMap();
  }

  Future<void> assignMap() async {
    final map = await database.getConsultantDetail(widget.id);
    setState(() {
      detail = map;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 536,
                height: 237,
                decoration: BoxDecoration(
                  color: Color(0xFFFF0000),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Review Consultant',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 350,
                child: SingleChildScrollView(
                  child: Column(children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: Container(
                        width: 475,
                        height: 82,
                        decoration: BoxDecoration(
                          color: Color(0xFFFF9898),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 22, 0, 0),
                          child: Text(
                            'Agent ID: ${detail['agent id']}',
                            style: TextStyle(
                              fontFamily: 'Readex Pro',
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: Container(
                        width: 475,
                        height: 82,
                        decoration: BoxDecoration(
                          color: Color(0xFFFF9898),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 22, 0, 0),
                          child: Text(
                            'National Code: ${detail['national code']}',
                            style: TextStyle(
                              fontFamily: 'Readex Pro',
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: Container(
                        width: 475,
                        height: 82,
                        decoration: BoxDecoration(
                          color: Color(0xFFFF9898),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 22, 0, 0),
                          child: Text(
                            'Agency: ${detail['agency']}',
                            style: TextStyle(
                              fontFamily: 'Readex Pro',
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: Container(
                        width: 475,
                        height: 82,
                        decoration: BoxDecoration(
                          color: Color(0xFFFF9898),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                          child: Row(
                            children: [
                              Text(
                                'Certificate: ',
                                style: TextStyle(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 25,
                                ),
                              ),
                              TextButton(
                                child: Text(detail['cert'],
                                style: TextStyle(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 20,
                                  color: Colors.blue
                                ),),
                                onPressed: () async {
                                  await admin.downloadCert(detail['cert']);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: Container(
                        width: 475,
                        height: 82,
                        decoration: BoxDecoration(
                          color: Color(0xFFFF9898),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 22, 0, 0),
                          child: Text(
                            'Phone No: ${detail['phone']}',
                            style: TextStyle(
                              fontFamily: 'Readex Pro',
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: ElevatedButton(
                  onPressed: () {
                    showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                          content: const Text(
                              'Are you sure you want to verify the consultant?'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () async {
                                await database.changeStatus(widget.id);
                                showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                          content: const Text(
                                              'The consultant is verified!'),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () => Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ReviewRegistrationPageWidget())),
                                              child: const Text('OK'),
                                            ),
                                          ],
                                        ));
                              },
                              child: const Text('Yes'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'No'),
                              child: const Text('No'),
                            ),
                          ],
                        ));
                  },
                  child: Text("Verify"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
