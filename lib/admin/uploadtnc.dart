import 'package:flutter/material.dart';
import 'package:insurance/admin/adminhome.dart';
import 'package:insurance/database/adminDatabase.dart';

class UploadTNCPageWidget extends StatefulWidget {
  const UploadTNCPageWidget({Key? key}) : super(key: key);

  @override
  _UploadTNCPageWidgetState createState() => _UploadTNCPageWidgetState();
}

class _UploadTNCPageWidgetState extends State<UploadTNCPageWidget> {
  String text = "Enter terms and conditions";
  String customer = '';
  String consultant = '';
  String statement1 = '';
  String statement2 = '';
  TextEditingController consultantController = TextEditingController();
  TextEditingController customerController = TextEditingController();

  AdminDatabase database = AdminDatabase();

  @override
  void initState() {
    super.initState();
    loadTNC();
  }

  Future<void> loadTNC() async {
    statement1 = await database.loadTNC("customer");
    statement2 = await database.loadTNC("consultant");

    setState(() {
      if (statement1.isNotEmpty) {
        customerController.text = statement1;
      }
      if (statement2.isNotEmpty) {
        consultantController.text = statement2;
      }
    });
    print(statement1);
    print(statement2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 567,
              height: 200,
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
                  'Terms and Conditions',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    color: Colors.white,
                    fontSize: 50,
                  ),
                ),
              ),
            ),
            Expanded(
              child: DefaultTabController(
                length: 2,
                initialIndex: 0,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment(0, 0),
                      child: TabBar(
                        tabs: [
                          Tab(
                            text: 'Consultant',
                          ),
                          Tab(
                            text: 'Customer',
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          SingleChildScrollView(
                              child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 10, 8, 0),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    reverse: true,
                                    child: TextFormField(
                                      controller: consultantController,
                                      decoration: InputDecoration(
                                        labelText: 'Enter terms and conditions',
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFF00DBFF),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      maxLines: null,
                                      onChanged: (value) {
                                        setState(() {
                                          consultant = value;
                                        });
                                      },
                                    ),
                                  )),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (statement2.isEmpty) {
                                      database.uploadTNC(
                                          consultant, "consultant");
                                      showDialog<String>(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                          content:
                                              const Text('The TnC is updated!'),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () => Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          AdminHomePageWidget())),
                                              child: const Text('OK'),
                                            ),
                                          ],
                                        ),
                                      );
                                    } else {
                                      database.updateTNC(
                                          consultant, "consultant");
                                      showDialog<String>(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                          content:
                                              const Text('The TnC is updated!'),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () => Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          AdminHomePageWidget())),
                                              child: const Text('OK'),
                                            ),
                                          ],
                                        ),
                                      );
                                    }
                                  },
                                  child: Text('Update'),
                                ),
                              ),
                            ],
                          )),
                          SingleChildScrollView(
                              child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 10, 8, 0),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    reverse: true,
                                    child: TextFormField(
                                      controller: customerController,
                                      decoration: InputDecoration(
                                        labelText: text,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFF00DBFF),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      maxLines: null,
                                      onChanged: (value) {
                                        setState(() {
                                          customer = value;
                                        });
                                      },
                                    ),
                                  )),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (statement1.isEmpty) {
                                      database.uploadTNC(customer, "customer");
                                      showDialog<String>(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                          content:
                                              const Text('The TnC is updated!'),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () => Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          AdminHomePageWidget())),
                                              child: const Text('OK'),
                                            ),
                                          ],
                                        ),
                                      );
                                    } else {
                                      database.updateTNC(customer, "customer");
                                      showDialog<String>(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                          content:
                                              const Text('The TnC is updated!'),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () => Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          AdminHomePageWidget())),
                                              child: const Text('OK'),
                                            ),
                                          ],
                                        ),
                                      );
                                    }
                                  },
                                  child: Text('Update'),
                                ),
                              ),
                            ],
                          )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminHomePageWidget()));
        },
        child: const Icon(Icons.arrow_circle_left),
      ),
    );
  }
}
