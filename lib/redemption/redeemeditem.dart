import 'package:flutter/material.dart';
import 'package:insurance/database/adminDatabase.dart';

class RedeemedItemPageWidget extends StatefulWidget {
  final String id;
  const RedeemedItemPageWidget({super.key, required this.id});

  @override
  _RedeemedItemPageWidgetState createState() => _RedeemedItemPageWidgetState();
}

class _RedeemedItemPageWidgetState extends State<RedeemedItemPageWidget> {
  AdminDatabase database = AdminDatabase();
  List<String> status = [];
  List<String> value = [];
  List<String> date = [];

  @override
  void initState() {
    super.initState();
    assignList();
  }

  Future<void> assignList() async {
    final data = await database.getAllRedeemedItem(widget.id);
    setState(() {
      status = data['status'].split(',');
      value = data['value'].split(',');
      date = data['date'].split(',');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 484,
              height: 150,
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
                alignment: AlignmentDirectional(0, -1),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                  child: Text(
                    'Redeemed Item',
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                ),
              ),
            ),
            if (status.length != 0) ...[
              Flexible(
                  child: ListView.builder(
                      itemCount: status.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10, 10, 10, 10),
                            child: Container(
                                width: 513,
                                height: 120,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFF7070),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: ListView(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Item: RM ${value[index]}',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text('Status: ${status[index]}',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  )),
                                              Text('Date: ${date[index]}',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  )),
                                            ]),
                                      ],
                                    ),
                                  ],
                                )));
                      })),
            ] else ...[
              const Text("No redeemed item")
            ]
          ],
        ),
      ),
    );
  }
}
