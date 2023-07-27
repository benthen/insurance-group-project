import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:insurance/customer/reviewpolicy.dart';
import 'package:insurance/database/adminDatabase.dart';
import 'package:insurance/database/customerDatabase.dart';
import 'package:insurance/login/loginpage.dart';
import 'package:insurance/redemption/redeemeditem.dart';
import 'package:insurance/redemption/redemption.dart';
import 'package:insurance/redemption/transaction.dart';

class CustomerHomePageWidget extends StatefulWidget {
  final String mykad;
  const CustomerHomePageWidget({super.key, required this.mykad});

  @override
  _CustomerHomePageWidgetState createState() => _CustomerHomePageWidgetState();
}

class _CustomerHomePageWidgetState extends State<CustomerHomePageWidget> {
  CustomerDatabase database = CustomerDatabase();
  AdminDatabase admin = AdminDatabase();

  String policy = "";
  Map<String, dynamic> detail = {};
  List<String> status = [];
  List<List<String>> combine = [];
  String itemStatus = '';
  String value = '';
  String filename = '';

  final List<Map> element = [
    {
      "name": "Redeem \nGift",
      "image": "asset/redeemedItem.jpeg",
    },
    {
      "name": "Redeemed \nItem",
      "image": "asset/deliveringItem.jpeg",
    },
    {
      "name": "Redemption \nTransaction",
      "image": "asset/redeemTransaction.jpeg",
    }
  ];

  @override
  void initState() {
    super.initState();
    assignList();
    getDetail();
    getItem();
    getFilename();
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

  Future<void> getDetail() async {
    final customer = await database.getCustomerDetail(widget.mykad);
    setState(() {
      detail = customer;
    });
  }

  void getItem() async {
    final data = await admin.getAllRedeemedItem(widget.mykad);
    setState(() {
      itemStatus = data['status'].split(',')[0];
      value = data['value'].split(',')[0];
    });
  }

  void getFilename() async {
    final imagename = await database.getFile();
    setState(() {
      filename = imagename['name'];
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
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      height: 150,
                      decoration: const BoxDecoration(
                        color: Color(0xFFBE3737),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                              child: Text(
                                'Welcome,',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 40),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                              child: Text(
                                detail['name'],
                                style: TextStyle(
                                    color: Colors.white, fontSize: 28),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                              child: Text(
                                'Consultant: ${detail['consultant']}',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 28),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
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
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                                fontWeight: FontWeight.bold),
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
                        Align(
                            alignment: AlignmentDirectional(1, 0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 10, 0),
                              child: ElevatedButton(
                                  onPressed: () async {
                                    await admin
                                        .changeRedeemedItemStatus(widget.mykad);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CustomerHomePageWidget(
                                                    mykad: widget.mykad)));
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                child: Container(
                    width: 411,
                    height: 264,
                    child: FutureBuilder(
                      future: FirebaseStorage.instance
                          .ref()
                          .child('banner/$filename')
                          .getDownloadURL(),
                      builder: (BuildContext context,
                          AsyncSnapshot<String> snapshot) {
                        if (snapshot.hasData) {
                          return Image.network(snapshot.data!);
                        } else {
                          return Container(
                            color: Colors.blue[100],
                            child: Center(
                              child: Text('No Banner'),
                            ),
                          );
                        }
                      },
                    )),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                child: Container(
                  width: 405,
                  height: 250,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF6464),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(5, 0, 10, 0),
                            child: Text(
                              'Your insurance policy',
                              textAlign: TextAlign.start,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 10, 0, 0),
                            child: ElevatedButton(
                                onPressed: () async {
                                  await database.uploadPolicy(widget.mykad);
                                  await database
                                      .updateRewardPoint(widget.mykad);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              CustomerHomePageWidget(
                                                  mykad: widget.mykad))));
                                },
                                child: const Text("Upload policy")),
                          ),
                        ),
                        Container(
                            height: 120,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: status.length,
                                itemBuilder: (BuildContext context, int index) {
                                  if (combine[index][1] == "Reviewed") {
                                    return GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ReviewPolicyPageWidget(
                                                          filechange:
                                                              combine[index]
                                                                  [0])));
                                        },
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(10, 10, 10, 10),
                                          child: Container(
                                              width: 150,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                  color: const Color.fromARGB(
                                                      255, 255, 133, 124)),
                                              child: Column(
                                                children: [
                                                  Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        if (combine
                                                            .isNotEmpty) ...[
                                                          Text(
                                                            combine[index][0],
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Text(
                                                              'Status: ${combine[index][1]}',
                                                              style: TextStyle(
                                                                color: const Color
                                                                        .fromARGB(
                                                                    255,
                                                                    0,
                                                                    255,
                                                                    8),
                                                              )),
                                                        ]
                                                      ]),
                                                ],
                                              )),
                                        ));
                                  } else {
                                    return Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              10, 10, 10, 10),
                                      child: Container(
                                          width: 150,
                                          height: 100,
                                          decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                  255, 255, 133, 124)),
                                          child: Column(
                                            children: [
                                              Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    if (combine.isNotEmpty) ...[
                                                      Text(
                                                        combine[index][0],
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Text(
                                                          'Status: ${combine[index][1]}',
                                                          style: TextStyle(
                                                            color:
                                                                Colors.yellow,
                                                          )),
                                                    ]
                                                  ]),
                                            ],
                                          )),
                                    );
                                  }
                                })),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                  child: Container(
                      width: 469,
                      height: 400,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF7C7C),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(children: [
                        const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Text(
                            'Your reward point',
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                        ),
                        Text(
                          detail['reward point'],
                          style: TextStyle(color: Colors.white, fontSize: 100),
                        ),
                        Expanded(
                            child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  childAspectRatio: 0.5,
                                ),
                                itemCount: element.length,
                                itemBuilder: (BuildContext ctx, index) {
                                  return GestureDetector(
                                      onTap: () {
                                        if (element[index]["name"] ==
                                            "Redeem \nGift") {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      RedemptionPageWidget(
                                                          id: widget.mykad)));
                                        } else if (element[index]["name"] ==
                                            "Redeemed \nItem") {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      RedeemedItemPageWidget(
                                                        id: widget.mykad,
                                                      )));
                                        } else if (element[index]["name"] ==
                                            "Redemption \nTransaction") {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      TransactionPageWidget(
                                                        id: widget.mykad,
                                                      )));
                                        }
                                      },
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(5, 10, 5, 10),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: Image.asset(
                                                element[index]['image'],
                                                width: 100,
                                                height: 100,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            element[index]['name'],
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ));
                                })),
                      ]))),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => LoginPageWidget()));
        },
        child: const Icon(Icons.logout),
      ),
    );
  }
}
