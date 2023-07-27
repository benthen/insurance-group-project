import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:insurance/admin/adminhome.dart';
import 'package:insurance/admin/changegift.dart';
import 'package:insurance/database/adminDatabase.dart';

class UploadGiftPageWidget extends StatefulWidget {
  const UploadGiftPageWidget({Key? key}) : super(key: key);

  @override
  _UploadGiftPageWidgetState createState() => _UploadGiftPageWidgetState();
}

class _UploadGiftPageWidgetState extends State<UploadGiftPageWidget> {
  AdminDatabase database = AdminDatabase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Column(mainAxisSize: MainAxisSize.max, children: [
          Container(
            width: 445,
            height: 200,
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
                'Change Rewards',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 35),
              ),
            ),
          ),
          FutureBuilder<QuerySnapshot>(
            future: database.getAllGift(),
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
                    return Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10, 10, 10, 10),
                        child: Container(
                            width: 513,
                            height: 150,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFF7070),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: ListTile(
                              subtitle: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 10, 0, 0),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Value: RM ${data['value']}',
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 25)),
                                          Text('Point needed: ${data['point']}',
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 25)),
                                          Row(
                                            children: [
                                              const SizedBox(width: 200),
                                              ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                GiftDetailsPageWidget(
                                                                    value: data[
                                                                        'value'])));
                                                  },
                                                  child: const Text("Change")),
                                            ],
                                          ),
                                        ],
                                      )
                                    ]),
                              ),
                            )));
                  },
                ));
              }
            },
          ),
        ]),
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
