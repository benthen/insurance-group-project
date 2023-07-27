import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:insurance/admin/adminhome.dart';
import 'package:insurance/database/adminDatabase.dart';

class PendingRedemptionPageWidget extends StatefulWidget {
  const PendingRedemptionPageWidget({Key? key}) : super(key: key);

  @override
  _PendingRedemptionPageWidgetState createState() =>
      _PendingRedemptionPageWidgetState();
}

class _PendingRedemptionPageWidgetState
    extends State<PendingRedemptionPageWidget> {
  AdminDatabase database = AdminDatabase();

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
                  'Redemption Request',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 35),
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
                            child: Text(
                              "Customer",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Consultant",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          FutureBuilder<QuerySnapshot>(
                              future: database.getRedemptionRequest(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return CircularProgressIndicator();
                                } else if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}');
                                } else {
                                  final dataList = snapshot.data!.docs;
                                  return ListView.builder(
                                      itemCount: dataList.length,
                                      itemBuilder: (context, index) {
                                        final documentSnapshot =
                                            dataList[index];
                                        final data = documentSnapshot.data()
                                            as Map<String, dynamic>;
                                        if (data['category'] == "customer") {
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 10, 10, 10),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Color.fromARGB(
                                                      255, 255, 123, 113),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10))),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Mykad: ${data['id']}',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                      'Item: RM ${data['value']}',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18)),
                                                  Text(
                                                      'Points needed: ${data['point']}',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18)),
                                                  Text('Date: ${data['date']}',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18)),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 10, 10),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 10, 0),
                                                          child: ElevatedButton(
                                                            onPressed:
                                                                () async {
                                                              await database
                                                                  .updateCustomerPoint(
                                                                      data[
                                                                          'id'],
                                                                      data[
                                                                          'point']);
                                                              await database
                                                                  .changeTransactionStatus(
                                                                      data[
                                                                          'id'],
                                                                      'Approved');
                                                              await database
                                                                  .redeemedItem(
                                                                      'customer',
                                                                      data[
                                                                          'id'],
                                                                      data[
                                                                          'value']);
                                                              await database
                                                                  .deleteRedemption(
                                                                      data[
                                                                          'id']);
                                                              showDialog<
                                                                  String>(
                                                                context:
                                                                    context,
                                                                builder: (BuildContext
                                                                        context) =>
                                                                    AlertDialog(
                                                                  content:
                                                                      const Text(
                                                                          'The redemption is approved!'),
                                                                  actions: <Widget>[
                                                                    TextButton(
                                                                      onPressed: () => Navigator.push(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                              builder: (context) => PendingRedemptionPageWidget())),
                                                                      child: const Text(
                                                                          'OK'),
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            },
                                                            child:
                                                                Text('Approve'),
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              primary: Color(
                                                                  0xFFFF0202),
                                                              onPrimary:
                                                                  Colors.white,
                                                              elevation: 3,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                              ),
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          24,
                                                                      vertical:
                                                                          0),
                                                            ),
                                                          ),
                                                        ),
                                                        ElevatedButton(
                                                          onPressed: () async {
                                                            await database
                                                                .deleteRedemption(
                                                                    data['id']);
                                                            await database
                                                                .changeTransactionStatus(
                                                                    data['id'],
                                                                    'Rejected');
                                                            showDialog<String>(
                                                              context: context,
                                                              builder: (BuildContext
                                                                      context) =>
                                                                  AlertDialog(
                                                                content: const Text(
                                                                    'The redemption is deleted!'),
                                                                actions: <Widget>[
                                                                  TextButton(
                                                                    onPressed: () => Navigator.push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                PendingRedemptionPageWidget())),
                                                                    child:
                                                                        const Text(
                                                                            'OK'),
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                          child: Text('Reject'),
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            primary: Color(
                                                                0xFFFF0202),
                                                            onPrimary:
                                                                Colors.white,
                                                            elevation: 3,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                            ),
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        24,
                                                                    vertical:
                                                                        0),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        } else {
                                          return SizedBox();
                                        }
                                      });
                                }
                              }),
                          FutureBuilder<QuerySnapshot>(
                              future: database.getRedemptionRequest(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return CircularProgressIndicator();
                                } else if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}');
                                } else {
                                  final dataList = snapshot.data!.docs;
                                  return ListView.builder(
                                      itemCount: dataList.length,
                                      itemBuilder: (context, index) {
                                        final documentSnapshot =
                                            dataList[index];
                                        final data = documentSnapshot.data()
                                            as Map<String, dynamic>;
                                        if (data['category'] == "consultant") {
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 10, 10, 10),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Color.fromARGB(
                                                      255, 255, 123, 113),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10))),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Agent ID: ${data['id']}',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                      'Item: RM ${data['value']}',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18)),
                                                  Text(
                                                      'Points needed: ${data['point']}',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18)),
                                                  Text('Date: ${data['date']}',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18)),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 10, 10),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 10, 0),
                                                          child: ElevatedButton(
                                                            onPressed:
                                                                () async {
                                                              await database
                                                                  .updateConsultantPoint(
                                                                      data[
                                                                          'id'],
                                                                      data[
                                                                          'point']);
                                                              await database
                                                                  .changeTransactionStatus(
                                                                      data[
                                                                          'id'],
                                                                      'Approved');
                                                              await database
                                                                  .redeemedItem(
                                                                      'customer',
                                                                      data[
                                                                          'id'],
                                                                      data[
                                                                          'value']);
                                                              await database
                                                                  .deleteRedemption(
                                                                      data[
                                                                          'id']);
                                                              showDialog<
                                                                  String>(
                                                                context:
                                                                    context,
                                                                builder: (BuildContext
                                                                        context) =>
                                                                    AlertDialog(
                                                                  content:
                                                                      const Text(
                                                                          'The redemption is approved!'),
                                                                  actions: <Widget>[
                                                                    TextButton(
                                                                      onPressed: () => Navigator.push(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                              builder: (context) => PendingRedemptionPageWidget())),
                                                                      child: const Text(
                                                                          'OK'),
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            },
                                                            child:
                                                                Text('Approve'),
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              primary: Color(
                                                                  0xFFFF0202),
                                                              onPrimary:
                                                                  Colors.white,
                                                              elevation: 3,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                              ),
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          24,
                                                                      vertical:
                                                                          0),
                                                            ),
                                                          ),
                                                        ),
                                                        ElevatedButton(
                                                          onPressed: () async {
                                                            await database
                                                                .deleteRedemption(
                                                                    data['id']);
                                                            await database
                                                                .changeTransactionStatus(
                                                                    data['id'],
                                                                    'Rejected');
                                                            showDialog<String>(
                                                              context: context,
                                                              builder: (BuildContext
                                                                      context) =>
                                                                  AlertDialog(
                                                                content: const Text(
                                                                    'The redemption is deleted!'),
                                                                actions: <Widget>[
                                                                  TextButton(
                                                                    onPressed: () => Navigator.push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                PendingRedemptionPageWidget())),
                                                                    child:
                                                                        const Text(
                                                                            'OK'),
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                          child: Text('Reject'),
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            primary: Color(
                                                                0xFFFF0202),
                                                            onPrimary:
                                                                Colors.white,
                                                            elevation: 3,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                            ),
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        24,
                                                                    vertical:
                                                                        0),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        } else {
                                          return SizedBox();
                                        }
                                      });
                                }
                              }),
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
