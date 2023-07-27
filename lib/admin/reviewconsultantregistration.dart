import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:insurance/admin/adminhome.dart';
import 'package:insurance/admin/reviewconsultant.dart';
import 'package:insurance/database/consultantDatabase.dart';

class ReviewRegistrationPageWidget extends StatefulWidget {
  const ReviewRegistrationPageWidget({Key? key}) : super(key: key);

  @override
  _ReviewRegistrationPageWidgetState createState() =>
      _ReviewRegistrationPageWidgetState();
}

class _ReviewRegistrationPageWidgetState
    extends State<ReviewRegistrationPageWidget> {
  ConsultantDatabase database = ConsultantDatabase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 513,
              height: 225,
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
                  'Registered Consultant',
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
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 20, 15, 0),
                    child: TextFormField(
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Search',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFFF0000),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        suffixIcon: Icon(
                          Icons.filter_alt_outlined,
                          size: 20,
                        ),
                      ),
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 10, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    child: Text('Search'),
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
                      if (data['status'] == 'false') {
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
                                          const SizedBox(width: 210),
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ReviewConsultantPageWidget(
                                                              id: data['agent id'],
                                                            )));
                                              },
                                              child: const Text("View")),
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
