import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:insurance/admin/adminhome.dart';
import 'package:insurance/admin/customerdetailpage.dart';
import 'package:insurance/database/adminDatabase.dart';
import 'package:insurance/database/consultantDatabase.dart';

import 'consultantdetailpage.dart';

class AdminConsultantListPageWidget extends StatefulWidget {
  final bool check;
  final String mykad;
  const AdminConsultantListPageWidget(
      {super.key, required this.check, required this.mykad});

  @override
  _AdminConsultantListPageWidgetState createState() =>
      _AdminConsultantListPageWidgetState();
}

class _AdminConsultantListPageWidgetState
    extends State<AdminConsultantListPageWidget> {
  ConsultantDatabase database = ConsultantDatabase();
  AdminDatabase admin = AdminDatabase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 445,
              height: 239,
              decoration: const BoxDecoration(
                color: Color(0xFFFF0000),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                ),
              ),
              child: const Align(
                alignment: AlignmentDirectional(0, 0),
                child: Text(
                  'Consultant List',
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    color: Colors.white,
                    fontSize: 50,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                    child: TextFormField(
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Search',
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 227, 220, 220),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).errorColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).errorColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        suffixIcon: const Icon(
                          Icons.filter_alt_outlined,
                          size: 25,
                        ),
                      ),
                      style: const TextStyle(
                        fontFamily: 'Readex Pro',
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 10, 0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Search',
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            FutureBuilder<QuerySnapshot>(
              future: database.getConsultantList(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  final dataList = snapshot.data!.docs;
                  return Flexible(
                      child: ListView.builder(
                    itemCount: dataList.length,
                    itemBuilder: (context, index) {
                      final documentSnapshot = dataList[index];
                      final data =
                          documentSnapshot.data() as Map<String, dynamic>;
                      if (data['status'] != 'false') {
                        return Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10, 10, 10, 10),
                            child: Container(
                                width: 513,
                                height: 180,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFF7070),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: ListTile(
                                  title: Text(
                                    data['agent id'],
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(data['national code'],
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 25)),
                                      Text(data['agency'],
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 25)),
                                      Row(
                                        children: [
                                          if (!widget.check) ...[
                                            const SizedBox(width: 200),
                                            ElevatedButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              ConsultantDetailPageWidget(
                                                                id: data[
                                                                    'agent id'],
                                                              )));
                                                },
                                                child: const Text("View")),
                                          ] else ...[
                                            const SizedBox(width: 100),
                                            ElevatedButton(
                                                onPressed: () async {
                                                  await admin
                                                      .assignConsultantAndCustomer(
                                                          widget.mykad,
                                                          data['agent id']);
                                                  showDialog<String>(
                                                    context: context,
                                                    builder: (BuildContext
                                                            context) =>
                                                        AlertDialog(
                                                      content: const Text(
                                                          'The customer is assigned!'),
                                                      actions: <Widget>[
                                                        TextButton(
                                                          onPressed: () => Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) =>
                                                                      CustomerDetailPageWidget(
                                                                          mykad:
                                                                              widget.mykad))),
                                                          child:
                                                              const Text('OK'),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                                child: const Text("Assign")),
                                            const SizedBox(width: 10),
                                            ElevatedButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              ConsultantDetailPageWidget(
                                                                id: data[
                                                                    'agent id'],
                                                              )));
                                                },
                                                child: const Text("View")),
                                          ]
                                        ],
                                      ),
                                    ],
                                  ),
                                )));
                      } else {
                        return SizedBox();
                      }
                    },
                  ));
                }
              },
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
