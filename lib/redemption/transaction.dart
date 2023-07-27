import 'package:flutter/material.dart';
import 'package:insurance/database/adminDatabase.dart';

class TransactionPageWidget extends StatefulWidget {
  final String id;
  const TransactionPageWidget({super.key, required this.id});

  @override
  _TransactionPageWidgetState createState() => _TransactionPageWidgetState();
}

class _TransactionPageWidgetState extends State<TransactionPageWidget> {
  AdminDatabase database = AdminDatabase();

  List<String> status = [];
  List<String> value = [];
  List<String> point = [];
  List<String> date = [];

  @override
  void initState() {
    super.initState();
    assignList();
  }

  Future<void> assignList() async {
    final data = await database.getAllTransaction(widget.id);
    setState(() {
      status = data['status'].split(',');
      value = data['value'].split(',');
      point = data['point'].split(',');
      date = data['date'].split(',');
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
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                      child: Text(
                        'Transaction',
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      ),
                    ),
                  ],
                ),
              ),
              if (status.length != 0) ...[
                Flexible(
                    child: ListView.builder(
                        itemCount: status.length,
                        itemBuilder: (context, i) {
                          return Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10, 10, 10, 10),
                              child: Container(
                                  width: 513,
                                  height: 180,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFF7070),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: ListTile(
                                    subtitle: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 10, 0, 0),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Item: RM ${value[i]}',
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 25)),
                                            Text('Point needed: ${point[i]}',
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 25)),
                                            Text('Date: ${date[i]}',
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 25)),
                                            Text('Status: ${status[i]}',
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 25)),
                                          ]),
                                    ),
                                  )));
                        }))
              ] else ...[
                const Text("No transaction")
              ]
            ])));
  }
}
