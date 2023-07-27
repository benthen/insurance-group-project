import 'package:flutter/material.dart';
import 'package:insurance/admin/admincustomerlist.dart';
import 'package:insurance/database/customerDatabase.dart';

import 'adminconsultantlist.dart';

class CustomerDetailPageWidget extends StatefulWidget {
  final String mykad;
  const CustomerDetailPageWidget({super.key, required this.mykad});

  @override
  _CustomerDetailPageWidgetState createState() =>
      _CustomerDetailPageWidgetState();
}

class _CustomerDetailPageWidgetState extends State<CustomerDetailPageWidget> {
  CustomerDatabase database = CustomerDatabase();

  Map<String, dynamic> detail = {};

  @override
  void initState() {
    super.initState();
    assignMap();
  }

  Future<void> assignMap() async {
    final map = await database.getCustomerDetail(widget.mykad);
    setState(() {
      detail = map;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Container(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 445,
                  height: 239,
                  decoration: BoxDecoration(
                    color: Color(0xFFFF0000),
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
                      'Customer Detail',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                  child: Container(
                    width: 435,
                    height: 69,
                    decoration: BoxDecoration(
                      color: Color(0xFFFF8686),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 18, 0, 0),
                      child: Text(
                        'Name: ${detail['name']}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                  child: Container(
                    width: 435,
                    height: 69,
                    decoration: BoxDecoration(
                      color: Color(0xFFFF8686),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 18, 0, 0),
                      child: Text(
                        'Mykad: ${widget.mykad}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                  child: Container(
                    width: 435,
                    height: 83,
                    decoration: BoxDecoration(
                      color: Color(0xFFFF8686),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 5, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Text(
                            'Status: ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                          if (detail['status'] == 'Not active') ...[
                            Text(
                              detail['status'],
                              style: const TextStyle(
                                color: Colors.yellow,
                                fontSize: 25,
                              ),
                            )
                          ] else if (detail['status'] == 'Unassigned') ...[
                            Text(
                              detail['status'],
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 18,
                              ),
                            ),
                          ] else if (detail['status'] == 'Assigned') ...[
                            Text(
                              detail['status'],
                              style: const TextStyle(
                                color: Colors.green,
                                fontSize: 18,
                              ),
                            ),
                          ],
                          Align(
                            alignment: AlignmentDirectional(1, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            AdminConsultantListPageWidget(
                                                check: true, mykad: widget.mykad)),
                                  );
                                },
                                child: Text(
                                  'Assign',
                                  style: TextStyle(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 18,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  elevation: 3,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                  child: Container(
                    width: 435,
                    height: 69,
                    decoration: BoxDecoration(
                      color: Color(0xFFFF8686),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 18, 0, 0),
                      child: Text(
                        'Consultant: ${detail['consultant']}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                  child: Container(
                    width: 435,
                    height: 69,
                    decoration: BoxDecoration(
                      color: Color(0xFFFF8686),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 18, 0, 0),
                      child: Text(
                        'Phone No: ${detail['phone']}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                  child: Container(
                    width: 435,
                    height: 69,
                    decoration: BoxDecoration(
                      color: Color(0xFFFF8686),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 18, 0, 0),
                      child: Text(
                        'Email: ${detail['email']}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                  child: Container(
                    width: 435,
                    height: 69,
                    decoration: BoxDecoration(
                      color: Color(0xFFFF8686),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 18, 0, 0),
                      child: Text(
                        'Address: ${detail['address']}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                  child: Container(
                    width: 435,
                    height: 69,
                    decoration: BoxDecoration(
                      color: Color(0xFFFF8686),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 18, 0, 0),
                      child: Text(
                        'Reward Point: ${detail['reward point']}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Block'),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('View Log'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminCustomerListPageWidget()));
        },
        child: const Icon(Icons.arrow_circle_left),
      ),
    );
  }
}
