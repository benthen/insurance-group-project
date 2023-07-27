import 'package:flutter/material.dart';
import 'package:insurance/consultant/agentregister.dart';
import 'package:insurance/customer/customerregister.dart';

class ChooseRegisterPageWidget extends StatefulWidget {
  const ChooseRegisterPageWidget({Key? key}) : super(key: key);

  @override
  _ChooseRegisterPageWidgetState createState() =>
      _ChooseRegisterPageWidgetState();
}

class _ChooseRegisterPageWidgetState extends State<ChooseRegisterPageWidget> {
  final List<Map> element = [
    {
      "name": "Customer",
      "image": "asset/customer.jpeg",
    },
    {
      "name": "Consultant",
      "image": "asset/consultant.jpg",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            top: true,
            child: SingleChildScrollView(
                child: Column(mainAxisSize: MainAxisSize.max, children: [
              Container(
                width: 430,
                height: 300,
                decoration: const BoxDecoration(
                  color: Color(0xFFFF0000),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(0),
                        child: Image.asset(
                          'asset/welcomeBack.jpeg',
                          width: 200,
                          height: 200,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const Align(
                        alignment: AlignmentDirectional(0, 1),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: Text(
                            'Welcome Back',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 40),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                child: Container(
                  width: 414,
                  height: 500,
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(15, 10, 15, 10),
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
                                element[index]["name"] == "Customer"
                                    ? Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CustomerRegisterPageWidget()))
                                    : Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AgentRegister()));
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
                                              0, 25, 0, 0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.asset(
                                          element[index]['image'],
                                          width: 150,
                                          height: 150,
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
                                            color: Colors.white, fontSize: 25),
                                      ),
                                    ),
                                  ],
                                ),
                              ));
                        }),
                  ),
                ),
              )
            ]))));
  }
}
