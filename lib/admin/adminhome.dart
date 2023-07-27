import 'package:flutter/material.dart';
import 'package:insurance/admin/pendingredemptionpage.dart';
import 'package:insurance/admin/reviewconsultantregistration.dart';
import 'package:insurance/admin/uploadbanner.dart';
import 'package:insurance/admin/uploadgiftpage.dart';
import 'package:insurance/admin/uploadtnc.dart';
import 'package:insurance/login/loginpage.dart';

import 'adminconsultantlist.dart';
import 'admincustomerlist.dart';

class AdminHomePageWidget extends StatefulWidget {
  const AdminHomePageWidget({Key? key}) : super(key: key);

  @override
  _AdminHomePageWidgetState createState() => _AdminHomePageWidgetState();
}

class _AdminHomePageWidgetState extends State<AdminHomePageWidget> {
  final List<Map> element = [
    {
      "name": "Customer List",
      "image": "asset/customer.jpeg",
    },
    {
      "name": "Consultant List",
      "image": "asset/consultant.jpg",
    },
    {
      "name": "Redemption Request",
      "image": "asset/consultant.jpg",
    },
    {
      "name": "Consultant Registration",
      "image": "asset/consultant.jpg",
    },
    {
      "name": "Upload Banner",
      "image": "asset/consultant.jpg",
    },
    {
      "name": "Upload TnC",
      "image": "asset/consultant.jpg",
    },
    {
      "name": "Upload Gift",
      "image": "asset/consultant.jpg",
    },
  ];

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
                    'Home Page',
                    style: TextStyle(
                      fontFamily: 'Readex Pro',
                      color: Colors.white,
                      fontSize: 50,
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                  child: Container(
                      height: 400,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.60,
                              mainAxisSpacing: 10.0,
                              crossAxisSpacing: 20.0,
                            ),
                            itemCount: element.length,
                            itemBuilder: (BuildContext ctx, index) {
                              return GestureDetector(
                                  onTap: () {
                                    if (element[index]['name'] ==
                                        "Customer List") {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AdminCustomerListPageWidget()));
                                    } else if (element[index]['name'] ==
                                        "Consultant List") {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AdminConsultantListPageWidget(check: false, mykad: '',)));
                                    } else if (element[index]['name'] ==
                                        "Redemption Request") {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PendingRedemptionPageWidget()));
                                    } else if (element[index]['name'] ==
                                        "Consultant Registration") {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ReviewRegistrationPageWidget()));
                                    } else if (element[index]['name'] ==
                                        "Upload Banner") {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  UploadBannerPageWidget()));
                                    } else if (element[index]['name'] ==
                                        "Upload TnC") {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  UploadTNCPageWidget()));
                                    } else if (element[index]['name'] ==
                                        "Upload Gift") {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  UploadGiftPageWidget()));
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
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0, 25, 0, 0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Image.asset(
                                              element[index]['image'],
                                              width: 150,
                                              height: 150,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 10, 0, 0),
                                          child: Text(
                                            element[index]['name'],
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ));
                            }),
                      ))),
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
