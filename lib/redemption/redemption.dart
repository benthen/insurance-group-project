import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:insurance/database/adminDatabase.dart';
import 'package:insurance/database/customerDatabase.dart';

class RedemptionPageWidget extends StatefulWidget {
  final String id;
  const RedemptionPageWidget({super.key, required this.id});

  @override
  _RedemptionPageWidgetState createState() => _RedemptionPageWidgetState();
}

class _RedemptionPageWidgetState extends State<RedemptionPageWidget> {
  AdminDatabase database = AdminDatabase();
  CustomerDatabase customer = CustomerDatabase();

  String point = '';
  String category = '';

  @override
  void initState() {
    super.initState();
    getPoint();
  }

  Future<void> getPoint() async {
    final available = await customer.getPoint(widget.id);
    setState(() {
      point = available.split('/')[0];
      category = available.split('/')[1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            top: true,
            child: Column(mainAxisSize: MainAxisSize.max, children: [
              Container(
                width: 406,
                height: 190,
                decoration: const BoxDecoration(
                  color: Color(0xFFFF0000),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                  ),
                ),
                child: const Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                      child: Text(
                        'Redemption',
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                child: Container(
                  width: 460,
                  height: 143,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF7171),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                          child: Text(
                            'Your reward point:',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                      Text(
                        point,
                        style: TextStyle(color: Colors.white, fontSize: 65),
                      ),
                    ],
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
                                height: 140,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFF7070),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: ListTile(
                                  subtitle: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 10, 0, 0),
                                    child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Image.asset(
                                              'asset/insurance.jpg',
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('Value: RM ${data['value']}',
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 25)),
                                              Text(
                                                  'Point needed: ${data['point']}',
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18)),
                                              Row(
                                                children: [
                                                  const SizedBox(width: 85),
                                                  ElevatedButton(
                                                      onPressed: () async {
                                                        if (int.parse(point) >
                                                            int.parse(data[
                                                                'point']) && !await customer.checkRedemptionRequest(widget.id)) {
                                                          database
                                                              .createRedemptionRequest(category,
                                                                  widget.id,
                                                                  data['value'],
                                                                  data[
                                                                      'point']);
                                                          showDialog<String>(
                                                            context: context,
                                                            builder: (BuildContext
                                                                    context) =>
                                                                AlertDialog(
                                                              content: const Text(
                                                                  'The gift redemption request is sent. Please wait for approval!'),
                                                              actions: <Widget>[
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          context,
                                                                          'OK'),
                                                                  child:
                                                                      const Text(
                                                                          'OK'),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        } else if(int.parse(point) <
                                                            int.parse(data[
                                                                'point'])){
showDialog<String>(
                                                            context: context,
                                                            builder: (BuildContext
                                                                    context) =>
                                                                AlertDialog(
                                                              content: const Text(
                                                                  'Your reward point is low. Please redeem other item!'),
                                                              actions: <Widget>[
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          context,
                                                                          'OK'),
                                                                  child:
                                                                      const Text(
                                                                          'OK'),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        }
                                                        else {
                                                          showDialog<String>(
                                                            context: context,
                                                            builder: (BuildContext
                                                                    context) =>
                                                                AlertDialog(
                                                              content: const Text(
                                                                  'You have made a request!'),
                                                              actions: <Widget>[
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          context,
                                                                          'OK'),
                                                                  child:
                                                                      const Text(
                                                                          'OK'),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        }
                                                      },
                                                      child:
                                                          const Text("Redeem")),
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
            ])));
  }
}
