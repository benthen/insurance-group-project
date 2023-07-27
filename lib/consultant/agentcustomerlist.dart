import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:insurance/consultant/agentcustomer.dart';
import 'package:insurance/consultant/agenthome.dart';
import 'package:insurance/database/customerDatabase.dart';

class AgentCustomerList extends StatefulWidget {
  final String id;
  const AgentCustomerList({super.key, required this.id});

  @override
  State<AgentCustomerList> createState() => _AgentCustomerListState();
}

class _AgentCustomerListState extends State<AgentCustomerList> {
  CustomerDatabase database = CustomerDatabase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 449,
                height: 223,
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
                    'Customer List',
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
                        primary: Colors.blue,
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
                future: database.getCustomerList(),
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
                        String file = data['filename'].split(',')[0];
                        String status = file.split('/')[1];
                        if (data['consultant'] == widget.id && status == 'Unreviewed') {
                          return Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10, 10, 10, 10),
                              child: Container(
                                  width: 513,
                                  height: 170,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFF7070),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: ListTile(
                                    title: Text(
                                      'Name: ${data['name']}',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Status: $status',
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
                                                              AgentCustomer(mykad: data['mykad'], email: data['email'], phone: data['phone'],id: widget.id,)));
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
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AgentHomePage(id: widget.id,)));
        },
        child: const Icon(Icons.arrow_circle_left),
      ),
    );
  }
}
