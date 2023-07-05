import 'package:agent/agentreview.dart';
import 'package:flutter/material.dart';

class AgentCustomer extends StatefulWidget {
  const AgentCustomer({Key? key}) : super(key: key);

  @override
  State<AgentCustomer> createState() => _AgentCustomerState();
}

class _AgentCustomerState extends State<AgentCustomer> {
  bool isChecked = false;

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
              width: 459,
              height: 125,
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
                padding: EdgeInsetsDirectional.fromSTEB(10, 50, 0, 0),
                child: Text(
                  'Ben',
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const Align(
              alignment: AlignmentDirectional(-1, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
                child: Text(
                  'Insurance Policy',
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 20),
              child: Container(
                width: 572,
                height: 194,
                decoration: BoxDecoration(
                  color: Color(0xFFFF6B6B),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        for (int i = 0; i < 3; i++)
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 10, 0),
                            child: Container(
                              width: 158,
                              height: 164,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: const [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 5, 0, 0),
                                    child: Text(
                                      'Policy 1',
                                      style: TextStyle(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: Text(
                                      'policy1.pdf',
                                      style: TextStyle(
                                        fontFamily: 'Readex Pro',
                                        color: Color(0xFF0096FF),
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 10, 0, 0),
                                      child: Text(
                                        'Date: 22/6/2023',
                                        style: TextStyle(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 10, 0, 0),
                                      child: Text(
                                        'Status: Unreviewed',
                                        style: TextStyle(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 5, 20, 20),
              child: Container(
                width: 572,
                height: 168,
                decoration: BoxDecoration(
                  color: Color(0xFFFF6B6B),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Align(
                      alignment: AlignmentDirectional(0, -1),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                        child: Text(
                          'Customer details:',
                          style: TextStyle(
                            fontFamily: 'Readex Pro',
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: const [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: Icon(
                              Icons.email_sharp,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                              child: Text(
                                'Email: ben@gmail.com',
                                style: TextStyle(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Icon(
                            Icons.phone,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                            child: Text(
                              'Phone No: 012-3456789',
                              style: TextStyle(
                                fontFamily: 'Readex Pro',
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AgentReviewPageWidget()),
                );
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.fromLTRB(100, 10, 100, 10)),
              child: const Text(
                'Review Policy',
                style: TextStyle(
                  fontFamily: 'Readex Pro',
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    ));
  }
}
