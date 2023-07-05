import 'package:agent/agentcustomer.dart';
import 'package:flutter/material.dart';

class AgentCustomerList extends StatefulWidget {
  const AgentCustomerList({super.key});

  @override
  State<AgentCustomerList> createState() => _AgentCustomerListState();
}

class _AgentCustomerListState extends State<AgentCustomerList> {
  bool isChecked = false;

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
                      onPressed: () {
                        /*Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AgentCustomer()),
                        );*/
                      },
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
              for (int i = 0; i < 3; i++)
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                  child: Container(
                    width: 485,
                    height: 180,
                    decoration: BoxDecoration(
                      color: Color(0xFFFF6767),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(30, 7, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Name: Ben',
                                style: TextStyle(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  fontSize: 25,
                                ),
                              ),
                              const SizedBox(height: 6),
                              const Text(
                                'Date: 23/6/2023',
                                style: TextStyle(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: const [
                                  Text(
                                    'Status: ',
                                    style: TextStyle(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    'Unreviewed',
                                    style: TextStyle(
                                      fontFamily: 'Readex Pro',
                                      color: Color(0xFFFFFF39),
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: SizedBox(
                                    height: 40,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AgentCustomer()),
                                        );
                                      },
                                      child: const Text(
                                        'View',
                                        style: TextStyle(
                                          fontFamily: 'Readex Pro',
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        primary: Theme.of(context).primaryColor,
                                        elevation: 3,
                                        side: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 24, vertical: 0),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
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
      ),
    );
  }
}
