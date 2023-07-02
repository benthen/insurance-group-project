// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';

// import 'transaction_page_model.dart';
// export 'transaction_page_model.dart';

class TransactionPageWidget extends StatefulWidget {
  const TransactionPageWidget({Key? key}) : super(key: key);

  @override
  _TransactionPageWidgetState createState() => _TransactionPageWidgetState();
}

class _TransactionPageWidgetState extends State<TransactionPageWidget> {
  //late TransactionPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    //_model = createModel(context, () => TransactionPageModel());
  }

  @override
  void dispose() {
    //_model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        //backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 406,
                height: 137,
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
                      padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                      child: Text(
                        'Transaction',
                        // style: FlutterFlowTheme.of(context).bodyMedium.override(
                        //       fontFamily: 'Readex Pro',
                        //       color: Colors.white,
                        //       fontSize: 50,
                        //       fontWeight: FontWeight.w600,
                        //     ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                child: Container(
                  width: 513,
                  height: 135,
                  decoration: BoxDecoration(
                    color: Color(0xFFFF7070),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  'https://picsum.photos/seed/261/600',
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Transaction No: 1',
                                  // style: FlutterFlowTheme.of(context)
                                  //     .bodyMedium
                                  //     .override(
                                  //       fontFamily: 'Readex Pro',
                                  //       fontSize: 16,
                                  //       fontWeight: FontWeight.w600,
                                  //     ),
                                ),
                                Text(
                                  'Reward Point: 10',
                                  // style:
                                  //     FlutterFlowTheme.of(context).bodyMedium,
                                ),
                                Text(
                                  'Redeemed item: Earphone',
                                  // style:
                                  //     FlutterFlowTheme.of(context).bodyMedium,
                                ),
                                Text(
                                  'Date: 23/6/2023',
                                  // style:
                                  //     FlutterFlowTheme.of(context).bodyMedium,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Status: ',
                                      // style: FlutterFlowTheme.of(context)
                                      //     .bodyMedium,
                                    ),
                                    Text(
                                      'Pending',
                                      // style: FlutterFlowTheme.of(context)
                                      //     .bodyMedium
                                      //     .override(
                                      //       fontFamily: 'Readex Pro',
                                      //       color: Color(0xFFFFFF32),
                                      //     ),
                                    ),
                                  ],
                                ),
                              ]//.divide(SizedBox(height: 5)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                child: Container(
                  width: 513,
                  height: 135,
                  decoration: BoxDecoration(
                    color: Color(0xFFFF7070),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  'https://picsum.photos/seed/261/600',
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Transaction No: 2',
                                  // style: FlutterFlowTheme.of(context)
                                  //     .bodyMedium
                                  //     .override(
                                  //       fontFamily: 'Readex Pro',
                                  //       fontSize: 16,
                                  //       fontWeight: FontWeight.w600,
                                  //     ),
                                ),
                                Text(
                                  'Reward Point: 10',
                                  // style:
                                  //     FlutterFlowTheme.of(context).bodyMedium,
                                ),
                                Text(
                                  'Redeemed item: Earphone',
                                  // style:
                                  //     FlutterFlowTheme.of(context).bodyMedium,
                                ),
                                Text(
                                  'Date: 23/6/2023',
                                  // style:
                                  //     FlutterFlowTheme.of(context).bodyMedium,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Status: ',
                                      // style: FlutterFlowTheme.of(context)
                                      //     .bodyMedium,
                                    ),
                                    Text(
                                      'Pending',
                                      // style: FlutterFlowTheme.of(context)
                                      //     .bodyMedium
                                      //     .override(
                                      //       fontFamily: 'Readex Pro',
                                      //       color: Color(0xFFFFFF32),
                                      //     ),
                                    ),
                                  ],
                                ),
                              ]//.divide(SizedBox(height: 5)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                child: Container(
                  width: 513,
                  height: 135,
                  decoration: BoxDecoration(
                    color: Color(0xFFFF7070),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  'https://picsum.photos/seed/261/600',
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Transaction No: 3',
                                  // style: FlutterFlowTheme.of(context)
                                  //     .bodyMedium
                                  //     .override(
                                  //       fontFamily: 'Readex Pro',
                                  //       fontSize: 16,
                                  //       fontWeight: FontWeight.w600,
                                  //     ),
                                ),
                                Text(
                                  'Reward Point: 10',
                                  // style:
                                  //     FlutterFlowTheme.of(context).bodyMedium,
                                ),
                                Text(
                                  'Redeemed item: Earphone',
                                  // style:
                                  //     FlutterFlowTheme.of(context).bodyMedium,
                                ),
                                Text(
                                  'Date: 23/6/2023',
                                  // style:
                                  //     FlutterFlowTheme.of(context).bodyMedium,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Status: ',
                                      // style: FlutterFlowTheme.of(context)
                                      //     .bodyMedium,
                                    ),
                                    Text(
                                      'Pending',
                                      // style: FlutterFlowTheme.of(context)
                                      //     .bodyMedium
                                      //     .override(
                                      //       fontFamily: 'Readex Pro',
                                      //       color: Color(0xFFFFFF32),
                                      //     ),
                                    ),
                                  ],
                                ),
                              ]//.divide(SizedBox(height: 5)),
                            ),
                          ],
                        ),
                      ],
                    ),
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
