import 'package:flutter/material.dart';
import 'package:insurance/consultant/agentcustomerlist.dart';
import 'package:insurance/database/customerDatabase.dart';

import 'agentreview.dart';

class AgentCustomer extends StatefulWidget {
  final String mykad;
  final String email;
  final String phone;
  final String id;
  const AgentCustomer(
      {super.key,
      required this.mykad,
      required this.email,
      required this.phone,
      required this.id});

  @override
  State<AgentCustomer> createState() => _AgentCustomerState();
}

class _AgentCustomerState extends State<AgentCustomer> {
  CustomerDatabase database = CustomerDatabase();

  String policy = "";
  String name = '';
  List<String> status = [];
  List<List<String>> combine = [];

  @override
  void initState() {
    super.initState();
    assignList();
  }

  Future<void> assignList() async {
    final string = await database.getAllPolicy(widget.mykad);
    setState(() {
      policy = string;
      if (policy.isNotEmpty) {
        status = policy.split(",");

        for (int i = 0; i < status.length; i++) {
          combine.add(status[i].split('/'));
        }
      }
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
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 50, 0, 0),
                child: Text(
                  widget.mykad,
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    color: Colors.white,
                    fontSize: 40,
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
              padding: const EdgeInsetsDirectional.fromSTEB(20, 5, 20, 20),
              child: Container(
                  width: 550,
                  height: 160,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 254, 75, 63),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: status.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10, 10, 10, 10),
                          child: Container(
                              width: 150,
                              height: 100,
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 255, 133, 124)),
                              child: Column(
                                children: [
                                  Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        if (combine.isNotEmpty) ...[
                                          Text(
                                            combine[index][0],
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          if (combine[index][1] ==
                                              "Unreviewed") ...[
                                            Text('Status: ${combine[index][1]}',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                )),
                                          ] else if (combine[index][1] ==
                                              "Reviewed") ...[
                                            Text('Status: ${combine[index][1]}',
                                                style: TextStyle(
                                                  color: Colors.green,
                                                )),
                                          ]
                                        ]
                                      ]),
                                ],
                              )),
                        );
                      })),
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
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Padding(
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
                                  EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                              child: Text(
                                'Email: ${widget.email}',
                                style: TextStyle(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  fontSize: 18,
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
                      children: [
                        const Padding(
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
                            padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                            child: Text(
                              'Phone No: ${widget.phone}',
                              style: TextStyle(
                                fontFamily: 'Readex Pro',
                                color: Colors.white,
                                fontSize: 18,
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
                      builder: (context) => AgentReviewPageWidget(
                          id: widget.id, mykad: widget.mykad)),
                );
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
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
    ),
    floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AgentCustomerList(id: widget.id,)));
        },
        child: const Icon(Icons.arrow_circle_left),
      ),
    );
  }
}
