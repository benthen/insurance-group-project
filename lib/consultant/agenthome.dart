import 'package:flutter/material.dart';
import 'package:insurance/database/adminDatabase.dart';
import 'package:insurance/login/loginpage.dart';
import 'package:insurance/redemption/redeemeditem.dart';
import 'package:insurance/redemption/redemption.dart';
import 'package:insurance/redemption/transaction.dart';

import 'agentcustomerlist.dart';

class AgentHomePage extends StatefulWidget {
  final String id;
  const AgentHomePage({super.key, required this.id});

  @override
  State<AgentHomePage> createState() => _AgentHomePageState();
}

class _AgentHomePageState extends State<AgentHomePage> {

  AdminDatabase admin = AdminDatabase();

  String itemStatus = '';
  String value = '';

  final List<Map> element = [
    {
      "name": "Customer List",
      "image": "asset/insurance.jpg",
    },
    {
      "name": "Redeem Reward Point",
      "image": "asset/insurance.jpg",
    },
    {
      "name": "Redeem Transaction",
      "image": "asset/insurance.jpg",
    },
    {
      "name": "Redeemed Item",
      "image": "asset/insurance.jpg",
    },
  ];

  @override
  void initState() {
    super.initState();
    getItem();
  }

  void getItem() async {
    final data = await admin.getAllRedeemedItem(widget.id);
    setState(() {
      itemStatus = data['status'].split(',')[0];
      value = data['value'].split(',')[0];
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
                width: MediaQuery.of(context).size.width,
                height: 180,
                decoration: const BoxDecoration(
                  color: Color(0xFFFF0000),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Align(
                      alignment: AlignmentDirectional(-1, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        child: Text(
                          'Welcome, ',
                          style: TextStyle(
                              fontFamily: 'Readex Pro',
                              fontSize: 50,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        child: Text(
                          widget.id,
                          style: TextStyle(
                              fontFamily: 'Readex Pro',
                              fontSize: 28,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                child: Container(
                  width: 485,
                  height: 170,
                  decoration: BoxDecoration(
                    color: Color(0xFFFF7F7F),
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
                            'Current redemption status:',
                            style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      if (itemStatus == 'Delivering') ...[
                        Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                            child: Text(
                              'RM $value is $itemStatus',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 23),
                            ),
                          ),
                        ),
                        Align(alignment: AlignmentDirectional(1, 0),child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                          child: ElevatedButton(
                              onPressed: () async {
                                await admin.changeRedeemedItemStatus(widget.id);
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>AgentHomePage(id: widget.id)));
                              },
                              child: const Text("Received")),
                        ))
                      ] else ...[
                        Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                            child: Text(
                              'No Redeemed Item',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 23),
                            ),
                          ),
                        )
                      ]
                    ],
                  ),
                ),
              ),
              Container(
                width: 414,
                height: 500,
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(15, 15, 15, 10),
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.70,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 20.0,
                      ),
                      itemCount: element.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return GestureDetector(
                            onTap: () {
                              if (element[index]["name"] == "Customer List") {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            AgentCustomerList(id: widget.id,)));
                              } else if (element[index]["name"] ==
                                  "Redeem Reward Point") {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RedemptionPageWidget(id: widget.id)));
                              } else if (element[index]["name"] ==
                                  "Redeem Transaction") {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            TransactionPageWidget(id: widget.id,)));
                              } else if (element[index]["name"] ==
                                  "Redeemed Item") {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RedeemedItemPageWidget(id: widget.id,)));
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFFF5151),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 15, 0, 0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.asset(
                                        element[index]['image'],
                                        width: 125,
                                        height: 125,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: Text(
                                      element[index]['name'],
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ));
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPageWidget()));
        },
        child: const Icon(Icons.logout),
      ),
    );
  }
}
