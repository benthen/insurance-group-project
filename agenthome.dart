import 'package:agent/agentcustomerlist.dart';
import 'package:flutter/material.dart';

class AgentHomePage extends StatefulWidget {
  const AgentHomePage({super.key});

  @override
  State<AgentHomePage> createState() => _AgentHomePageState();
}

class _AgentHomePageState extends State<AgentHomePage> {
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
                  children: const [
                    Align(
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
                          'Ben',
                          style: TextStyle(
                              fontFamily: 'Readex Pro',
                              fontSize: 50,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AgentCustomerList(),
                          ),
                        );
                      },
                      child: Container(
                        width: 150,
                        height: 180,
                        decoration: const BoxDecoration(
                          color: Color(0xFFFF6E6E),
                          shape: BoxShape.rectangle,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  'https://picsum.photos/seed/509/600',
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: Text(
                                'Customer List',
                                style: TextStyle(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 150,
                      height: 180,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFF6E6E),
                        shape: BoxShape.rectangle,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                'https://picsum.photos/seed/509/600',
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: Text(
                              'Redeem Reward Point',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 150,
                      height: 180,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFF6E6E),
                        shape: BoxShape.rectangle,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                'https://picsum.photos/seed/509/600',
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: Text(
                              'Redeem Transaction',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 150,
                      height: 180,
                      decoration: BoxDecoration(
                        color: Color(0xFFFF6E6E),
                        shape: BoxShape.rectangle,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                'https://picsum.photos/seed/509/600',
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: Text(
                              'Redeemed item',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
